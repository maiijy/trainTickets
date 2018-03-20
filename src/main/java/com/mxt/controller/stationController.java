/**
 * 创建时间：2017.12.12
 * 创建者：朱佳言
 */
package com.mxt.controller;

import com.mxt.dao.MotorVehicleMapper;
import com.mxt.dao.TrainlineMapper;
import com.mxt.entity.MotorVehicle;
import com.mxt.entity.Trainline;
import com.mxt.entity.Users;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class stationController {
    @Autowired
    private MotorVehicleMapper motorVehicleMapper;

    @Autowired
    private TrainlineMapper trainlineMapper;

    @RequestMapping("index")
    public String searchPage(Model model,HttpSession session) {
        model.addAttribute("data", motorVehicleMapper.selectAll());
        return "index";
    }

    @RequestMapping("/")
    public String indexPage(Model model,HttpSession session) {
        model.addAttribute("data", motorVehicleMapper.selectAll());
        return "index";
    }
    //    查询直达
    @RequestMapping(value = "/search/direct",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject searchDirect(HttpSession session,
                                   @RequestParam("startName") String startName,
                                   @RequestParam("endName") String endName,
                                   @ModelAttribute Users user){
        JSONObject jsonObject = new JSONObject();
        ArrayList<MotorVehicle> motorVehicles = new ArrayList<MotorVehicle>();
        motorVehicles = motorVehicleMapper.selectByStartAndEnd(startName,endName);
        jsonObject.put("state",0);
        jsonObject.put("result",motorVehicles);
        return jsonObject;
    }

//    中间站点
    @RequestMapping(value = "/search/center",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject searchCenter(HttpSession session,
                                   @RequestParam("startName") String startName,
                                   @RequestParam("endName") String endName,
                                   @ModelAttribute Users user){
        JSONObject jsonObject = new JSONObject();
        ArrayList<MotorVehicle> motorVehicles = new ArrayList<MotorVehicle>();
        motorVehicles = motorVehicleMapper.selectAll();
        Integer num = 0;
        JSONArray jsonArray = new JSONArray();
        for(int i = 0;i < motorVehicles.size(); i ++){
            Integer flag = 0;
            Integer startNum = 0;
            Integer endNum = 0;
            MotorVehicle temp = new MotorVehicle();
            temp = motorVehicles.get(i);
            String motorName;
            motorName = temp.getMotorName();
            ArrayList<Trainline> trainlines = new ArrayList<Trainline>();
            trainlines = trainlineMapper.selectByMotorName(motorName);
            for(int j = 0;j< trainlines.size();j++){
                if(flag == 0){
                    if(startName.equals(trainlines.get(j).getStationName())){
                        startNum = trainlines.get(j).getTlId();
                        flag = 1;
                    }
                }
                if(flag == 1){
                    if(endName.equals(trainlines.get(j).getStationName())){
                        endNum = trainlines.get(j).getTlId();
                        num ++;
                        JSONObject newOne = new JSONObject();
                        newOne.put("car",temp);
                        newOne.put("motorName",motorName);
                        newOne.put("startNum",startNum);
                        newOne.put("endNum",endNum);
                        jsonArray.add(newOne);
                    }
                }
            }
        }
        if(num!=0){
            jsonObject.put("state",0);
            jsonObject.put("result",jsonArray);
        }else{
            jsonObject.put("state",1);
            jsonObject.put("msg","没有直达");
        }
        return jsonObject;
    }

    @RequestMapping(value = "/search/change",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject searchChange(HttpSession session,
                                   @RequestParam("startName") String startName,
                                   @RequestParam("endName") String endName,
                                   @ModelAttribute Users user){
        JSONObject jsonObject = new JSONObject();
        ArrayList<MotorVehicle> motorVehicles = new ArrayList<MotorVehicle>();
        motorVehicles = motorVehicleMapper.selectAll();
        Integer num = 0;
        String start_time = "";
        Integer hour=0;
        Integer min=0;
        JSONArray jsonArray = new JSONArray();
        Integer i;
        for(i = 0;i < motorVehicles.size(); i ++){
            JSONObject All = new JSONObject();
            Integer flag = 0;
            Integer startNum = 0;
            Integer endNum = 0;
            MotorVehicle temp = new MotorVehicle();
            temp = motorVehicles.get(i);
            String motorName;
            String centerName;
            motorName = temp.getMotorName();
            ArrayList<Trainline> trainlines = new ArrayList<Trainline>();
            JSONObject newOne = new JSONObject();
            trainlines = trainlineMapper.selectByMotorName(motorName);
            Integer j;
            for(j = 0;j< trainlines.size();j++){
                Integer t=0;
                if(flag == 0){
                    if(startName.equals(trainlines.get(j).getStationName())){
                        startNum = trainlines.get(j).getTlId();
                        start_time = trainlines.get(j).getStartTime();
                        hour = Integer.valueOf(start_time.split("\\:")[0]);
                        min = Integer.valueOf(start_time.split("\\:")[1]);
                        newOne.put("car",temp);
                        newOne.put("motorName",motorName);
                        newOne.put("startNum",startNum);
                        newOne.put("endNum",endNum);
                        t = 1;
                    }
                }
                else if(flag == 1){
                    centerName = trainlines.get(j).getStationName();
                    Integer in;
                    for(in = 0;in < motorVehicles.size(); in ++){
                        String motor = motorVehicles.get(in).getMotorName();
                        if(motor.equals(motorName)){

                        }else{
                            JSONObject abc = new JSONObject();
                            abc = searchTwo(motor,centerName,endName,hour,min);
                            if(abc.get("motorName").equals("no")){

                            }else{
                                abc.put("car",motorVehicles.get(in));
                                All.put("first",newOne);
                                All.put("next",abc);
                                jsonArray.add(All);
                                num ++;
                                break;
                            }
                        }
                    }
                }
                if(t==1){
                    flag =1;
                }
            }
        }
        if(num != 0){
            jsonObject.put("state",0);
            jsonObject.put("result",jsonArray);
        }else{
            jsonObject.put("state",1);
            jsonObject.put("msg","没有车次");
        }
        return jsonObject;
    }

    public JSONObject searchTwo(String motor,String startName,String endName,Integer hour,Integer min){
        String start_time = "";
        Integer hh;
        Integer mm;
        JSONObject newOne = new JSONObject();
        newOne.put("motorName","no");
        Integer flag = 0;
        Integer startNum = 0;
        Integer endNum = 0;
        ArrayList<Trainline> trainlines = new ArrayList<Trainline>();
        trainlines = trainlineMapper.selectByMotorName(motor);
        for(int j = 0;j< trainlines.size();j++){
            if(flag == 0){
                if(startName.equals(trainlines.get(j).getStationName())){
                    startNum = trainlines.get(j).getTlId();
                    start_time = trainlines.get(j).getStartTime();
                    hh = Integer.valueOf(start_time.split("\\:")[0]);
                    mm = Integer.valueOf(start_time.split("\\:")[1]);
                    if(hh > hour && mm > min){
                        flag = 1;
                    }else{
                        break;
                    }
                }
            }
            if(flag == 1){
                if(endName.equals(trainlines.get(j).getStationName())){
                    endNum = trainlines.get(j).getTlId();
                    newOne.put("motorName",motor);
                    newOne.put("startNum",startNum);
                    newOne.put("endNum",endNum);
                    break;
                }
            }
        }
        return newOne;
    }

    @RequestMapping(value = "/search/detail",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject searchDetail(HttpSession session,
                                   @RequestParam("motorName") String motorName,
                                   @ModelAttribute Users user){
        JSONObject jsonObject = new JSONObject();
        ArrayList<Trainline> trainlines = new ArrayList<Trainline>();
        trainlines = trainlineMapper.selectByMotorName(motorName);
        jsonObject.put("state",0);
        jsonObject.put("result",trainlines);
        return jsonObject;
    }

    @RequestMapping(value = "/search/short",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject searchShort(HttpSession session,
                                   @ModelAttribute Users user){
        JSONObject jsonObject = new JSONObject();
        MotorVehicle motorVehicle = new MotorVehicle();
        motorVehicle = motorVehicleMapper.selectByPrimaryKey(1);
        jsonObject.put("state",0);
        jsonObject.put("result",motorVehicle);
        return jsonObject;
    }

    @RequestMapping(value = "/search/cheap",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject searchCheap(HttpSession session,
                                  @ModelAttribute Users user){
        JSONObject jsonObject = new JSONObject();
        MotorVehicle motorVehicle = new MotorVehicle();
        motorVehicle = motorVehicleMapper.selectByPrimaryKey(2);
        jsonObject.put("state",0);
        jsonObject.put("result",motorVehicle);
        return jsonObject;
    }
}

/**
 * 创建时间：2017.12.17
 * 创建者：马晓婷
 *
 * 修改时间：2017.12.28
 * 修改人：何牧野
 * 修改内容：部分逻辑功能优化
 */
package com.mxt.controller;

import com.mxt.entity.MotorVehicle;
import com.mxt.entity.Stations;
import com.mxt.entity.Users;
import com.mxt.service.MotorVehicleService;
import com.mxt.service.StationService;
import com.mxt.service.UsersService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class manageController {
    @Autowired
    StationService stationService;

    @Autowired
    UsersService usersService;

    @Autowired
    MotorVehicleService motorVehicleService;

    //跳转到管理页面
    @RequestMapping("admin")
    public String toAdmin() {
        return "adminIndex";
    }

    //站点管理
    @RequestMapping(value = "/manage/indexStation",method = RequestMethod.POST)
    public void stations(HttpServletResponse response,@RequestParam("page")int page, @RequestParam("rows")int rows) throws SecurityException, IOException, IllegalAccessError{
          List stations = stationService.selectStationByNum((page-1)*rows, rows);
          int countRows = stationService.getCount();
          Map map = new HashMap();
          map.put("total",countRows);
          map.put("rows",stations);
          JSONObject json = JSONObject.fromObject(map);
          response.getWriter().print(json);
          //return json;
//        JSONObject json = new JSONObject();
//        String js="{'total':28,'rows':[";
//        ArrayList<Stations> list = stationService.selectStationByNum(1);
//        for(Stations station:list){
//            System.out.println(station);
//            js += "{'station_id':" + station.getStationId() + ",'station_name':" + station.getStationName() + ",'station_addr':" + station.getStationAddr()+".'station_railway': " + station.getStationRailway();
//        }
//        js += "]}";
//        json.Data = js;
//        return json;
    }

    //站点管理  删除
    @RequestMapping(value = "/manage/station/delete",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject deleteStation(@RequestParam("id")int station_id){
        JSONObject jsonObject = new JSONObject();
        int result = stationService.deleteByPrimaryKey(station_id);
        jsonObject.put("success", result);
        return jsonObject;
    }

    //站点管理 编辑更新
    @RequestMapping(value = "/manage/station/update{id}",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject updateStation(HttpServletRequest  request)throws IOException{
        JSONObject jsonObject = new JSONObject();
        Stations station = new Stations();
        String station_id = request.getParameter("id");
        station.setStationId(Integer.valueOf(station_id));
        String station_name = request.getParameter("stationName");
        station.setStationName(station_name);
        station.setStationAddr(request.getParameter("stationAddr"));
        station.setStationRailway(request.getParameter("stationRailway"));
        station.setStationLng(request.getParameter("stationLng"));
        station.setStationLat(request.getParameter("stationLat"));
        int result = stationService.updateByPrimaryKeySelective(station);
        jsonObject.put("success", result);
        return jsonObject;
    }

    //站点管理 添加
    @RequestMapping(value = "/manage/station/add",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addStation(HttpServletRequest  request)throws IOException{
        JSONObject jsonObject = new JSONObject();
        Stations station = new Stations();
        //String station_id = request.getParameter("id");
        //station.setStationId(Integer.valueOf(station_id));
        String station_name = request.getParameter("stationName");
        station.setStationName(station_name);
        station.setStationAddr(request.getParameter("stationAddr"));
        station.setStationRailway(request.getParameter("stationRailway"));
        station.setStationLng(request.getParameter("stationLng"));
        station.setStationLat(request.getParameter("stationLat"));
        int result = stationService.insert(station);
        jsonObject.put("success", result);
        return jsonObject;
    }

    //用户管理
    @RequestMapping(value = "/manage/indexUsers",method = RequestMethod.POST)
    public void users(HttpServletResponse response,@RequestParam("page")int page, @RequestParam("rows")int rows) throws SecurityException, IOException, IllegalAccessError{
        List stations = usersService.selectUsersByNum((page-1)*rows, rows);
        int countRows = usersService.getCount();
        Map map = new HashMap();
        map.put("total",countRows);
        map.put("rows",stations);
        JSONObject json = JSONObject.fromObject(map);
        response.getWriter().print(json);
    }

    //用户管理 删除
    @RequestMapping(value = "/manage/user/delete",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject deleteUser(@RequestParam("id")int user_id){
        JSONObject jsonObject = new JSONObject();
        int result = usersService.deleteByPrimaryKey(user_id);
        jsonObject.put("success", result);
        return jsonObject;
    }

    //用户管理 编辑更新
    @RequestMapping(value = "/manage/user/update{id}",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject updateUser(HttpServletRequest  request)throws IOException{
        JSONObject jsonObject = new JSONObject();
        Users user = new Users();
        String user_id = request.getParameter("id");
        user.setId(Integer.valueOf(user_id));
        user.setUsername(request.getParameter("username"));
        user.setPsd(request.getParameter("psd"));
        int result = usersService.updateByPrimaryKeySelective(user);
        jsonObject.put("success", result);
        return jsonObject;
    }

    //用户管理 添加
    @RequestMapping(value = "/manage/user/add",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addUser(HttpServletRequest  request)throws IOException{
        JSONObject jsonObject = new JSONObject();
        Users user = new Users();
        user.setId(Integer.valueOf(request.getParameter("id")));
        user.setUsername(request.getParameter("username"));
        user.setPsd(request.getParameter("psd"));
        int result = usersService.insert(user);
        jsonObject.put("success", result);
        return jsonObject;
    }


    //车次管理
    @RequestMapping(value = "/manage/indexMotors",method = RequestMethod.POST)
    public void motors(HttpServletResponse response,@RequestParam("page")int page, @RequestParam("rows")int rows) throws SecurityException, IOException, IllegalAccessError{
        List motors = motorVehicleService.selectMotorsByNum((page-1)*rows, rows);
        int countRows = motorVehicleService.getCount();
        Map map = new HashMap();
        map.put("total",countRows);
        map.put("rows",motors);
        JSONObject json = JSONObject.fromObject(map);
        response.getWriter().print(json);
    }

    //车次管理 删除
    @RequestMapping(value = "/manage/motor/delete",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject deleteMotor(@RequestParam("id")int motor_id){
        JSONObject jsonObject = new JSONObject();
        int result = motorVehicleService.deleteByPrimaryKey(motor_id);
        jsonObject.put("success", result);
        return jsonObject;
    }

    //车次管理 编辑更新
    @RequestMapping(value = "/manage/motor/update{id}",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject updateMotor(HttpServletRequest  request)throws IOException{
        JSONObject jsonObject = new JSONObject();
        MotorVehicle motorVehicle = new MotorVehicle();
        String motor_id = request.getParameter("id");
        motorVehicle.setMotorId(Integer.valueOf(motor_id));
        motorVehicle.setMotorName(request.getParameter("motorName"));
        motorVehicle.setCarName(request.getParameter("carName"));
        motorVehicle.setCarType(request.getParameter("carType"));
        motorVehicle.setStartName(request.getParameter("startName"));
        motorVehicle.setEndName(request.getParameter("endName"));
        motorVehicle.setStartTime(request.getParameter("startTime"));
        motorVehicle.setEndTime(request.getParameter("endTime"));
        motorVehicle.setMiles(request.getParameter("miles"));
        int result = motorVehicleService.updateByPrimaryKeySelective(motorVehicle);
        jsonObject.put("success", result);
        return jsonObject;
    }

    //车次管理 添加
    @RequestMapping(value = "/manage/motor/add",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addMotor(HttpServletRequest  request)throws IOException{
        JSONObject jsonObject = new JSONObject();
        MotorVehicle motorVehicle = new MotorVehicle();
        motorVehicle.setMotorName(request.getParameter("motorName"));
        motorVehicle.setCarName(request.getParameter("carName"));
        motorVehicle.setCarType(request.getParameter("carType"));
        motorVehicle.setStartName(request.getParameter("startName"));
        motorVehicle.setEndName(request.getParameter("endName"));
        motorVehicle.setStartTime(request.getParameter("startTime"));
        motorVehicle.setEndTime(request.getParameter("endTime"));
        motorVehicle.setMiles(request.getParameter("miles"));
        int result = motorVehicleService.insert(motorVehicle);
        jsonObject.put("success", result);
        return jsonObject;
    }
}

/**
 * 创建时间：2017.12.13
 * 创建者：李彤
 */
package com.mxt.controller;

import com.mxt.entity.Users;
import com.mxt.service.MotorVehicleService;
import com.mxt.service.UsersService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class mainController {
    @Autowired
    UsersService usersService;

    @Autowired
    MotorVehicleService motorVehicleService;

    //跳转到登录页面
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toLogin() {
        return "login";
    }

    //实现登录功能，将用户信息保存在session里面
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject login(HttpSession session, @RequestParam("name") String name, @RequestParam("pwd") String pwd, @ModelAttribute Users user){
        JSONObject jsonObject = new JSONObject();
        Users record = new Users();
        record.setUsername(name);
        ArrayList<Users> list = usersService.selectSelective(record);
        if(list.size() == 0 ){
            jsonObject.put("result", "0"); //该用户不存在
        }else{
            record.setPsd(pwd);
            list = usersService.selectSelective(record);
            if(list.size() == 0) {
                jsonObject.put("result", "1"); //密码错误
            }else{
                jsonObject.put("result", "success"); //登录成功
                record = list.get(0);
                //将用户信息保存在session里面
                session.setAttribute("user",record);
            }
        }
        return jsonObject;
    }

    //退出登录，注销账户
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject logout(HttpSession session) {
        session.invalidate(); //销毁session
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result",1);
//        session.removeAttribute("user");
        return jsonObject;
    }

}

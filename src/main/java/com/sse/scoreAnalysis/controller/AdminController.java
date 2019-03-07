package com.sse.scoreAnalysis.controller;

import com.sse.scoreAnalysis.model.*;
import com.sse.scoreAnalysis.service.AdministratorService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdministratorService administratorService;
    @RequestMapping("/")
    public String mainPage(HttpServletRequest request, HttpSession session) {
        String info= (String) session.getAttribute("info");
        if(info!=null){
            request.setAttribute("info",info);
        }
        //查询教务管理员基本信息
        User user = (User) session.getAttribute("user");
        Administrator administrator = administratorService.getAdministratorInfo(user.getUserId());
        JSONObject jsonObject = JSONObject.fromObject(administrator);
        session.setAttribute("administrator", jsonObject);
        //查询各院人数

        //查询各院尚未
        return "adminMain";
    }

}

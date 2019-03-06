package com.sse.scoreAnalysis.controller;

import com.sse.scoreAnalysis.model.*;
import com.sse.scoreAnalysis.model.Class;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/")
    public String mainPage(HttpSession session) {

        return "adminMain";
    }

}

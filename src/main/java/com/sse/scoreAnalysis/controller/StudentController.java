package com.sse.scoreAnalysis.controller;

import com.sse.scoreAnalysis.model.Student;
import com.sse.scoreAnalysis.model.User;
import com.sse.scoreAnalysis.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    @RequestMapping("/")
    public String mainPage(HttpSession session){
        //从session中取出user信息
        User user=(User) session.getAttribute("user");
        //将该学生的基本信息存入session中
        Student student=studentService.getStudentInfo(user.getUserId());
        session.setAttribute("student",student);
        return "studentMain";
    }
}

package com.sse.scoreAnalysis.controller;


import com.sse.scoreAnalysis.model.*;
import com.sse.scoreAnalysis.model.Class;
import com.sse.scoreAnalysis.service.ClassService;
import com.sse.scoreAnalysis.service.StudentAnalysisService;
import com.sse.scoreAnalysis.service.StudentCourseService;
import com.sse.scoreAnalysis.service.StudentService;
import com.sse.scoreAnalysis.utils.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private StudentAnalysisService studentAnalysisService;
    @Autowired
    private ClassService classService;
    @Autowired
    private StudentCourseService studentCourseService;

    @RequestMapping("/")
    public String mainPage(HttpSession session){
        //从session中取出user信息
        User user=(User) session.getAttribute("user");
        //将该学生的基本信息存入session中
        Student student=studentService.getStudentInfo(user.getUserId());
        session.setAttribute("student",student);
        Class cls=classService.getClassInfo(student.getClassid());
        session.setAttribute("class",cls);
        //查询学生班级总人数
        //int studentCountInClass=studentService.getStudentNumByClass(student.getClassid());
        //查询同年级总人数
        int studentCountInGrade=studentService.getStudentNumInSameMajor(student.getClassid());
        Map<String, Object> resultMap=new HashMap<>();
        //resultMap.put("studentCountC",studentCountInClass);
        resultMap.put("studentCountG",studentCountInGrade);
        session.setAttribute("studentInfo",resultMap);
        return "studentMain";
    }
    /*
    负责整个session里重复跳转
     */
    @RequestMapping("/info")
    public String studentMain(){
        return "studentMain";
    }
    /*
    跳转到学生成绩分析页面
     */
    @RequestMapping("/analysis")
    public String analysisPage(){
        return "studentAnalysis";
    }

    /*
    ajax根据学生id返回各学期的成绩分析
     */
    @RequestMapping(value="/allAnalysis",method= RequestMethod.POST)
    @ResponseBody
    //这个注解会自动调用相关jar包的api将你要返回的对象自动的转化为JSON字符串后，封装到response中，然后返回给浏览器
    public Message allAnalysis(@RequestParam("studentId") String studentId){
        Message result;
        //查询该学生各学期的总智育成绩和排名
        List<StudentAnalysis> studentAnalyses=studentAnalysisService.getAllAnalysis(studentId);
        List<StudentCourse> studentCourses=studentCourseService.getAllStudentCourseList(studentId);
        if(!studentAnalyses.isEmpty() && !studentCourses.isEmpty()){
            //如果均不为空，返回查询成功
            result=Message.success().add("list",studentAnalyses);
            result.add("studentCourseList",studentCourses);
        }else {
            //至少其中一个为空，返回失败
            result=Message.fail("查询失败");
        }
        return result;
    }
}

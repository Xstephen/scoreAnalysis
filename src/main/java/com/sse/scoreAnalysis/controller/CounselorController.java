package com.sse.scoreAnalysis.controller;

import com.sse.scoreAnalysis.model.*;
import com.sse.scoreAnalysis.model.Class;
import com.sse.scoreAnalysis.service.*;
import com.sse.scoreAnalysis.utils.Message;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/counselor")
public class CounselorController {
    @Autowired
    private CounselorService counselorService;
    @Autowired
    private ClassService classService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private StudentAnalysisService studentAnalysisService;
    @Autowired
    private StudentCourseService studentCourseService;
    @Autowired
    private CollegeCourseService collegeCourseService;
    @RequestMapping("/")
    public String mainPage(HttpSession session){
        //查询辅导员基本信息
        User user= (User) session.getAttribute("user");
        Counselor counselor=counselorService.getCounselorWithCollegeById(user.getUserId());
        JSONObject jsonObject=JSONObject.fromObject(counselor);
        session.setAttribute("counselor",jsonObject);
        //该辅导员管理的班级列表
        List<Class> classes=classService.getClassListByCounselorId(user.getUserId());
        JSONArray jsonArray =JSONArray.fromObject(classes);
        session.setAttribute("classList",jsonArray);
        //查询管理总人数
//        int count=studentService.getStudentNumInClassList(classes);
//        Map<String, Object> resultMap=new HashMap<>();
//        //resultMap.put("studentCountC",studentCountInClass);
//        resultMap.put("studentCountC",count);
//        session.setAttribute("studentInfo",resultMap);
        return "counselorMain";
    }
    /*
    负责整个session里重复跳转
     */
    @RequestMapping("/analysis")
    public String studentMain(){
        return "counselorMain";
    }

    /*
    ajax 查询对应classlist的所有学生信息
     */
    @RequestMapping(value="/allStudentInfo",method = RequestMethod.POST)
    @ResponseBody
    public Message getAllStudentInfo(HttpSession session){
        Message result;
        JSONArray jsonArray= (JSONArray) session.getAttribute("classList");
        List<String> classIdList=new ArrayList<>();
        for (int i = 0; i < jsonArray.size(); i++) {
            classIdList.add((String) jsonArray.getJSONObject(i).get("classid"));
        }
        String classId=(String) jsonArray.getJSONObject(0).get("classid");
        int year=Integer.valueOf(classId.substring(0,4));
        List<Student> studentList =studentService.getStudentInfoByClassIdList(classIdList);
        List<String> studentIdList=new ArrayList<>();
        for (int i = 0; i <studentList.size() ; i++) {
            studentIdList.add(studentList.get(i).getStudentid());
        }
        List<StudentCourse> yearTermList=studentCourseService.getYearTermInStudentIdList(studentIdList);
        List<StudentCourse> yearList=studentCourseService.getYearInStudentIdList(studentIdList);
        List<String> resultList=new ArrayList<>();
        for (StudentCourse studentCourse:yearTermList) {
            if(year<=Integer.valueOf(studentCourse.getYear().substring(0,4))){
                resultList.add(studentCourse.getYear()+'+'+studentCourse.getTerm());
            }
        }
        List<String> resultYearList=new ArrayList<>();
        for (StudentCourse studentCourse:yearList) {
            if(year<=Integer.valueOf(studentCourse.getYear().substring(0,4))){
                resultYearList.add(studentCourse.getYear());
            }
        }
        Collections.sort(resultList, new Comparator<String>(){
            public int compare(String s1, String s2) {
                String[] strings1=s1.split("\\+");
                String[] strings2=s2.split("\\+");
                int year1=Integer.valueOf(strings1[0].substring(0,4));
                int year2=Integer.valueOf(strings2[0].substring(0,4));
                int term1=Integer.valueOf(strings1[1]);
                int term2=Integer.valueOf(strings2[1]);
                if(year1<year2){
                    return -1;
                }
                else if (year1==year2){
                    if(term1<term2){
                        return -1;
                    }else if(term1>term2){
                        return 1;
                    }else {
                        return 0;
                    }
                }else {
                    return 1;
                }
            }
        });
        Collections.sort(resultYearList, new Comparator<String>(){
            public int compare(String s1, String s2) {
                int year1=Integer.valueOf(s1.substring(0,4));
                int year2=Integer.valueOf(s2.substring(0,4));
                if(year1<year2){
                    return -1;
                }
                else if (year1==year2){
                    return 0;
                }else {
                    return 1;
                }
            }
        });
        if(studentList.size()>0){
            //查询成功
            result=Message.success().add("studentList",studentList).add("yearTermList",resultList).add("yearList",resultYearList);
        }else {
            result=Message.fail("查询学生信息失败，请刷新重试！");
        }
        return result;
    }
    /*
    ajax 选择不同学年
    */
    @RequestMapping(value="/yearStudentAnalysisInfo",method = RequestMethod.POST)
    @ResponseBody
    public Message getYearStudentInfo(@RequestParam("studentList")String studentList,@RequestParam("year")String year){
        Message result;
        JSONArray studentArray=JSONArray.fromObject(studentList);
        List<String> studentIdList=new ArrayList<>();
        for (int i = 0; i < studentArray.size(); i++) {
            studentIdList.add((String) studentArray.getJSONObject(i).get("studentid"));
        }
        List<StudentAnalysis> studentAnalysisList=studentAnalysisService.getYearStudentAnalysisInStudentIdList(studentIdList,year);
        if(studentAnalysisList.size()>0){
            //查询成功
            result=Message.success().add("yearStudentList",studentAnalysisList);
        }else {
            result=Message.fail("查询"+year+"学生信息失败，请刷新重试！");
        }
        return result;
    }
    /*
    ajax 选择不同学期
     */
    @RequestMapping(value="/termStudentAnalysisInfo",method = RequestMethod.POST)
    @ResponseBody
    public Message getTermStudentInfo(@RequestParam("studentList")String studentList,@RequestParam("year")String year,@RequestParam("term")String term){
        Message result;
        JSONArray studentArray=JSONArray.fromObject(studentList);
        List<String> studentIdList=new ArrayList<>();
        for (int i = 0; i < studentArray.size(); i++) {
            studentIdList.add((String) studentArray.getJSONObject(i).get("studentid"));
        }
        List<StudentAnalysis> studentAnalysisList=studentAnalysisService.getTermStudentAnalysisInStudentIdList(studentIdList,year,term);
        if(studentAnalysisList.size()>0){
            //查询成功
            result=Message.success().add("termStudentList",studentAnalysisList);
        }else {
            result=Message.fail("查询"+year+"学生信息失败，请刷新重试！");
        }
        return result;
    }
    /*
    ajax根据学生id返回各学期的成绩分析
     */
    @RequestMapping(value="/studentAnalysis",method= RequestMethod.POST)
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
    /*
  ajax根据collegeCourse的主键返回该课程的分析结果
   */
    @RequestMapping(value="/courseDetail",method= RequestMethod.POST)
    @ResponseBody
    //这个注解会自动调用相关jar包的api将你要返回的对象自动的转化为JSON字符串后，封装到response中，然后返回给浏览器
    public Message allAnalysis(CollegeCourseKey collegeCourseKey){
        Message result;
        CollegeCourse collegeCourse=collegeCourseService.getCollegeCourseByKey(collegeCourseKey);
        if(collegeCourse!=null){
            result=Message.success().add("collegeCourse",collegeCourse);
        }else{
            result=Message.fail("查询课程详情失败，请重试！");
        }
        return result;
    }
}

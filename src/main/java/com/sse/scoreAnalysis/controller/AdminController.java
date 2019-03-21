package com.sse.scoreAnalysis.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sse.scoreAnalysis.model.*;
import com.sse.scoreAnalysis.service.*;
import com.sse.scoreAnalysis.utils.Message;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdministratorService administratorService;
    @Autowired
    CollegeAnalysisService collegeAnalysisService;
    @Autowired
    StudentService studentService;
    @Autowired
    StudentAnalysisService studentAnalysisService;
    @Autowired
    StudentCourseService studentCourseService;
    @Autowired
    CollegeCourseService collegeCourseService;

    @RequestMapping("/")
    public String mainPage(HttpServletRequest request, HttpSession session) {
        String info = (String) session.getAttribute("info");
        if (info != null) {
            request.setAttribute("info", info);
        }
        //查询教务管理员基本信息
        User user = (User) session.getAttribute("user");
        Administrator administrator = administratorService.getAdministratorInfo(user.getUserId());
        JSONObject jsonObject = JSONObject.fromObject(administrator);
        session.setAttribute("administrator", jsonObject);
        return "adminMain";
    }

    @RequestMapping(value = "/getFailurePercentage", method = RequestMethod.POST)
    @ResponseBody
    public Message getFailurePercentage() {
        Message result = null;
        //查询各院平均不及格率
        List<CollegeAnalysis> collegeList = collegeAnalysisService.getFailurePercentageInCollege();
        //查询各专业平均不及格率
        List<CollegeAnalysis> majorList = collegeAnalysisService.getFailurePercentageInMajor();
        //查询各专业年级平均不及格率
        List<CollegeAnalysis> gradeList = collegeAnalysisService.getFailurePercentageInGrade();
        if (collegeList != null & majorList != null & gradeList != null) {
            result = Message.success().add("collegeList", collegeList).add("majorList", majorList).add("gradeList", gradeList);
        } else {
            result = Message.fail("查询数据失败，请刷新重试！");
        }
        return result;
    }
    /*
    ajax 查询对应classlist的所有学生信息
     */
//    @RequestMapping(value = "/getStudentInfo", method = RequestMethod.POST)
//    @ResponseBody
//    public Message getAllStudentInfo(@Param("scale")String scale,CollegeAnalysis collegeAnalysis) {
//        Message result;
//        //当前大四学生
//        Calendar date = Calendar.getInstance();
//        int currentYear = Integer.valueOf(date.get(Calendar.YEAR));
//        String year=String.valueOf(currentYear-4);
//        List<Student> students=null;
//        if(scale.equals("学院")){
//            //查出该学院的所有学生信息
//            students=studentService.getStudentInfoInCollege(collegeAnalysis.getCollegeid(),year);
//        }
//        if(students.size()>0){
//            result=Message.success().add("studentList",students);
//        }else{
//            result=Message.fail("查询学生信息失败，请重试！");
//        }
//        return result;
//    }

    @RequestMapping(value = "/getTermInfo", method = RequestMethod.POST)
    @ResponseBody
    public Message getTermInfo(@RequestBody Map<String, String> req) {
        Message result;
        String collegeId = req.get("collegeid");
        String majorId = req.get("majorid");
        String grade = req.get("grade");
        //当前大四学生
        Calendar date = Calendar.getInstance();
        int currentYear = Integer.valueOf(date.get(Calendar.YEAR));
        String year = String.valueOf(currentYear - 4);
        List<StudentAnalysis> yearTermList = studentAnalysisService.getYearTerm(collegeId, majorId, grade, year);
//        List<StudentAnalysis> yearList = studentAnalysisService.getYear(collegeId,majorId,grade,year);
        List<String> resultList = new ArrayList<>();
        List<String> resultYearList = new ArrayList<>();
        for (StudentAnalysis studentAnalysis : yearTermList) {
            if (Integer.parseInt(year) <= Integer.valueOf(studentAnalysis.getYear().substring(0, 4))) {
                if (studentAnalysis.getTerm() != 0) {
                    resultList.add(studentAnalysis.getYear() + '+' + studentAnalysis.getTerm());
                    if (!resultYearList.contains(studentAnalysis.getYear())) {
                        resultYearList.add(studentAnalysis.getYear());
                    }
                }
            }
        }
        //查询挂科较多，成绩上升的学生
        List<Student> failureList = studentService.getStudentHaveFail(collegeId, majorId, grade);
        List<Student> ascendList = studentService.getStudentAsc(collegeId, majorId, grade);
        if (resultList.size() > 0 && resultYearList.size() > 0) {
            result = Message.success().add("yearTermList", resultList).add("yearList", resultYearList).add("failureList", failureList).add("ascendList", ascendList);
        } else {
            result = Message.fail("查询数据失败，请重试！");
        }
        return result;
    }

    @RequestMapping(value = "/getStudentInfo", method = RequestMethod.POST)
    @ResponseBody
    public Message getAllStudentInfo(@RequestBody Map<String, String> req) {
        Message result;
        String draw = req.get("draw");
        String startIndex = req.get("start");
        String pageSize = req.get("length");

        String searchCondition = req.get("search");
        if (searchCondition == "") {
            searchCondition = null;
        }
        String scale = req.get("scale");
        List<Student> students = new ArrayList<>();
        //当前大四学生
        Calendar date = Calendar.getInstance();
        int currentYear = Integer.valueOf(date.get(Calendar.YEAR));
        String year = String.valueOf(currentYear - 4);
        PageHelper.offsetPage(Integer.parseInt(startIndex), Integer.parseInt(pageSize));
        if (scale.equals("学院")) {
            String collegeId = req.get("collegeid");
            students = studentService.getStudentInfoInCollege(collegeId, year, searchCondition);
        } else if (scale.equals("专业")) {
            String collegeId = req.get("collegeid");
            String majorId = req.get("majorid");
            students = studentService.getStudentInfoInMajor(collegeId, majorId, year, searchCondition);
        } else if (scale.equals("all")) {
            students = studentService.getStudentInfoInSchool(year, searchCondition);
        } else {
            String collegeId = req.get("collegeid");
            String majorId = req.get("majorid");
            String grade = req.get("grade");
            students = studentService.getStudentInfoInGrade(collegeId, majorId, grade, year, searchCondition);
        }
        PageInfo<Student> pageInfo = new PageInfo<Student>(students);
        Map<Object, Object> info = new HashMap<Object, Object>();
        if (pageInfo != null) {
            info.put("pageData", pageInfo.getList());
            info.put("total", pageInfo.getTotal());
            info.put("draw", draw);
            result = Message.success().add("info", JSONObject.fromObject(info));
        } else {
            result = Message.fail("查询失败，请刷新重试!");
        }
        return result;
    }

    @RequestMapping(value = "/getStudentAnalysis", method = RequestMethod.POST)
    @ResponseBody
    public Message getStudentAnalysis(@RequestBody Map<String, String> req) {
        Message result;
        String draw = req.get("draw");
        String startIndex = req.get("start");
        String pageSize = req.get("length");

        String searchCondition = req.get("search");
        if (searchCondition == "") {
            searchCondition = null;
        }
        String studyYear = req.get("year");
        String term = req.get("term");

        String collegeid = req.get("collegeid");
        String majorid = req.get("majorid");
        String grade = req.get("grade");

        PageHelper.offsetPage(Integer.parseInt(startIndex), Integer.parseInt(pageSize));
        List<StudentAnalysis> studentAnalyses = studentAnalysisService.getStudentAnalysisByCondition(collegeid, majorid, grade, studyYear, term, searchCondition);
        PageInfo<StudentAnalysis> pageInfo = new PageInfo<StudentAnalysis>(studentAnalyses);
        Map<Object, Object> info = new HashMap<Object, Object>();
        if (pageInfo != null) {
            info.put("pageData", pageInfo.getList());
            info.put("total", pageInfo.getTotal());
            info.put("draw", draw);
            result = Message.success().add("info", info);
        } else {
            result = Message.fail("查询失败，请刷新重试!");
        }
        return result;
    }

    @RequestMapping(value = "/getAttentionListByTerm", method = RequestMethod.POST)
    @ResponseBody
    public Message getAttentionListByTerm(@RequestBody Map<String, String> req) {
        Message result;
        String collegeId = req.get("collegeid");
        String majorId = req.get("majorid");
        String grade = req.get("grade");

        String year = req.get("year");
        String term = req.get("term");
        //查询挂科较多，成绩上升的学生
        List<StudentAnalysis> failureList = studentAnalysisService.getStudentAnalysisHaveFailByTerm(collegeId, majorId, grade, year, term);
        List<StudentAnalysis> ascendList = studentAnalysisService.getStudentAnalysisAscByTerm(collegeId, majorId, grade, year, term);
        if (failureList.size() >= 0 && ascendList.size() >= 0) {
            result = Message.success().add("failureList", failureList).add("ascendList", ascendList);
        } else {
            result = Message.fail("查询数据失败，请重试！");
        }
        return result;
    }

    /*
   ajax根据学生id返回各学期的成绩分析
    */
    @RequestMapping(value = "/studentAnalysis", method = RequestMethod.POST)
    @ResponseBody
    //这个注解会自动调用相关jar包的api将你要返回的对象自动的转化为JSON字符串后，封装到response中，然后返回给浏览器
    public Message allAnalysis(@RequestParam("studentId") String studentId) {
        Message result;
        //查询该学生各学期的总智育成绩和排名
        List<StudentAnalysis> studentAnalyses = studentAnalysisService.getAllAnalysis(studentId);
        List<StudentCourse> studentCourses = studentCourseService.getAllStudentCourseList(studentId);
        if (!studentAnalyses.isEmpty() && !studentCourses.isEmpty()) {
            //如果均不为空，返回查询成功
            result = Message.success().add("list", studentAnalyses);
            result.add("studentCourseList", studentCourses);
        } else {
            //至少其中一个为空，返回失败
            result = Message.fail("查询失败");
        }
        return result;
    }

    /*
 ajax根据collegeCourse的主键返回该课程的分析结果
  */
    @RequestMapping(value = "/courseDetail", method = RequestMethod.POST)
    @ResponseBody
    //这个注解会自动调用相关jar包的api将你要返回的对象自动的转化为JSON字符串后，封装到response中，然后返回给浏览器
    public Message getCourseDetail(CollegeCourseKey collegeCourseKey, @RequestParam("studentId") String studentId, @RequestParam("score") Integer score) {
        Message result;
        CollegeCourse collegeCourse = collegeCourseService.getCollegeCourseByKey(collegeCourseKey);
        List<StudentCourse> studentCourseList = new ArrayList<>();
        if (score < 60) {
            //第一次小于60 查询重考信息
            studentCourseList = studentCourseService.getReexamineInfo(collegeCourseKey, studentId);
        }
        if (collegeCourse != null) {
            result = Message.success().add("collegeCourse", collegeCourse).add("reexamineList", studentCourseList);
        } else {
            result = Message.fail("查询课程详情失败，请重试！");
        }
        return result;
    }

    /**
     * 显示课程分析
     */
    @RequestMapping(value = "/getCourseInMajor", method = RequestMethod.POST)
    @ResponseBody
    public Message getCourseInMajor(@RequestBody Map<String, String> req) {
        Message result;
        String draw = req.get("draw");
        String startIndex = req.get("start");
        String pageSize = req.get("length");

        String searchCondition = req.get("search");
        if (searchCondition == "") {
            searchCondition = null;
        }
        String scale = req.get("scale");
        List<Student> students = new ArrayList<>();
        //当前大四学生
        Calendar date = Calendar.getInstance();
        int currentYear = Integer.valueOf(date.get(Calendar.YEAR));
        String year = String.valueOf(currentYear - 4) + '-' + (currentYear - 3);
        PageHelper.offsetPage(Integer.parseInt(startIndex), Integer.parseInt(pageSize));
        String collegeId = req.get("collegeid");
        String majorId = req.get("majorid");
        //查询该学院、专业、开课时间大于year的课程
        List<CollegeCourse> collegeCourses = collegeCourseService.getCollegeCourseInMajor(collegeId, majorId, year, searchCondition);
        PageInfo<CollegeCourse> pageInfo = new PageInfo<CollegeCourse>(collegeCourses);
        Map<Object, Object> info = new HashMap<Object, Object>();
        if (pageInfo != null) {
            info.put("pageData", pageInfo.getList());
            info.put("total", pageInfo.getTotal());
            info.put("draw", draw);
            result = Message.success().add("info", JSONObject.fromObject(info));
        } else {
            result = Message.fail("查询失败，请刷新重试!");
        }
        return result;
    }


    //查询某课程的各年级的信息
    @RequestMapping(value = "/getCourseCompareDetail", method = RequestMethod.POST)
    @ResponseBody
    public Message getCourseCompareDetail(@RequestBody Map<String, String> req) {
        Message result;
        String collegeId = req.get("collegeid");
        String majorId = req.get("majorid");
        String courseId = req.get("courseid");

        List<CollegeCourse> collegeCourses = collegeCourseService.getCollegeCourseCompare(collegeId, majorId, courseId);
        if (collegeCourses.size() > 0) {
            result = Message.success().add("compareList", collegeCourses);
        } else {
            result = Message.fail("查询课程信息失败，请刷新重试！");
        }
        return result;
    }

    /**
     * 显示某年级课程分析
     */
    @RequestMapping(value = "/getCourseInGrade", method = RequestMethod.POST)
    @ResponseBody
    public Message getCourseInGrade(@RequestBody Map<String, String> req) {
        Message result;
        String draw = req.get("draw");
        String startIndex = req.get("start");
        String pageSize = req.get("length");

        String searchCondition = req.get("search");
        if (searchCondition == "") {
            searchCondition = null;
        }
        List<Student> students = new ArrayList<>();
        PageHelper.offsetPage(Integer.parseInt(startIndex), Integer.parseInt(pageSize));
        String collegeId = req.get("collegeid");
        String majorId = req.get("majorid");
        String grade = req.get("grade");

        String year = req.get("year");
        String term = req.get("term");
        //查询该学院、专业、开课时间大于year的课程
        List<CollegeCourse> collegeCourses = collegeCourseService.getCollegeCourseInGrade(collegeId, majorId, grade, year, term, searchCondition);
        PageInfo<CollegeCourse> pageInfo = new PageInfo<CollegeCourse>(collegeCourses);
        Map<Object, Object> info = new HashMap<Object, Object>();
        if (pageInfo != null) {
            info.put("pageData", pageInfo.getList());
            info.put("total", pageInfo.getTotal());
            info.put("draw", draw);
            result = Message.success().add("info", JSONObject.fromObject(info));
        } else {
            result = Message.fail("查询失败，请刷新重试!");
        }
        return result;
    }

    @RequestMapping(value = "/getTermInGrade", method = RequestMethod.POST)
    @ResponseBody
    public Message getTermInGrade(@RequestBody Map<String, String> req) {
        Message result;
        String collegeId = req.get("collegeid");
        String majorId = req.get("majorid");
        String grade = req.get("grade");
        //查询该年级学生的学期
        List<StudentCourse> yearTermList = studentCourseService.getYearTermInStudents(collegeId, majorId, grade);
        List<String> resultList = new ArrayList<>();
        for (StudentCourse studentCourse : yearTermList) {
            resultList.add(studentCourse.getYear() + '+' + studentCourse.getTerm());
        }
        Collections.sort(resultList, new Comparator<String>() {
            public int compare(String s1, String s2) {
                String[] strings1 = s1.split("\\+");
                String[] strings2 = s2.split("\\+");
                int year1 = Integer.valueOf(strings1[0].substring(0, 4));
                int year2 = Integer.valueOf(strings2[0].substring(0, 4));
                int term1 = Integer.valueOf(strings1[1]);
                int term2 = Integer.valueOf(strings2[1]);
                if (year1 < year2) {
                    return -1;
                } else if (year1 == year2) {
                    if (term1 < term2) {
                        return -1;
                    } else if (term1 > term2) {
                        return 1;
                    } else {
                        return 0;
                    }
                } else {
                    return 1;
                }
            }
        });
        if (resultList.size() > 0) {
            result = Message.success().add("yearTermList", resultList);
        } else {
            result = Message.fail("查询该年级学期信息失败，请刷新重试！");
        }
        return result;
    }

    /**
     * 显示某年级课程分析
     */
    @RequestMapping(value = "/getStudentInfoInCourse", method = RequestMethod.POST)
    @ResponseBody
    public Message studentInfoInCourse(@RequestBody Map<String, String> req) {
        Message result;
        String collegeid = req.get("collegeid");
        String majorid = req.get("majorid");
        String courseid = req.get("courseid");
        String year = req.get("year");
        Integer term = Integer.valueOf(req.get("term"));
        String grade = req.get("grade");
        List<StudentCourse> studentCourseList = studentCourseService.getStudentCourseByCourseInGrade(collegeid, majorid, courseid, year, term, grade);
        if (studentCourseList.size() > 0) {
            result = Message.success().add("studentCourseList", studentCourseList);
        } else {
            result = Message.fail("查询该课程学生信息失败，请重试！");
        }
        return result;
    }

}

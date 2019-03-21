package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.Class;
import com.sse.scoreAnalysis.model.Student;

import java.util.List;

public interface StudentService {
    Student getStudentInfo(String studentId);
    List<Student> getStudentInfoByClassIdList(List<String> classIdList);
    int getStudentNumByClass(String classId);
    //获得同专业同年级学生数量
    int getStudentNumInSameMajor(String classId);
    //获得班级列表中学生数量
    int getStudentNumInClassList(List<Class> classList);

    List<Student> getStudentInfoInCollege(String collegeid, String year,String condition);

    List<Student> getStudentInfoInMajor(String collegeId, String majorId, String year,String condition);

    List<Student> getStudentInfoInGrade(String collegeId, String majorId, String grade, String year,String condition);

    List<Student> getStudentHaveFail(String collegeId, String majorId, String grade);

    List<Student> getStudentAsc(String collegeId, String majorId, String grade);

    List<Student> getStudentInfoInSchool(String year, String searchCondition);

}

package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.StudentCourseMapper;
import com.sse.scoreAnalysis.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class StudentCourseServiceImpl implements StudentCourseService{

    @Autowired
    private StudentCourseMapper studentCourseMapper;

    @Override
    public List<StudentCourse> getAllStudentCourseList(String studentId) {
        StudentCourseExample studentCourseExample=new StudentCourseExample();
        StudentCourseExample.Criteria criteria=studentCourseExample.createCriteria();
        criteria.andStudentidEqualTo(studentId);
        //已给出成绩不是预测成绩
        criteria.andFlagEqualTo(1);
        //first为1
        criteria.andFirstEqualTo(1);
        //返回该学生所有学期的课程成绩
        return studentCourseMapper.selectByExampleWithCourse(studentCourseExample);
    }

    @Override
    public List<StudentCourse> getYearTermInStudentIdList(List<String> studentIdList) {
        StudentCourseExample studentCourseExample=new StudentCourseExample();
        StudentCourseExample.Criteria criteria=studentCourseExample.createCriteria();
        criteria.andStudentidIn(studentIdList);
        return studentCourseMapper.selectYearTermByExample(studentCourseExample);
    }

    @Override
    public List<StudentCourse> getYearInStudentIdList(List<String> studentIdList) {
        StudentCourseExample studentCourseExample=new StudentCourseExample();
        StudentCourseExample.Criteria criteria=studentCourseExample.createCriteria();
        criteria.andStudentidIn(studentIdList);
        return studentCourseMapper.selectYearByExample(studentCourseExample);
    }

    @Override
    public List<StudentCourse> getStudentCourseByCourse(String collegeid, String majorid, String courseid, String year, Integer term,List<String> studentIdList) {
        StudentCourseExample studentCourseExample=new StudentCourseExample();
        StudentCourseExample.Criteria criteria=studentCourseExample.createCriteria();
        criteria.andCollegeidEqualTo(collegeid);
        criteria.andMajoridEqualTo(majorid);
        criteria.andCourseidEqualTo(courseid);
        criteria.andYearEqualTo(year);
        criteria.andTermEqualTo(term);
        criteria.andStudentidIn(studentIdList);
        criteria.andFirstEqualTo(1);
        //连同学生信息一起查出来
        return studentCourseMapper.selectByExampleWithStudent(studentCourseExample);
    }

    @Override
    public List<StudentCourse> getReexamineInfo(CollegeCourseKey collegeCourseKey, String studentId) {
        StudentCourseExample studentCourseExample=new StudentCourseExample();
        StudentCourseExample.Criteria criteria=studentCourseExample.createCriteria();
        criteria.andCollegeidEqualTo(collegeCourseKey.getCollegeid());
        criteria.andMajoridEqualTo(collegeCourseKey.getMajorid());
        criteria.andCourseidEqualTo(collegeCourseKey.getCourseid());
        criteria.andStudentidEqualTo(studentId);
        criteria.andFirstEqualTo(0);
        return studentCourseMapper.selectByExample(studentCourseExample);
    }

    @Override
    public List<StudentCourse> getYearTermInStudents(String collegeId, String majorId, String grade) {
        return studentCourseMapper.selectYearTermInStudents(collegeId,majorId,grade);
    }

    @Override
    public List<StudentCourse> getStudentCourseByCourseInGrade(String collegeid, String majorid, String courseid, String year, Integer term, String grade) {
        return studentCourseMapper.selectStudentCourseByCourseInGrade(collegeid, majorid, courseid, year, term, grade);
    }
}

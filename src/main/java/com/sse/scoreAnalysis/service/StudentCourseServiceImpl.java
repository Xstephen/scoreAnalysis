package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.StudentCourseMapper;
import com.sse.scoreAnalysis.model.Student;
import com.sse.scoreAnalysis.model.StudentCourse;
import com.sse.scoreAnalysis.model.StudentCourseExample;
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
}

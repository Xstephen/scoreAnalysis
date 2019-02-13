package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.StudentCourseMapper;
import com.sse.scoreAnalysis.model.StudentCourse;
import com.sse.scoreAnalysis.model.StudentCourseExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        //返回该学生所有学期的课程成绩
        return studentCourseMapper.selectByExampleWithCourse(studentCourseExample);
    }
}

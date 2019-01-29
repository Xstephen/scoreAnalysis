package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.StudentMapper;
import com.sse.scoreAnalysis.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService{
    @Autowired
    private StudentMapper studentMapper;

    /*
    通过已登录用户的id，查询学生信息
     */
    @Override
    public Student getStudentInfo(String studentId) {
        Student student=studentMapper.selectByPrimaryKey(studentId);
        if(student!=null){
            return student;
        }
        return null;
    }
}

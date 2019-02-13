package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.ClassMapper;
import com.sse.scoreAnalysis.dao.StudentMapper;
import com.sse.scoreAnalysis.model.Class;
import com.sse.scoreAnalysis.model.ClassExample;
import com.sse.scoreAnalysis.model.Student;
import com.sse.scoreAnalysis.model.StudentExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService{
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private ClassMapper classMapper;

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

    @Override
    public int getStudentNumByClass(String classId) {
        StudentExample studentExample=new StudentExample();
        StudentExample.Criteria criteria=studentExample.createCriteria();
        criteria.andClassidEqualTo(classId);
        int count= (int) studentMapper.countByExample(studentExample);
        return count;
    }

    @Override
    public int getStudentNumInSameMajor(String classId) {
        //查询该classid的信息
        Class c=classMapper.selectByPrimaryKey(classId);
        ClassExample classExample=new ClassExample();
        ClassExample.Criteria criteria=classExample.createCriteria();
        criteria.andCollegeidEqualTo(c.getCollegeid());
        criteria.andMajoridEqualTo(c.getMajorid());
        criteria.andGradeEqualTo(c.getGrade());
        List<Class> classes=classMapper.selectByExample(classExample);
        //查询classes中的学生数量
        StudentExample studentExample=new StudentExample();
        StudentExample.Criteria criteria1=studentExample.createCriteria();
        List<String> classIds= new ArrayList<>();
        for (Class cla:classes) {
            classIds.add(cla.getClassid());
        }
        criteria1.andClassidIn(classIds);
        int count= (int) studentMapper.countByExample(studentExample);
        return count;
    }
}

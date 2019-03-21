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
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentMapper studentMapper;
    @Autowired
    private ClassMapper classMapper;

    /*
    通过已登录用户的id，查询学生信息
     */
    @Override
    public Student getStudentInfo(String studentId) {
        Student student = studentMapper.selectByPrimaryKey(studentId);
        if (student != null) {
            return student;
        }
        return null;
    }

    @Override
    public List<Student> getStudentInfoByClassIdList(List<String> classIdList) {
        StudentExample studentExample=new StudentExample();
        StudentExample.Criteria criteria=studentExample.createCriteria();
        criteria.andClassidIn(classIdList);
        criteria.andWeightscoreIsNotNull();
        studentExample.setOrderByClause("studentRank ASC");
        return studentMapper.selectByExample(studentExample);
    }

    @Override
    public int getStudentNumByClass(String classId) {
        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        criteria.andClassidEqualTo(classId);
        int count = (int) studentMapper.countByExample(studentExample);
        return count;
    }

    @Override
    public int getStudentNumInSameMajor(String classId) {
        //查询该classid的信息
        Class c = classMapper.selectByPrimaryKey(classId);
        ClassExample classExample = new ClassExample();
        ClassExample.Criteria criteria = classExample.createCriteria();
        criteria.andCollegeidEqualTo(c.getCollegeid());
        criteria.andMajoridEqualTo(c.getMajorid());
        criteria.andGradeEqualTo(c.getGrade());
        List<Class> classes = classMapper.selectByExample(classExample);
        //查询classes中的学生数量
        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria1 = studentExample.createCriteria();
        List<String> classIds = new ArrayList<>();
        for (Class cla : classes) {
            classIds.add(cla.getClassid());
        }
        criteria1.andClassidIn(classIds);
        criteria1.andWeightscoreIsNotNull();
        int count = (int) studentMapper.countByExample(studentExample);
        return count;
    }

    @Override
    public int getStudentNumInClassList(List<Class> classList) {
        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        List<String> classIds = new ArrayList<>();
        for (Class cla : classList) {
            classIds.add(cla.getClassid());
        }
        criteria.andClassidIn(classIds);
        int count = (int) studentMapper.countByExample(studentExample);
        return count;
    }

    @Override
    public List<Student> getStudentInfoInCollege(String collegeid, String year,String condition) {
        String majorid=null;
        String grade=null;
        return studentMapper.selectJoinByCondition(collegeid, majorid,grade,year,condition);
    }

    @Override
    public List<Student> getStudentInfoInMajor(String collegeId, String majorId, String year,String condition) {
        String grade=null;
        return studentMapper.selectJoinByCondition(collegeId, majorId,grade,year,condition);
    }

    @Override
    public List<Student> getStudentInfoInGrade(String collegeId, String majorId, String grade, String year,String condition) {
        return studentMapper.selectJoinByCondition(collegeId, majorId,grade,year,condition);
    }

    @Override
    public List<Student> getStudentHaveFail(String collegeId, String majorId, String grade) {
        return studentMapper.selectJoinByConditionWithFail(collegeId, majorId,grade);
    }

    @Override
    public List<Student> getStudentAsc(String collegeId, String majorId, String grade) {
        return studentMapper.selectJoinByConditionAsc(collegeId, majorId,grade);
    }

    @Override
    public List<Student> getStudentInfoInSchool(String year, String searchCondition) {
        return studentMapper.selectJoinByCondition(null,null,null,year,searchCondition);
    }
}

package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.ClassMapper;
import com.sse.scoreAnalysis.model.Class;
import com.sse.scoreAnalysis.model.ClassExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService{
    @Autowired
    private ClassMapper classMapper;
    @Override
    public Class getClassInfo(String classId) {
        Class cls=classMapper.selectByPrimaryKey(classId);
        if(cls!=null){
            return cls;
        }
        return null;
    }

    @Override
    public List<Class> getClassListByCounselorId(String counselorId) {
        ClassExample classExample=new ClassExample();
        ClassExample.Criteria criteria=classExample.createCriteria();
        criteria.andCounseloridEqualTo(counselorId);
        return classMapper.selectByExample(classExample);
    }
}

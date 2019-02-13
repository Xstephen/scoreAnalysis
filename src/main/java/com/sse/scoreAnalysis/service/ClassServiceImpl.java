package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.ClassMapper;
import com.sse.scoreAnalysis.model.Class;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}

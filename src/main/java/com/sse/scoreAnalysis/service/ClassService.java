package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.Class;

import java.util.List;

public interface ClassService {
    Class getClassInfo(String classId);
    List<Class> getClassListByCounselorId(String counselorId);
}

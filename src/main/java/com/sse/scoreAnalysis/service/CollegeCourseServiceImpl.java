package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.CollegeCourseMapper;
import com.sse.scoreAnalysis.model.CollegeCourse;
import com.sse.scoreAnalysis.model.CollegeCourseKey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CollegeCourseServiceImpl implements CollegeCourseService {
    @Autowired
    private CollegeCourseMapper collegeCourseMapper;
    @Override
    public CollegeCourse getCollegeCourseByKey(CollegeCourseKey collegeCourseKey) {
        return collegeCourseMapper.selectByPrimaryKey(collegeCourseKey);
    }
}

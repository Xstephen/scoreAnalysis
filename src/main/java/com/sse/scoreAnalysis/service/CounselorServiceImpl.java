package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.CounselorMapper;
import com.sse.scoreAnalysis.model.Counselor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CounselorServiceImpl implements CounselorService{
    @Autowired
    private CounselorMapper counselorMapper;
    @Override
    public Counselor getCounselorWithCollegeById(String counselorId) {
        return counselorMapper.selectByPrimaryKeyWithCollege(counselorId);
    }
}

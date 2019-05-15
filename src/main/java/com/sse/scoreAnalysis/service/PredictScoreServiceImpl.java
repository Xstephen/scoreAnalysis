package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.PredictScoreMapper;
import com.sse.scoreAnalysis.model.PredictScore;
import com.sse.scoreAnalysis.model.PredictScoreExample;
import com.sse.scoreAnalysis.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PredictScoreServiceImpl implements PredictScoreService {
    @Autowired
    PredictScoreMapper predictScoreMapper;
    @Override
    public List<Student> getPredictInStudentList(List<String> studentIdList) {
        PredictScoreExample predictScoreExample=new PredictScoreExample();
        PredictScoreExample.Criteria criteria=predictScoreExample.createCriteria();
        criteria.andStudentidIn(studentIdList);
        criteria.andPredictscoreEqualTo(0);
        return predictScoreMapper.selectStudentByExample(predictScoreExample);
    }

    @Override
    public List<PredictScore> getPredictInfo(String studentId) {
        PredictScoreExample predictScoreExample=new PredictScoreExample();
        PredictScoreExample.Criteria criteria=predictScoreExample.createCriteria();
        criteria.andStudentidEqualTo(studentId);
        criteria.andPredictscoreEqualTo(0);
        return predictScoreMapper.selectByExampleWithCourse(predictScoreExample);
    }
}

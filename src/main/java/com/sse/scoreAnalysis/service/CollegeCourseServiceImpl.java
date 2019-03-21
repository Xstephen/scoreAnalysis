package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.CollegeCourseMapper;
import com.sse.scoreAnalysis.model.CollegeCourse;
import com.sse.scoreAnalysis.model.CollegeCourseExample;
import com.sse.scoreAnalysis.model.CollegeCourseKey;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CollegeCourseServiceImpl implements CollegeCourseService {
    @Autowired
    private CollegeCourseMapper collegeCourseMapper;
    @Override
    public CollegeCourse getCollegeCourseByKey(CollegeCourseKey collegeCourseKey) {
        return collegeCourseMapper.selectByPrimaryKeyWithCourse(collegeCourseKey);
    }

    @Override
    public List<CollegeCourse> getCollegeCourseInStudentIdList(String loginYear,List<String> studentIdList) {
        return collegeCourseMapper.selectCourseInfoInStudentIdList(loginYear,studentIdList);
    }

    @Override
    public JSONArray getNotPassMap(String loginYear, List<String> studentIdList) {
        List<Map<CollegeCourseKey,Object>> resultList=collegeCourseMapper.selectCourseInfoInStudentIdListWithNotPass(loginYear,studentIdList);
//        for (Map<CollegeCourseKey,Object>map:resultList) {
////            result.put((String) map.get("courseId"), Integer.valueOf(String.valueOf((Long) map.get("notPass"))));
//        }
        JSONArray jsonArray=JSONArray.fromObject(resultList);
        return jsonArray;
    }

    @Override
    public List<CollegeCourse> getCollegeCourseInMajor(String collegeId, String majorId, String year,String condition) {
        return collegeCourseMapper.selectCollegeCourseInMajor(collegeId, majorId, year,condition);
    }

    @Override
    public List<CollegeCourse> getCollegeCourseCompare(String collegeId, String majorId, String courseId) {
        CollegeCourseExample collegeCourseExample=new CollegeCourseExample();
        CollegeCourseExample.Criteria criteria=collegeCourseExample.createCriteria();
        criteria.andCollegeidEqualTo(collegeId);
        criteria.andMajoridEqualTo(majorId);
        criteria.andCourseidEqualTo(courseId);
        return collegeCourseMapper.selectByExample(collegeCourseExample);
    }

    @Override
    public List<CollegeCourse> getCollegeCourseInGrade(String collegeId, String majorId, String grade,String year,String term, String condition) {
        return collegeCourseMapper.selectCollegeCourseInGrade(collegeId, majorId,grade,year,term,condition);
    }

}

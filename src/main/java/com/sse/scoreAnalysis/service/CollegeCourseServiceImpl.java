package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.dao.CollegeCourseMapper;
import com.sse.scoreAnalysis.model.CollegeCourse;
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
}

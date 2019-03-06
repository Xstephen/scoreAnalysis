package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.CollegeCourse;
import com.sse.scoreAnalysis.model.CollegeCourseKey;
import net.sf.json.JSONArray;

import java.util.List;
import java.util.Map;

public interface CollegeCourseService {
    CollegeCourse getCollegeCourseByKey(CollegeCourseKey collegeCourseKey);

    List<CollegeCourse> getCollegeCourseInStudentIdList(String loginYear,List<String> studentIdList);

    JSONArray getNotPassMap(String loginYear, List<String> studentIdList);
}

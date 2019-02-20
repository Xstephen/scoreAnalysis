package com.sse.scoreAnalysis.service;

import com.sse.scoreAnalysis.model.CollegeCourse;
import com.sse.scoreAnalysis.model.CollegeCourseKey;

public interface CollegeCourseService {
    CollegeCourse getCollegeCourseByKey(CollegeCourseKey collegeCourseKey);
}

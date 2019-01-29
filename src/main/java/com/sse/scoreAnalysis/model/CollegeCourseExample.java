package com.sse.scoreAnalysis.model;

import java.util.ArrayList;
import java.util.List;

public class CollegeCourseExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CollegeCourseExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andCollegeidIsNull() {
            addCriterion("collegeId is null");
            return (Criteria) this;
        }

        public Criteria andCollegeidIsNotNull() {
            addCriterion("collegeId is not null");
            return (Criteria) this;
        }

        public Criteria andCollegeidEqualTo(String value) {
            addCriterion("collegeId =", value, "collegeid");
            return (Criteria) this;
        }

        public Criteria andCollegeidNotEqualTo(String value) {
            addCriterion("collegeId <>", value, "collegeid");
            return (Criteria) this;
        }

        public Criteria andCollegeidGreaterThan(String value) {
            addCriterion("collegeId >", value, "collegeid");
            return (Criteria) this;
        }

        public Criteria andCollegeidGreaterThanOrEqualTo(String value) {
            addCriterion("collegeId >=", value, "collegeid");
            return (Criteria) this;
        }

        public Criteria andCollegeidLessThan(String value) {
            addCriterion("collegeId <", value, "collegeid");
            return (Criteria) this;
        }

        public Criteria andCollegeidLessThanOrEqualTo(String value) {
            addCriterion("collegeId <=", value, "collegeid");
            return (Criteria) this;
        }

        public Criteria andCollegeidLike(String value) {
            addCriterion("collegeId like", value, "collegeid");
            return (Criteria) this;
        }

        public Criteria andCollegeidNotLike(String value) {
            addCriterion("collegeId not like", value, "collegeid");
            return (Criteria) this;
        }

        public Criteria andCollegeidIn(List<String> values) {
            addCriterion("collegeId in", values, "collegeid");
            return (Criteria) this;
        }

        public Criteria andCollegeidNotIn(List<String> values) {
            addCriterion("collegeId not in", values, "collegeid");
            return (Criteria) this;
        }

        public Criteria andCollegeidBetween(String value1, String value2) {
            addCriterion("collegeId between", value1, value2, "collegeid");
            return (Criteria) this;
        }

        public Criteria andCollegeidNotBetween(String value1, String value2) {
            addCriterion("collegeId not between", value1, value2, "collegeid");
            return (Criteria) this;
        }

        public Criteria andMajoridIsNull() {
            addCriterion("majorId is null");
            return (Criteria) this;
        }

        public Criteria andMajoridIsNotNull() {
            addCriterion("majorId is not null");
            return (Criteria) this;
        }

        public Criteria andMajoridEqualTo(String value) {
            addCriterion("majorId =", value, "majorid");
            return (Criteria) this;
        }

        public Criteria andMajoridNotEqualTo(String value) {
            addCriterion("majorId <>", value, "majorid");
            return (Criteria) this;
        }

        public Criteria andMajoridGreaterThan(String value) {
            addCriterion("majorId >", value, "majorid");
            return (Criteria) this;
        }

        public Criteria andMajoridGreaterThanOrEqualTo(String value) {
            addCriterion("majorId >=", value, "majorid");
            return (Criteria) this;
        }

        public Criteria andMajoridLessThan(String value) {
            addCriterion("majorId <", value, "majorid");
            return (Criteria) this;
        }

        public Criteria andMajoridLessThanOrEqualTo(String value) {
            addCriterion("majorId <=", value, "majorid");
            return (Criteria) this;
        }

        public Criteria andMajoridLike(String value) {
            addCriterion("majorId like", value, "majorid");
            return (Criteria) this;
        }

        public Criteria andMajoridNotLike(String value) {
            addCriterion("majorId not like", value, "majorid");
            return (Criteria) this;
        }

        public Criteria andMajoridIn(List<String> values) {
            addCriterion("majorId in", values, "majorid");
            return (Criteria) this;
        }

        public Criteria andMajoridNotIn(List<String> values) {
            addCriterion("majorId not in", values, "majorid");
            return (Criteria) this;
        }

        public Criteria andMajoridBetween(String value1, String value2) {
            addCriterion("majorId between", value1, value2, "majorid");
            return (Criteria) this;
        }

        public Criteria andMajoridNotBetween(String value1, String value2) {
            addCriterion("majorId not between", value1, value2, "majorid");
            return (Criteria) this;
        }

        public Criteria andCourseidIsNull() {
            addCriterion("courseId is null");
            return (Criteria) this;
        }

        public Criteria andCourseidIsNotNull() {
            addCriterion("courseId is not null");
            return (Criteria) this;
        }

        public Criteria andCourseidEqualTo(String value) {
            addCriterion("courseId =", value, "courseid");
            return (Criteria) this;
        }

        public Criteria andCourseidNotEqualTo(String value) {
            addCriterion("courseId <>", value, "courseid");
            return (Criteria) this;
        }

        public Criteria andCourseidGreaterThan(String value) {
            addCriterion("courseId >", value, "courseid");
            return (Criteria) this;
        }

        public Criteria andCourseidGreaterThanOrEqualTo(String value) {
            addCriterion("courseId >=", value, "courseid");
            return (Criteria) this;
        }

        public Criteria andCourseidLessThan(String value) {
            addCriterion("courseId <", value, "courseid");
            return (Criteria) this;
        }

        public Criteria andCourseidLessThanOrEqualTo(String value) {
            addCriterion("courseId <=", value, "courseid");
            return (Criteria) this;
        }

        public Criteria andCourseidLike(String value) {
            addCriterion("courseId like", value, "courseid");
            return (Criteria) this;
        }

        public Criteria andCourseidNotLike(String value) {
            addCriterion("courseId not like", value, "courseid");
            return (Criteria) this;
        }

        public Criteria andCourseidIn(List<String> values) {
            addCriterion("courseId in", values, "courseid");
            return (Criteria) this;
        }

        public Criteria andCourseidNotIn(List<String> values) {
            addCriterion("courseId not in", values, "courseid");
            return (Criteria) this;
        }

        public Criteria andCourseidBetween(String value1, String value2) {
            addCriterion("courseId between", value1, value2, "courseid");
            return (Criteria) this;
        }

        public Criteria andCourseidNotBetween(String value1, String value2) {
            addCriterion("courseId not between", value1, value2, "courseid");
            return (Criteria) this;
        }

        public Criteria andTermIsNull() {
            addCriterion("term is null");
            return (Criteria) this;
        }

        public Criteria andTermIsNotNull() {
            addCriterion("term is not null");
            return (Criteria) this;
        }

        public Criteria andTermEqualTo(Integer value) {
            addCriterion("term =", value, "term");
            return (Criteria) this;
        }

        public Criteria andTermNotEqualTo(Integer value) {
            addCriterion("term <>", value, "term");
            return (Criteria) this;
        }

        public Criteria andTermGreaterThan(Integer value) {
            addCriterion("term >", value, "term");
            return (Criteria) this;
        }

        public Criteria andTermGreaterThanOrEqualTo(Integer value) {
            addCriterion("term >=", value, "term");
            return (Criteria) this;
        }

        public Criteria andTermLessThan(Integer value) {
            addCriterion("term <", value, "term");
            return (Criteria) this;
        }

        public Criteria andTermLessThanOrEqualTo(Integer value) {
            addCriterion("term <=", value, "term");
            return (Criteria) this;
        }

        public Criteria andTermIn(List<Integer> values) {
            addCriterion("term in", values, "term");
            return (Criteria) this;
        }

        public Criteria andTermNotIn(List<Integer> values) {
            addCriterion("term not in", values, "term");
            return (Criteria) this;
        }

        public Criteria andTermBetween(Integer value1, Integer value2) {
            addCriterion("term between", value1, value2, "term");
            return (Criteria) this;
        }

        public Criteria andTermNotBetween(Integer value1, Integer value2) {
            addCriterion("term not between", value1, value2, "term");
            return (Criteria) this;
        }

        public Criteria andYearIsNull() {
            addCriterion("year is null");
            return (Criteria) this;
        }

        public Criteria andYearIsNotNull() {
            addCriterion("year is not null");
            return (Criteria) this;
        }

        public Criteria andYearEqualTo(String value) {
            addCriterion("year =", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearNotEqualTo(String value) {
            addCriterion("year <>", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearGreaterThan(String value) {
            addCriterion("year >", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearGreaterThanOrEqualTo(String value) {
            addCriterion("year >=", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearLessThan(String value) {
            addCriterion("year <", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearLessThanOrEqualTo(String value) {
            addCriterion("year <=", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearLike(String value) {
            addCriterion("year like", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearNotLike(String value) {
            addCriterion("year not like", value, "year");
            return (Criteria) this;
        }

        public Criteria andYearIn(List<String> values) {
            addCriterion("year in", values, "year");
            return (Criteria) this;
        }

        public Criteria andYearNotIn(List<String> values) {
            addCriterion("year not in", values, "year");
            return (Criteria) this;
        }

        public Criteria andYearBetween(String value1, String value2) {
            addCriterion("year between", value1, value2, "year");
            return (Criteria) this;
        }

        public Criteria andYearNotBetween(String value1, String value2) {
            addCriterion("year not between", value1, value2, "year");
            return (Criteria) this;
        }

        public Criteria andMaxscoreIsNull() {
            addCriterion("maxScore is null");
            return (Criteria) this;
        }

        public Criteria andMaxscoreIsNotNull() {
            addCriterion("maxScore is not null");
            return (Criteria) this;
        }

        public Criteria andMaxscoreEqualTo(Integer value) {
            addCriterion("maxScore =", value, "maxscore");
            return (Criteria) this;
        }

        public Criteria andMaxscoreNotEqualTo(Integer value) {
            addCriterion("maxScore <>", value, "maxscore");
            return (Criteria) this;
        }

        public Criteria andMaxscoreGreaterThan(Integer value) {
            addCriterion("maxScore >", value, "maxscore");
            return (Criteria) this;
        }

        public Criteria andMaxscoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("maxScore >=", value, "maxscore");
            return (Criteria) this;
        }

        public Criteria andMaxscoreLessThan(Integer value) {
            addCriterion("maxScore <", value, "maxscore");
            return (Criteria) this;
        }

        public Criteria andMaxscoreLessThanOrEqualTo(Integer value) {
            addCriterion("maxScore <=", value, "maxscore");
            return (Criteria) this;
        }

        public Criteria andMaxscoreIn(List<Integer> values) {
            addCriterion("maxScore in", values, "maxscore");
            return (Criteria) this;
        }

        public Criteria andMaxscoreNotIn(List<Integer> values) {
            addCriterion("maxScore not in", values, "maxscore");
            return (Criteria) this;
        }

        public Criteria andMaxscoreBetween(Integer value1, Integer value2) {
            addCriterion("maxScore between", value1, value2, "maxscore");
            return (Criteria) this;
        }

        public Criteria andMaxscoreNotBetween(Integer value1, Integer value2) {
            addCriterion("maxScore not between", value1, value2, "maxscore");
            return (Criteria) this;
        }

        public Criteria andMinscoreIsNull() {
            addCriterion("minScore is null");
            return (Criteria) this;
        }

        public Criteria andMinscoreIsNotNull() {
            addCriterion("minScore is not null");
            return (Criteria) this;
        }

        public Criteria andMinscoreEqualTo(Integer value) {
            addCriterion("minScore =", value, "minscore");
            return (Criteria) this;
        }

        public Criteria andMinscoreNotEqualTo(Integer value) {
            addCriterion("minScore <>", value, "minscore");
            return (Criteria) this;
        }

        public Criteria andMinscoreGreaterThan(Integer value) {
            addCriterion("minScore >", value, "minscore");
            return (Criteria) this;
        }

        public Criteria andMinscoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("minScore >=", value, "minscore");
            return (Criteria) this;
        }

        public Criteria andMinscoreLessThan(Integer value) {
            addCriterion("minScore <", value, "minscore");
            return (Criteria) this;
        }

        public Criteria andMinscoreLessThanOrEqualTo(Integer value) {
            addCriterion("minScore <=", value, "minscore");
            return (Criteria) this;
        }

        public Criteria andMinscoreIn(List<Integer> values) {
            addCriterion("minScore in", values, "minscore");
            return (Criteria) this;
        }

        public Criteria andMinscoreNotIn(List<Integer> values) {
            addCriterion("minScore not in", values, "minscore");
            return (Criteria) this;
        }

        public Criteria andMinscoreBetween(Integer value1, Integer value2) {
            addCriterion("minScore between", value1, value2, "minscore");
            return (Criteria) this;
        }

        public Criteria andMinscoreNotBetween(Integer value1, Integer value2) {
            addCriterion("minScore not between", value1, value2, "minscore");
            return (Criteria) this;
        }

        public Criteria andMeanIsNull() {
            addCriterion("mean is null");
            return (Criteria) this;
        }

        public Criteria andMeanIsNotNull() {
            addCriterion("mean is not null");
            return (Criteria) this;
        }

        public Criteria andMeanEqualTo(Integer value) {
            addCriterion("mean =", value, "mean");
            return (Criteria) this;
        }

        public Criteria andMeanNotEqualTo(Integer value) {
            addCriterion("mean <>", value, "mean");
            return (Criteria) this;
        }

        public Criteria andMeanGreaterThan(Integer value) {
            addCriterion("mean >", value, "mean");
            return (Criteria) this;
        }

        public Criteria andMeanGreaterThanOrEqualTo(Integer value) {
            addCriterion("mean >=", value, "mean");
            return (Criteria) this;
        }

        public Criteria andMeanLessThan(Integer value) {
            addCriterion("mean <", value, "mean");
            return (Criteria) this;
        }

        public Criteria andMeanLessThanOrEqualTo(Integer value) {
            addCriterion("mean <=", value, "mean");
            return (Criteria) this;
        }

        public Criteria andMeanIn(List<Integer> values) {
            addCriterion("mean in", values, "mean");
            return (Criteria) this;
        }

        public Criteria andMeanNotIn(List<Integer> values) {
            addCriterion("mean not in", values, "mean");
            return (Criteria) this;
        }

        public Criteria andMeanBetween(Integer value1, Integer value2) {
            addCriterion("mean between", value1, value2, "mean");
            return (Criteria) this;
        }

        public Criteria andMeanNotBetween(Integer value1, Integer value2) {
            addCriterion("mean not between", value1, value2, "mean");
            return (Criteria) this;
        }

        public Criteria andMedianIsNull() {
            addCriterion("median is null");
            return (Criteria) this;
        }

        public Criteria andMedianIsNotNull() {
            addCriterion("median is not null");
            return (Criteria) this;
        }

        public Criteria andMedianEqualTo(Integer value) {
            addCriterion("median =", value, "median");
            return (Criteria) this;
        }

        public Criteria andMedianNotEqualTo(Integer value) {
            addCriterion("median <>", value, "median");
            return (Criteria) this;
        }

        public Criteria andMedianGreaterThan(Integer value) {
            addCriterion("median >", value, "median");
            return (Criteria) this;
        }

        public Criteria andMedianGreaterThanOrEqualTo(Integer value) {
            addCriterion("median >=", value, "median");
            return (Criteria) this;
        }

        public Criteria andMedianLessThan(Integer value) {
            addCriterion("median <", value, "median");
            return (Criteria) this;
        }

        public Criteria andMedianLessThanOrEqualTo(Integer value) {
            addCriterion("median <=", value, "median");
            return (Criteria) this;
        }

        public Criteria andMedianIn(List<Integer> values) {
            addCriterion("median in", values, "median");
            return (Criteria) this;
        }

        public Criteria andMedianNotIn(List<Integer> values) {
            addCriterion("median not in", values, "median");
            return (Criteria) this;
        }

        public Criteria andMedianBetween(Integer value1, Integer value2) {
            addCriterion("median between", value1, value2, "median");
            return (Criteria) this;
        }

        public Criteria andMedianNotBetween(Integer value1, Integer value2) {
            addCriterion("median not between", value1, value2, "median");
            return (Criteria) this;
        }

        public Criteria andStudentnumIsNull() {
            addCriterion("studentNum is null");
            return (Criteria) this;
        }

        public Criteria andStudentnumIsNotNull() {
            addCriterion("studentNum is not null");
            return (Criteria) this;
        }

        public Criteria andStudentnumEqualTo(Integer value) {
            addCriterion("studentNum =", value, "studentnum");
            return (Criteria) this;
        }

        public Criteria andStudentnumNotEqualTo(Integer value) {
            addCriterion("studentNum <>", value, "studentnum");
            return (Criteria) this;
        }

        public Criteria andStudentnumGreaterThan(Integer value) {
            addCriterion("studentNum >", value, "studentnum");
            return (Criteria) this;
        }

        public Criteria andStudentnumGreaterThanOrEqualTo(Integer value) {
            addCriterion("studentNum >=", value, "studentnum");
            return (Criteria) this;
        }

        public Criteria andStudentnumLessThan(Integer value) {
            addCriterion("studentNum <", value, "studentnum");
            return (Criteria) this;
        }

        public Criteria andStudentnumLessThanOrEqualTo(Integer value) {
            addCriterion("studentNum <=", value, "studentnum");
            return (Criteria) this;
        }

        public Criteria andStudentnumIn(List<Integer> values) {
            addCriterion("studentNum in", values, "studentnum");
            return (Criteria) this;
        }

        public Criteria andStudentnumNotIn(List<Integer> values) {
            addCriterion("studentNum not in", values, "studentnum");
            return (Criteria) this;
        }

        public Criteria andStudentnumBetween(Integer value1, Integer value2) {
            addCriterion("studentNum between", value1, value2, "studentnum");
            return (Criteria) this;
        }

        public Criteria andStudentnumNotBetween(Integer value1, Integer value2) {
            addCriterion("studentNum not between", value1, value2, "studentnum");
            return (Criteria) this;
        }

        public Criteria andFailurenumIsNull() {
            addCriterion("failureNum is null");
            return (Criteria) this;
        }

        public Criteria andFailurenumIsNotNull() {
            addCriterion("failureNum is not null");
            return (Criteria) this;
        }

        public Criteria andFailurenumEqualTo(Integer value) {
            addCriterion("failureNum =", value, "failurenum");
            return (Criteria) this;
        }

        public Criteria andFailurenumNotEqualTo(Integer value) {
            addCriterion("failureNum <>", value, "failurenum");
            return (Criteria) this;
        }

        public Criteria andFailurenumGreaterThan(Integer value) {
            addCriterion("failureNum >", value, "failurenum");
            return (Criteria) this;
        }

        public Criteria andFailurenumGreaterThanOrEqualTo(Integer value) {
            addCriterion("failureNum >=", value, "failurenum");
            return (Criteria) this;
        }

        public Criteria andFailurenumLessThan(Integer value) {
            addCriterion("failureNum <", value, "failurenum");
            return (Criteria) this;
        }

        public Criteria andFailurenumLessThanOrEqualTo(Integer value) {
            addCriterion("failureNum <=", value, "failurenum");
            return (Criteria) this;
        }

        public Criteria andFailurenumIn(List<Integer> values) {
            addCriterion("failureNum in", values, "failurenum");
            return (Criteria) this;
        }

        public Criteria andFailurenumNotIn(List<Integer> values) {
            addCriterion("failureNum not in", values, "failurenum");
            return (Criteria) this;
        }

        public Criteria andFailurenumBetween(Integer value1, Integer value2) {
            addCriterion("failureNum between", value1, value2, "failurenum");
            return (Criteria) this;
        }

        public Criteria andFailurenumNotBetween(Integer value1, Integer value2) {
            addCriterion("failureNum not between", value1, value2, "failurenum");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}
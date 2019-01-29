package com.sse.scoreAnalysis.model;

import java.util.ArrayList;
import java.util.List;

public class StudentAnalysisExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StudentAnalysisExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
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

        public Criteria andWeightscoreIsNull() {
            addCriterion("weightScore is null");
            return (Criteria) this;
        }

        public Criteria andWeightscoreIsNotNull() {
            addCriterion("weightScore is not null");
            return (Criteria) this;
        }

        public Criteria andWeightscoreEqualTo(Double value) {
            addCriterion("weightScore =", value, "weightscore");
            return (Criteria) this;
        }

        public Criteria andWeightscoreNotEqualTo(Double value) {
            addCriterion("weightScore <>", value, "weightscore");
            return (Criteria) this;
        }

        public Criteria andWeightscoreGreaterThan(Double value) {
            addCriterion("weightScore >", value, "weightscore");
            return (Criteria) this;
        }

        public Criteria andWeightscoreGreaterThanOrEqualTo(Double value) {
            addCriterion("weightScore >=", value, "weightscore");
            return (Criteria) this;
        }

        public Criteria andWeightscoreLessThan(Double value) {
            addCriterion("weightScore <", value, "weightscore");
            return (Criteria) this;
        }

        public Criteria andWeightscoreLessThanOrEqualTo(Double value) {
            addCriterion("weightScore <=", value, "weightscore");
            return (Criteria) this;
        }

        public Criteria andWeightscoreIn(List<Double> values) {
            addCriterion("weightScore in", values, "weightscore");
            return (Criteria) this;
        }

        public Criteria andWeightscoreNotIn(List<Double> values) {
            addCriterion("weightScore not in", values, "weightscore");
            return (Criteria) this;
        }

        public Criteria andWeightscoreBetween(Double value1, Double value2) {
            addCriterion("weightScore between", value1, value2, "weightscore");
            return (Criteria) this;
        }

        public Criteria andWeightscoreNotBetween(Double value1, Double value2) {
            addCriterion("weightScore not between", value1, value2, "weightscore");
            return (Criteria) this;
        }

        public Criteria andStudentrankIsNull() {
            addCriterion("studentRank is null");
            return (Criteria) this;
        }

        public Criteria andStudentrankIsNotNull() {
            addCriterion("studentRank is not null");
            return (Criteria) this;
        }

        public Criteria andStudentrankEqualTo(Integer value) {
            addCriterion("studentRank =", value, "studentrank");
            return (Criteria) this;
        }

        public Criteria andStudentrankNotEqualTo(Integer value) {
            addCriterion("studentRank <>", value, "studentrank");
            return (Criteria) this;
        }

        public Criteria andStudentrankGreaterThan(Integer value) {
            addCriterion("studentRank >", value, "studentrank");
            return (Criteria) this;
        }

        public Criteria andStudentrankGreaterThanOrEqualTo(Integer value) {
            addCriterion("studentRank >=", value, "studentrank");
            return (Criteria) this;
        }

        public Criteria andStudentrankLessThan(Integer value) {
            addCriterion("studentRank <", value, "studentrank");
            return (Criteria) this;
        }

        public Criteria andStudentrankLessThanOrEqualTo(Integer value) {
            addCriterion("studentRank <=", value, "studentrank");
            return (Criteria) this;
        }

        public Criteria andStudentrankIn(List<Integer> values) {
            addCriterion("studentRank in", values, "studentrank");
            return (Criteria) this;
        }

        public Criteria andStudentrankNotIn(List<Integer> values) {
            addCriterion("studentRank not in", values, "studentrank");
            return (Criteria) this;
        }

        public Criteria andStudentrankBetween(Integer value1, Integer value2) {
            addCriterion("studentRank between", value1, value2, "studentrank");
            return (Criteria) this;
        }

        public Criteria andStudentrankNotBetween(Integer value1, Integer value2) {
            addCriterion("studentRank not between", value1, value2, "studentrank");
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

        public Criteria andScorechangeIsNull() {
            addCriterion("scoreChange is null");
            return (Criteria) this;
        }

        public Criteria andScorechangeIsNotNull() {
            addCriterion("scoreChange is not null");
            return (Criteria) this;
        }

        public Criteria andScorechangeEqualTo(Integer value) {
            addCriterion("scoreChange =", value, "scorechange");
            return (Criteria) this;
        }

        public Criteria andScorechangeNotEqualTo(Integer value) {
            addCriterion("scoreChange <>", value, "scorechange");
            return (Criteria) this;
        }

        public Criteria andScorechangeGreaterThan(Integer value) {
            addCriterion("scoreChange >", value, "scorechange");
            return (Criteria) this;
        }

        public Criteria andScorechangeGreaterThanOrEqualTo(Integer value) {
            addCriterion("scoreChange >=", value, "scorechange");
            return (Criteria) this;
        }

        public Criteria andScorechangeLessThan(Integer value) {
            addCriterion("scoreChange <", value, "scorechange");
            return (Criteria) this;
        }

        public Criteria andScorechangeLessThanOrEqualTo(Integer value) {
            addCriterion("scoreChange <=", value, "scorechange");
            return (Criteria) this;
        }

        public Criteria andScorechangeIn(List<Integer> values) {
            addCriterion("scoreChange in", values, "scorechange");
            return (Criteria) this;
        }

        public Criteria andScorechangeNotIn(List<Integer> values) {
            addCriterion("scoreChange not in", values, "scorechange");
            return (Criteria) this;
        }

        public Criteria andScorechangeBetween(Integer value1, Integer value2) {
            addCriterion("scoreChange between", value1, value2, "scorechange");
            return (Criteria) this;
        }

        public Criteria andScorechangeNotBetween(Integer value1, Integer value2) {
            addCriterion("scoreChange not between", value1, value2, "scorechange");
            return (Criteria) this;
        }

        public Criteria andStudentidIsNull() {
            addCriterion("studentId is null");
            return (Criteria) this;
        }

        public Criteria andStudentidIsNotNull() {
            addCriterion("studentId is not null");
            return (Criteria) this;
        }

        public Criteria andStudentidEqualTo(String value) {
            addCriterion("studentId =", value, "studentid");
            return (Criteria) this;
        }

        public Criteria andStudentidNotEqualTo(String value) {
            addCriterion("studentId <>", value, "studentid");
            return (Criteria) this;
        }

        public Criteria andStudentidGreaterThan(String value) {
            addCriterion("studentId >", value, "studentid");
            return (Criteria) this;
        }

        public Criteria andStudentidGreaterThanOrEqualTo(String value) {
            addCriterion("studentId >=", value, "studentid");
            return (Criteria) this;
        }

        public Criteria andStudentidLessThan(String value) {
            addCriterion("studentId <", value, "studentid");
            return (Criteria) this;
        }

        public Criteria andStudentidLessThanOrEqualTo(String value) {
            addCriterion("studentId <=", value, "studentid");
            return (Criteria) this;
        }

        public Criteria andStudentidLike(String value) {
            addCriterion("studentId like", value, "studentid");
            return (Criteria) this;
        }

        public Criteria andStudentidNotLike(String value) {
            addCriterion("studentId not like", value, "studentid");
            return (Criteria) this;
        }

        public Criteria andStudentidIn(List<String> values) {
            addCriterion("studentId in", values, "studentid");
            return (Criteria) this;
        }

        public Criteria andStudentidNotIn(List<String> values) {
            addCriterion("studentId not in", values, "studentid");
            return (Criteria) this;
        }

        public Criteria andStudentidBetween(String value1, String value2) {
            addCriterion("studentId between", value1, value2, "studentid");
            return (Criteria) this;
        }

        public Criteria andStudentidNotBetween(String value1, String value2) {
            addCriterion("studentId not between", value1, value2, "studentid");
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
package com.sse.scoreAnalysis.model;

import java.util.ArrayList;
import java.util.List;

public class ClassExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ClassExample() {
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

        public Criteria andClassidIsNull() {
            addCriterion("classId is null");
            return (Criteria) this;
        }

        public Criteria andClassidIsNotNull() {
            addCriterion("classId is not null");
            return (Criteria) this;
        }

        public Criteria andClassidEqualTo(String value) {
            addCriterion("classId =", value, "classid");
            return (Criteria) this;
        }

        public Criteria andClassidNotEqualTo(String value) {
            addCriterion("classId <>", value, "classid");
            return (Criteria) this;
        }

        public Criteria andClassidGreaterThan(String value) {
            addCriterion("classId >", value, "classid");
            return (Criteria) this;
        }

        public Criteria andClassidGreaterThanOrEqualTo(String value) {
            addCriterion("classId >=", value, "classid");
            return (Criteria) this;
        }

        public Criteria andClassidLessThan(String value) {
            addCriterion("classId <", value, "classid");
            return (Criteria) this;
        }

        public Criteria andClassidLessThanOrEqualTo(String value) {
            addCriterion("classId <=", value, "classid");
            return (Criteria) this;
        }

        public Criteria andClassidLike(String value) {
            addCriterion("classId like", value, "classid");
            return (Criteria) this;
        }

        public Criteria andClassidNotLike(String value) {
            addCriterion("classId not like", value, "classid");
            return (Criteria) this;
        }

        public Criteria andClassidIn(List<String> values) {
            addCriterion("classId in", values, "classid");
            return (Criteria) this;
        }

        public Criteria andClassidNotIn(List<String> values) {
            addCriterion("classId not in", values, "classid");
            return (Criteria) this;
        }

        public Criteria andClassidBetween(String value1, String value2) {
            addCriterion("classId between", value1, value2, "classid");
            return (Criteria) this;
        }

        public Criteria andClassidNotBetween(String value1, String value2) {
            addCriterion("classId not between", value1, value2, "classid");
            return (Criteria) this;
        }

        public Criteria andGradeIsNull() {
            addCriterion("grade is null");
            return (Criteria) this;
        }

        public Criteria andGradeIsNotNull() {
            addCriterion("grade is not null");
            return (Criteria) this;
        }

        public Criteria andGradeEqualTo(Integer value) {
            addCriterion("grade =", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeNotEqualTo(Integer value) {
            addCriterion("grade <>", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeGreaterThan(Integer value) {
            addCriterion("grade >", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeGreaterThanOrEqualTo(Integer value) {
            addCriterion("grade >=", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeLessThan(Integer value) {
            addCriterion("grade <", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeLessThanOrEqualTo(Integer value) {
            addCriterion("grade <=", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeIn(List<Integer> values) {
            addCriterion("grade in", values, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeNotIn(List<Integer> values) {
            addCriterion("grade not in", values, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeBetween(Integer value1, Integer value2) {
            addCriterion("grade between", value1, value2, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeNotBetween(Integer value1, Integer value2) {
            addCriterion("grade not between", value1, value2, "grade");
            return (Criteria) this;
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

        public Criteria andCounseloridIsNull() {
            addCriterion("counselorId is null");
            return (Criteria) this;
        }

        public Criteria andCounseloridIsNotNull() {
            addCriterion("counselorId is not null");
            return (Criteria) this;
        }

        public Criteria andCounseloridEqualTo(String value) {
            addCriterion("counselorId =", value, "counselorid");
            return (Criteria) this;
        }

        public Criteria andCounseloridNotEqualTo(String value) {
            addCriterion("counselorId <>", value, "counselorid");
            return (Criteria) this;
        }

        public Criteria andCounseloridGreaterThan(String value) {
            addCriterion("counselorId >", value, "counselorid");
            return (Criteria) this;
        }

        public Criteria andCounseloridGreaterThanOrEqualTo(String value) {
            addCriterion("counselorId >=", value, "counselorid");
            return (Criteria) this;
        }

        public Criteria andCounseloridLessThan(String value) {
            addCriterion("counselorId <", value, "counselorid");
            return (Criteria) this;
        }

        public Criteria andCounseloridLessThanOrEqualTo(String value) {
            addCriterion("counselorId <=", value, "counselorid");
            return (Criteria) this;
        }

        public Criteria andCounseloridLike(String value) {
            addCriterion("counselorId like", value, "counselorid");
            return (Criteria) this;
        }

        public Criteria andCounseloridNotLike(String value) {
            addCriterion("counselorId not like", value, "counselorid");
            return (Criteria) this;
        }

        public Criteria andCounseloridIn(List<String> values) {
            addCriterion("counselorId in", values, "counselorid");
            return (Criteria) this;
        }

        public Criteria andCounseloridNotIn(List<String> values) {
            addCriterion("counselorId not in", values, "counselorid");
            return (Criteria) this;
        }

        public Criteria andCounseloridBetween(String value1, String value2) {
            addCriterion("counselorId between", value1, value2, "counselorid");
            return (Criteria) this;
        }

        public Criteria andCounseloridNotBetween(String value1, String value2) {
            addCriterion("counselorId not between", value1, value2, "counselorid");
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
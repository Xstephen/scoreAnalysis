package com.sse.scoreAnalysis.model;

import java.util.ArrayList;
import java.util.List;

public class CounselorExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CounselorExample() {
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

        public Criteria andPasswordIsNull() {
            addCriterion("password is null");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNotNull() {
            addCriterion("password is not null");
            return (Criteria) this;
        }

        public Criteria andPasswordEqualTo(String value) {
            addCriterion("password =", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotEqualTo(String value) {
            addCriterion("password <>", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThan(String value) {
            addCriterion("password >", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("password >=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThan(String value) {
            addCriterion("password <", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThanOrEqualTo(String value) {
            addCriterion("password <=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLike(String value) {
            addCriterion("password like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotLike(String value) {
            addCriterion("password not like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordIn(List<String> values) {
            addCriterion("password in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotIn(List<String> values) {
            addCriterion("password not in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordBetween(String value1, String value2) {
            addCriterion("password between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotBetween(String value1, String value2) {
            addCriterion("password not between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andCounselornameIsNull() {
            addCriterion("counselorName is null");
            return (Criteria) this;
        }

        public Criteria andCounselornameIsNotNull() {
            addCriterion("counselorName is not null");
            return (Criteria) this;
        }

        public Criteria andCounselornameEqualTo(String value) {
            addCriterion("counselorName =", value, "counselorname");
            return (Criteria) this;
        }

        public Criteria andCounselornameNotEqualTo(String value) {
            addCriterion("counselorName <>", value, "counselorname");
            return (Criteria) this;
        }

        public Criteria andCounselornameGreaterThan(String value) {
            addCriterion("counselorName >", value, "counselorname");
            return (Criteria) this;
        }

        public Criteria andCounselornameGreaterThanOrEqualTo(String value) {
            addCriterion("counselorName >=", value, "counselorname");
            return (Criteria) this;
        }

        public Criteria andCounselornameLessThan(String value) {
            addCriterion("counselorName <", value, "counselorname");
            return (Criteria) this;
        }

        public Criteria andCounselornameLessThanOrEqualTo(String value) {
            addCriterion("counselorName <=", value, "counselorname");
            return (Criteria) this;
        }

        public Criteria andCounselornameLike(String value) {
            addCriterion("counselorName like", value, "counselorname");
            return (Criteria) this;
        }

        public Criteria andCounselornameNotLike(String value) {
            addCriterion("counselorName not like", value, "counselorname");
            return (Criteria) this;
        }

        public Criteria andCounselornameIn(List<String> values) {
            addCriterion("counselorName in", values, "counselorname");
            return (Criteria) this;
        }

        public Criteria andCounselornameNotIn(List<String> values) {
            addCriterion("counselorName not in", values, "counselorname");
            return (Criteria) this;
        }

        public Criteria andCounselornameBetween(String value1, String value2) {
            addCriterion("counselorName between", value1, value2, "counselorname");
            return (Criteria) this;
        }

        public Criteria andCounselornameNotBetween(String value1, String value2) {
            addCriterion("counselorName not between", value1, value2, "counselorname");
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
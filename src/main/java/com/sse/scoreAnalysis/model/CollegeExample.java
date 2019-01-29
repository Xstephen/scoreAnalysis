package com.sse.scoreAnalysis.model;

import java.util.ArrayList;
import java.util.List;

public class CollegeExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CollegeExample() {
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

        public Criteria andCollegenameIsNull() {
            addCriterion("collegeName is null");
            return (Criteria) this;
        }

        public Criteria andCollegenameIsNotNull() {
            addCriterion("collegeName is not null");
            return (Criteria) this;
        }

        public Criteria andCollegenameEqualTo(String value) {
            addCriterion("collegeName =", value, "collegename");
            return (Criteria) this;
        }

        public Criteria andCollegenameNotEqualTo(String value) {
            addCriterion("collegeName <>", value, "collegename");
            return (Criteria) this;
        }

        public Criteria andCollegenameGreaterThan(String value) {
            addCriterion("collegeName >", value, "collegename");
            return (Criteria) this;
        }

        public Criteria andCollegenameGreaterThanOrEqualTo(String value) {
            addCriterion("collegeName >=", value, "collegename");
            return (Criteria) this;
        }

        public Criteria andCollegenameLessThan(String value) {
            addCriterion("collegeName <", value, "collegename");
            return (Criteria) this;
        }

        public Criteria andCollegenameLessThanOrEqualTo(String value) {
            addCriterion("collegeName <=", value, "collegename");
            return (Criteria) this;
        }

        public Criteria andCollegenameLike(String value) {
            addCriterion("collegeName like", value, "collegename");
            return (Criteria) this;
        }

        public Criteria andCollegenameNotLike(String value) {
            addCriterion("collegeName not like", value, "collegename");
            return (Criteria) this;
        }

        public Criteria andCollegenameIn(List<String> values) {
            addCriterion("collegeName in", values, "collegename");
            return (Criteria) this;
        }

        public Criteria andCollegenameNotIn(List<String> values) {
            addCriterion("collegeName not in", values, "collegename");
            return (Criteria) this;
        }

        public Criteria andCollegenameBetween(String value1, String value2) {
            addCriterion("collegeName between", value1, value2, "collegename");
            return (Criteria) this;
        }

        public Criteria andCollegenameNotBetween(String value1, String value2) {
            addCriterion("collegeName not between", value1, value2, "collegename");
            return (Criteria) this;
        }

        public Criteria andMajornameIsNull() {
            addCriterion("majorName is null");
            return (Criteria) this;
        }

        public Criteria andMajornameIsNotNull() {
            addCriterion("majorName is not null");
            return (Criteria) this;
        }

        public Criteria andMajornameEqualTo(String value) {
            addCriterion("majorName =", value, "majorname");
            return (Criteria) this;
        }

        public Criteria andMajornameNotEqualTo(String value) {
            addCriterion("majorName <>", value, "majorname");
            return (Criteria) this;
        }

        public Criteria andMajornameGreaterThan(String value) {
            addCriterion("majorName >", value, "majorname");
            return (Criteria) this;
        }

        public Criteria andMajornameGreaterThanOrEqualTo(String value) {
            addCriterion("majorName >=", value, "majorname");
            return (Criteria) this;
        }

        public Criteria andMajornameLessThan(String value) {
            addCriterion("majorName <", value, "majorname");
            return (Criteria) this;
        }

        public Criteria andMajornameLessThanOrEqualTo(String value) {
            addCriterion("majorName <=", value, "majorname");
            return (Criteria) this;
        }

        public Criteria andMajornameLike(String value) {
            addCriterion("majorName like", value, "majorname");
            return (Criteria) this;
        }

        public Criteria andMajornameNotLike(String value) {
            addCriterion("majorName not like", value, "majorname");
            return (Criteria) this;
        }

        public Criteria andMajornameIn(List<String> values) {
            addCriterion("majorName in", values, "majorname");
            return (Criteria) this;
        }

        public Criteria andMajornameNotIn(List<String> values) {
            addCriterion("majorName not in", values, "majorname");
            return (Criteria) this;
        }

        public Criteria andMajornameBetween(String value1, String value2) {
            addCriterion("majorName between", value1, value2, "majorname");
            return (Criteria) this;
        }

        public Criteria andMajornameNotBetween(String value1, String value2) {
            addCriterion("majorName not between", value1, value2, "majorname");
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
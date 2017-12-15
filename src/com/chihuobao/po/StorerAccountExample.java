package com.chihuobao.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 * 
 * @description 商家账号信息扩展类
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public class StorerAccountExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StorerAccountExample() {
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

        public Criteria andStorernumberIsNull() {
            addCriterion("storerNumber is null");
            return (Criteria) this;
        }

        public Criteria andStorernumberIsNotNull() {
            addCriterion("storerNumber is not null");
            return (Criteria) this;
        }

        public Criteria andStorernumberEqualTo(String value) {
            addCriterion("storerNumber =", value, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernumberNotEqualTo(String value) {
            addCriterion("storerNumber <>", value, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernumberGreaterThan(String value) {
            addCriterion("storerNumber >", value, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernumberGreaterThanOrEqualTo(String value) {
            addCriterion("storerNumber >=", value, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernumberLessThan(String value) {
            addCriterion("storerNumber <", value, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernumberLessThanOrEqualTo(String value) {
            addCriterion("storerNumber <=", value, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernumberLike(String value) {
            addCriterion("storerNumber like", value, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernumberNotLike(String value) {
            addCriterion("storerNumber not like", value, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernumberIn(List<String> values) {
            addCriterion("storerNumber in", values, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernumberNotIn(List<String> values) {
            addCriterion("storerNumber not in", values, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernumberBetween(String value1, String value2) {
            addCriterion("storerNumber between", value1, value2, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernumberNotBetween(String value1, String value2) {
            addCriterion("storerNumber not between", value1, value2, "storernumber");
            return (Criteria) this;
        }

        public Criteria andStorernameIsNull() {
            addCriterion("storerName is null");
            return (Criteria) this;
        }

        public Criteria andStorernameIsNotNull() {
            addCriterion("storerName is not null");
            return (Criteria) this;
        }

        public Criteria andStorernameEqualTo(String value) {
            addCriterion("storerName =", value, "storername");
            return (Criteria) this;
        }

        public Criteria andStorernameNotEqualTo(String value) {
            addCriterion("storerName <>", value, "storername");
            return (Criteria) this;
        }

        public Criteria andStorernameGreaterThan(String value) {
            addCriterion("storerName >", value, "storername");
            return (Criteria) this;
        }

        public Criteria andStorernameGreaterThanOrEqualTo(String value) {
            addCriterion("storerName >=", value, "storername");
            return (Criteria) this;
        }

        public Criteria andStorernameLessThan(String value) {
            addCriterion("storerName <", value, "storername");
            return (Criteria) this;
        }

        public Criteria andStorernameLessThanOrEqualTo(String value) {
            addCriterion("storerName <=", value, "storername");
            return (Criteria) this;
        }

        public Criteria andStorernameLike(String value) {
            addCriterion("storerName like", value, "storername");
            return (Criteria) this;
        }

        public Criteria andStorernameNotLike(String value) {
            addCriterion("storerName not like", value, "storername");
            return (Criteria) this;
        }

        public Criteria andStorernameIn(List<String> values) {
            addCriterion("storerName in", values, "storername");
            return (Criteria) this;
        }

        public Criteria andStorernameNotIn(List<String> values) {
            addCriterion("storerName not in", values, "storername");
            return (Criteria) this;
        }

        public Criteria andStorernameBetween(String value1, String value2) {
            addCriterion("storerName between", value1, value2, "storername");
            return (Criteria) this;
        }

        public Criteria andStorernameNotBetween(String value1, String value2) {
            addCriterion("storerName not between", value1, value2, "storername");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeIsNull() {
            addCriterion("storerRegistTime is null");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeIsNotNull() {
            addCriterion("storerRegistTime is not null");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeEqualTo(Date value) {
            addCriterion("storerRegistTime =", value, "storerregisttime");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeNotEqualTo(Date value) {
            addCriterion("storerRegistTime <>", value, "storerregisttime");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeGreaterThan(Date value) {
            addCriterion("storerRegistTime >", value, "storerregisttime");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeGreaterThanOrEqualTo(Date value) {
            addCriterion("storerRegistTime >=", value, "storerregisttime");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeLessThan(Date value) {
            addCriterion("storerRegistTime <", value, "storerregisttime");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeLessThanOrEqualTo(Date value) {
            addCriterion("storerRegistTime <=", value, "storerregisttime");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeIn(List<Date> values) {
            addCriterion("storerRegistTime in", values, "storerregisttime");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeNotIn(List<Date> values) {
            addCriterion("storerRegistTime not in", values, "storerregisttime");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeBetween(Date value1, Date value2) {
            addCriterion("storerRegistTime between", value1, value2, "storerregisttime");
            return (Criteria) this;
        }

        public Criteria andStorerregisttimeNotBetween(Date value1, Date value2) {
            addCriterion("storerRegistTime not between", value1, value2, "storerregisttime");
            return (Criteria) this;
        }

        public Criteria andEmailIsNull() {
            addCriterion("email is null");
            return (Criteria) this;
        }

        public Criteria andEmailIsNotNull() {
            addCriterion("email is not null");
            return (Criteria) this;
        }

        public Criteria andEmailEqualTo(String value) {
            addCriterion("email =", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotEqualTo(String value) {
            addCriterion("email <>", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThan(String value) {
            addCriterion("email >", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailGreaterThanOrEqualTo(String value) {
            addCriterion("email >=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThan(String value) {
            addCriterion("email <", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLessThanOrEqualTo(String value) {
            addCriterion("email <=", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailLike(String value) {
            addCriterion("email like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotLike(String value) {
            addCriterion("email not like", value, "email");
            return (Criteria) this;
        }

        public Criteria andEmailIn(List<String> values) {
            addCriterion("email in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotIn(List<String> values) {
            addCriterion("email not in", values, "email");
            return (Criteria) this;
        }

        public Criteria andEmailBetween(String value1, String value2) {
            addCriterion("email between", value1, value2, "email");
            return (Criteria) this;
        }

        public Criteria andEmailNotBetween(String value1, String value2) {
            addCriterion("email not between", value1, value2, "email");
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

        public Criteria andStorerpicIsNull() {
            addCriterion("storerPic is null");
            return (Criteria) this;
        }

        public Criteria andStorerpicIsNotNull() {
            addCriterion("storerPic is not null");
            return (Criteria) this;
        }

        public Criteria andStorerpicEqualTo(String value) {
            addCriterion("storerPic =", value, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorerpicNotEqualTo(String value) {
            addCriterion("storerPic <>", value, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorerpicGreaterThan(String value) {
            addCriterion("storerPic >", value, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorerpicGreaterThanOrEqualTo(String value) {
            addCriterion("storerPic >=", value, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorerpicLessThan(String value) {
            addCriterion("storerPic <", value, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorerpicLessThanOrEqualTo(String value) {
            addCriterion("storerPic <=", value, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorerpicLike(String value) {
            addCriterion("storerPic like", value, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorerpicNotLike(String value) {
            addCriterion("storerPic not like", value, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorerpicIn(List<String> values) {
            addCriterion("storerPic in", values, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorerpicNotIn(List<String> values) {
            addCriterion("storerPic not in", values, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorerpicBetween(String value1, String value2) {
            addCriterion("storerPic between", value1, value2, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorerpicNotBetween(String value1, String value2) {
            addCriterion("storerPic not between", value1, value2, "storerpic");
            return (Criteria) this;
        }

        public Criteria andStorermoneyIsNull() {
            addCriterion("storerMoney is null");
            return (Criteria) this;
        }

        public Criteria andStorermoneyIsNotNull() {
            addCriterion("storerMoney is not null");
            return (Criteria) this;
        }

        public Criteria andStorermoneyEqualTo(Double value) {
            addCriterion("storerMoney =", value, "storermoney");
            return (Criteria) this;
        }

        public Criteria andStorermoneyNotEqualTo(Double value) {
            addCriterion("storerMoney <>", value, "storermoney");
            return (Criteria) this;
        }

        public Criteria andStorermoneyGreaterThan(Double value) {
            addCriterion("storerMoney >", value, "storermoney");
            return (Criteria) this;
        }

        public Criteria andStorermoneyGreaterThanOrEqualTo(Double value) {
            addCriterion("storerMoney >=", value, "storermoney");
            return (Criteria) this;
        }

        public Criteria andStorermoneyLessThan(Double value) {
            addCriterion("storerMoney <", value, "storermoney");
            return (Criteria) this;
        }

        public Criteria andStorermoneyLessThanOrEqualTo(Double value) {
            addCriterion("storerMoney <=", value, "storermoney");
            return (Criteria) this;
        }

        public Criteria andStorermoneyIn(List<Double> values) {
            addCriterion("storerMoney in", values, "storermoney");
            return (Criteria) this;
        }

        public Criteria andStorermoneyNotIn(List<Double> values) {
            addCriterion("storerMoney not in", values, "storermoney");
            return (Criteria) this;
        }

        public Criteria andStorermoneyBetween(Double value1, Double value2) {
            addCriterion("storerMoney between", value1, value2, "storermoney");
            return (Criteria) this;
        }

        public Criteria andStorermoneyNotBetween(Double value1, Double value2) {
            addCriterion("storerMoney not between", value1, value2, "storermoney");
            return (Criteria) this;
        }

        public Criteria andAccountstateIsNull() {
            addCriterion("accountState is null");
            return (Criteria) this;
        }

        public Criteria andAccountstateIsNotNull() {
            addCriterion("accountState is not null");
            return (Criteria) this;
        }

        public Criteria andAccountstateEqualTo(Integer value) {
            addCriterion("accountState =", value, "accountstate");
            return (Criteria) this;
        }

        public Criteria andAccountstateNotEqualTo(Integer value) {
            addCriterion("accountState <>", value, "accountstate");
            return (Criteria) this;
        }

        public Criteria andAccountstateGreaterThan(Integer value) {
            addCriterion("accountState >", value, "accountstate");
            return (Criteria) this;
        }

        public Criteria andAccountstateGreaterThanOrEqualTo(Integer value) {
            addCriterion("accountState >=", value, "accountstate");
            return (Criteria) this;
        }

        public Criteria andAccountstateLessThan(Integer value) {
            addCriterion("accountState <", value, "accountstate");
            return (Criteria) this;
        }

        public Criteria andAccountstateLessThanOrEqualTo(Integer value) {
            addCriterion("accountState <=", value, "accountstate");
            return (Criteria) this;
        }

        public Criteria andAccountstateIn(List<Integer> values) {
            addCriterion("accountState in", values, "accountstate");
            return (Criteria) this;
        }

        public Criteria andAccountstateNotIn(List<Integer> values) {
            addCriterion("accountState not in", values, "accountstate");
            return (Criteria) this;
        }

        public Criteria andAccountstateBetween(Integer value1, Integer value2) {
            addCriterion("accountState between", value1, value2, "accountstate");
            return (Criteria) this;
        }

        public Criteria andAccountstateNotBetween(Integer value1, Integer value2) {
            addCriterion("accountState not between", value1, value2, "accountstate");
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
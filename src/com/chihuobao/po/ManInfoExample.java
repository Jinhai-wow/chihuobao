package com.chihuobao.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 * 
 * @description 管理员回复信息实体类扩展类
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public class ManInfoExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ManInfoExample() {
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

        public Criteria andInfoidIsNull() {
            addCriterion("infoId is null");
            return (Criteria) this;
        }

        public Criteria andInfoidIsNotNull() {
            addCriterion("infoId is not null");
            return (Criteria) this;
        }

        public Criteria andInfoidEqualTo(Integer value) {
            addCriterion("infoId =", value, "infoid");
            return (Criteria) this;
        }

        public Criteria andInfoidNotEqualTo(Integer value) {
            addCriterion("infoId <>", value, "infoid");
            return (Criteria) this;
        }

        public Criteria andInfoidGreaterThan(Integer value) {
            addCriterion("infoId >", value, "infoid");
            return (Criteria) this;
        }

        public Criteria andInfoidGreaterThanOrEqualTo(Integer value) {
            addCriterion("infoId >=", value, "infoid");
            return (Criteria) this;
        }

        public Criteria andInfoidLessThan(Integer value) {
            addCriterion("infoId <", value, "infoid");
            return (Criteria) this;
        }

        public Criteria andInfoidLessThanOrEqualTo(Integer value) {
            addCriterion("infoId <=", value, "infoid");
            return (Criteria) this;
        }

        public Criteria andInfoidIn(List<Integer> values) {
            addCriterion("infoId in", values, "infoid");
            return (Criteria) this;
        }

        public Criteria andInfoidNotIn(List<Integer> values) {
            addCriterion("infoId not in", values, "infoid");
            return (Criteria) this;
        }

        public Criteria andInfoidBetween(Integer value1, Integer value2) {
            addCriterion("infoId between", value1, value2, "infoid");
            return (Criteria) this;
        }

        public Criteria andInfoidNotBetween(Integer value1, Integer value2) {
            addCriterion("infoId not between", value1, value2, "infoid");
            return (Criteria) this;
        }

        public Criteria andManageidIsNull() {
            addCriterion("manageId is null");
            return (Criteria) this;
        }

        public Criteria andManageidIsNotNull() {
            addCriterion("manageId is not null");
            return (Criteria) this;
        }

        public Criteria andManageidEqualTo(Integer value) {
            addCriterion("manageId =", value, "manageid");
            return (Criteria) this;
        }

        public Criteria andManageidNotEqualTo(Integer value) {
            addCriterion("manageId <>", value, "manageid");
            return (Criteria) this;
        }

        public Criteria andManageidGreaterThan(Integer value) {
            addCriterion("manageId >", value, "manageid");
            return (Criteria) this;
        }

        public Criteria andManageidGreaterThanOrEqualTo(Integer value) {
            addCriterion("manageId >=", value, "manageid");
            return (Criteria) this;
        }

        public Criteria andManageidLessThan(Integer value) {
            addCriterion("manageId <", value, "manageid");
            return (Criteria) this;
        }

        public Criteria andManageidLessThanOrEqualTo(Integer value) {
            addCriterion("manageId <=", value, "manageid");
            return (Criteria) this;
        }

        public Criteria andManageidIn(List<Integer> values) {
            addCriterion("manageId in", values, "manageid");
            return (Criteria) this;
        }

        public Criteria andManageidNotIn(List<Integer> values) {
            addCriterion("manageId not in", values, "manageid");
            return (Criteria) this;
        }

        public Criteria andManageidBetween(Integer value1, Integer value2) {
            addCriterion("manageId between", value1, value2, "manageid");
            return (Criteria) this;
        }

        public Criteria andManageidNotBetween(Integer value1, Integer value2) {
            addCriterion("manageId not between", value1, value2, "manageid");
            return (Criteria) this;
        }

        public Criteria andInfomationIsNull() {
            addCriterion("infomation is null");
            return (Criteria) this;
        }

        public Criteria andInfomationIsNotNull() {
            addCriterion("infomation is not null");
            return (Criteria) this;
        }

        public Criteria andInfomationEqualTo(String value) {
            addCriterion("infomation =", value, "infomation");
            return (Criteria) this;
        }

        public Criteria andInfomationNotEqualTo(String value) {
            addCriterion("infomation <>", value, "infomation");
            return (Criteria) this;
        }

        public Criteria andInfomationGreaterThan(String value) {
            addCriterion("infomation >", value, "infomation");
            return (Criteria) this;
        }

        public Criteria andInfomationGreaterThanOrEqualTo(String value) {
            addCriterion("infomation >=", value, "infomation");
            return (Criteria) this;
        }

        public Criteria andInfomationLessThan(String value) {
            addCriterion("infomation <", value, "infomation");
            return (Criteria) this;
        }

        public Criteria andInfomationLessThanOrEqualTo(String value) {
            addCriterion("infomation <=", value, "infomation");
            return (Criteria) this;
        }

        public Criteria andInfomationLike(String value) {
            addCriterion("infomation like", value, "infomation");
            return (Criteria) this;
        }

        public Criteria andInfomationNotLike(String value) {
            addCriterion("infomation not like", value, "infomation");
            return (Criteria) this;
        }

        public Criteria andInfomationIn(List<String> values) {
            addCriterion("infomation in", values, "infomation");
            return (Criteria) this;
        }

        public Criteria andInfomationNotIn(List<String> values) {
            addCriterion("infomation not in", values, "infomation");
            return (Criteria) this;
        }

        public Criteria andInfomationBetween(String value1, String value2) {
            addCriterion("infomation between", value1, value2, "infomation");
            return (Criteria) this;
        }

        public Criteria andInfomationNotBetween(String value1, String value2) {
            addCriterion("infomation not between", value1, value2, "infomation");
            return (Criteria) this;
        }

        public Criteria andSendobjectIsNull() {
            addCriterion("sendObject is null");
            return (Criteria) this;
        }

        public Criteria andSendobjectIsNotNull() {
            addCriterion("sendObject is not null");
            return (Criteria) this;
        }

        public Criteria andSendobjectEqualTo(Integer value) {
            addCriterion("sendObject =", value, "sendobject");
            return (Criteria) this;
        }

        public Criteria andSendobjectNotEqualTo(Integer value) {
            addCriterion("sendObject <>", value, "sendobject");
            return (Criteria) this;
        }

        public Criteria andSendobjectGreaterThan(Integer value) {
            addCriterion("sendObject >", value, "sendobject");
            return (Criteria) this;
        }

        public Criteria andSendobjectGreaterThanOrEqualTo(Integer value) {
            addCriterion("sendObject >=", value, "sendobject");
            return (Criteria) this;
        }

        public Criteria andSendobjectLessThan(Integer value) {
            addCriterion("sendObject <", value, "sendobject");
            return (Criteria) this;
        }

        public Criteria andSendobjectLessThanOrEqualTo(Integer value) {
            addCriterion("sendObject <=", value, "sendobject");
            return (Criteria) this;
        }

        public Criteria andSendobjectIn(List<Integer> values) {
            addCriterion("sendObject in", values, "sendobject");
            return (Criteria) this;
        }

        public Criteria andSendobjectNotIn(List<Integer> values) {
            addCriterion("sendObject not in", values, "sendobject");
            return (Criteria) this;
        }

        public Criteria andSendobjectBetween(Integer value1, Integer value2) {
            addCriterion("sendObject between", value1, value2, "sendobject");
            return (Criteria) this;
        }

        public Criteria andSendobjectNotBetween(Integer value1, Integer value2) {
            addCriterion("sendObject not between", value1, value2, "sendobject");
            return (Criteria) this;
        }

        public Criteria andSendidIsNull() {
            addCriterion("sendId is null");
            return (Criteria) this;
        }

        public Criteria andSendidIsNotNull() {
            addCriterion("sendId is not null");
            return (Criteria) this;
        }

        public Criteria andSendidEqualTo(Integer value) {
            addCriterion("sendId =", value, "sendid");
            return (Criteria) this;
        }

        public Criteria andSendidNotEqualTo(Integer value) {
            addCriterion("sendId <>", value, "sendid");
            return (Criteria) this;
        }

        public Criteria andSendidGreaterThan(Integer value) {
            addCriterion("sendId >", value, "sendid");
            return (Criteria) this;
        }

        public Criteria andSendidGreaterThanOrEqualTo(Integer value) {
            addCriterion("sendId >=", value, "sendid");
            return (Criteria) this;
        }

        public Criteria andSendidLessThan(Integer value) {
            addCriterion("sendId <", value, "sendid");
            return (Criteria) this;
        }

        public Criteria andSendidLessThanOrEqualTo(Integer value) {
            addCriterion("sendId <=", value, "sendid");
            return (Criteria) this;
        }

        public Criteria andSendidIn(List<Integer> values) {
            addCriterion("sendId in", values, "sendid");
            return (Criteria) this;
        }

        public Criteria andSendidNotIn(List<Integer> values) {
            addCriterion("sendId not in", values, "sendid");
            return (Criteria) this;
        }

        public Criteria andSendidBetween(Integer value1, Integer value2) {
            addCriterion("sendId between", value1, value2, "sendid");
            return (Criteria) this;
        }

        public Criteria andSendidNotBetween(Integer value1, Integer value2) {
            addCriterion("sendId not between", value1, value2, "sendid");
            return (Criteria) this;
        }

        public Criteria andInfodateIsNull() {
            addCriterion("infoDate is null");
            return (Criteria) this;
        }

        public Criteria andInfodateIsNotNull() {
            addCriterion("infoDate is not null");
            return (Criteria) this;
        }

        public Criteria andInfodateEqualTo(Date value) {
            addCriterion("infoDate =", value, "infodate");
            return (Criteria) this;
        }

        public Criteria andInfodateNotEqualTo(Date value) {
            addCriterion("infoDate <>", value, "infodate");
            return (Criteria) this;
        }

        public Criteria andInfodateGreaterThan(Date value) {
            addCriterion("infoDate >", value, "infodate");
            return (Criteria) this;
        }

        public Criteria andInfodateGreaterThanOrEqualTo(Date value) {
            addCriterion("infoDate >=", value, "infodate");
            return (Criteria) this;
        }

        public Criteria andInfodateLessThan(Date value) {
            addCriterion("infoDate <", value, "infodate");
            return (Criteria) this;
        }

        public Criteria andInfodateLessThanOrEqualTo(Date value) {
            addCriterion("infoDate <=", value, "infodate");
            return (Criteria) this;
        }

        public Criteria andInfodateIn(List<Date> values) {
            addCriterion("infoDate in", values, "infodate");
            return (Criteria) this;
        }

        public Criteria andInfodateNotIn(List<Date> values) {
            addCriterion("infoDate not in", values, "infodate");
            return (Criteria) this;
        }

        public Criteria andInfodateBetween(Date value1, Date value2) {
            addCriterion("infoDate between", value1, value2, "infodate");
            return (Criteria) this;
        }

        public Criteria andInfodateNotBetween(Date value1, Date value2) {
            addCriterion("infoDate not between", value1, value2, "infodate");
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
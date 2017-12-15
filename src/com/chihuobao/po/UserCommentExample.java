package com.chihuobao.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 * 
 * @description 用户评论扩展
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public class UserCommentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public UserCommentExample() {
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

        public Criteria andCommentuseridIsNull() {
            addCriterion("commentUserId is null");
            return (Criteria) this;
        }

        public Criteria andCommentuseridIsNotNull() {
            addCriterion("commentUserId is not null");
            return (Criteria) this;
        }

        public Criteria andCommentuseridEqualTo(Integer value) {
            addCriterion("commentUserId =", value, "commentuserid");
            return (Criteria) this;
        }

        public Criteria andCommentuseridNotEqualTo(Integer value) {
            addCriterion("commentUserId <>", value, "commentuserid");
            return (Criteria) this;
        }

        public Criteria andCommentuseridGreaterThan(Integer value) {
            addCriterion("commentUserId >", value, "commentuserid");
            return (Criteria) this;
        }

        public Criteria andCommentuseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("commentUserId >=", value, "commentuserid");
            return (Criteria) this;
        }

        public Criteria andCommentuseridLessThan(Integer value) {
            addCriterion("commentUserId <", value, "commentuserid");
            return (Criteria) this;
        }

        public Criteria andCommentuseridLessThanOrEqualTo(Integer value) {
            addCriterion("commentUserId <=", value, "commentuserid");
            return (Criteria) this;
        }

        public Criteria andCommentuseridIn(List<Integer> values) {
            addCriterion("commentUserId in", values, "commentuserid");
            return (Criteria) this;
        }

        public Criteria andCommentuseridNotIn(List<Integer> values) {
            addCriterion("commentUserId not in", values, "commentuserid");
            return (Criteria) this;
        }

        public Criteria andCommentuseridBetween(Integer value1, Integer value2) {
            addCriterion("commentUserId between", value1, value2, "commentuserid");
            return (Criteria) this;
        }

        public Criteria andCommentuseridNotBetween(Integer value1, Integer value2) {
            addCriterion("commentUserId not between", value1, value2, "commentuserid");
            return (Criteria) this;
        }

        public Criteria andUseridIsNull() {
            addCriterion("userId is null");
            return (Criteria) this;
        }

        public Criteria andUseridIsNotNull() {
            addCriterion("userId is not null");
            return (Criteria) this;
        }

        public Criteria andUseridEqualTo(Integer value) {
            addCriterion("userId =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotEqualTo(Integer value) {
            addCriterion("userId <>", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThan(Integer value) {
            addCriterion("userId >", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("userId >=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThan(Integer value) {
            addCriterion("userId <", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThanOrEqualTo(Integer value) {
            addCriterion("userId <=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridIn(List<Integer> values) {
            addCriterion("userId in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotIn(List<Integer> values) {
            addCriterion("userId not in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridBetween(Integer value1, Integer value2) {
            addCriterion("userId between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotBetween(Integer value1, Integer value2) {
            addCriterion("userId not between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andShopidIsNull() {
            addCriterion("shopId is null");
            return (Criteria) this;
        }

        public Criteria andShopidIsNotNull() {
            addCriterion("shopId is not null");
            return (Criteria) this;
        }

        public Criteria andShopidEqualTo(Integer value) {
            addCriterion("shopId =", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidNotEqualTo(Integer value) {
            addCriterion("shopId <>", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidGreaterThan(Integer value) {
            addCriterion("shopId >", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidGreaterThanOrEqualTo(Integer value) {
            addCriterion("shopId >=", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidLessThan(Integer value) {
            addCriterion("shopId <", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidLessThanOrEqualTo(Integer value) {
            addCriterion("shopId <=", value, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidIn(List<Integer> values) {
            addCriterion("shopId in", values, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidNotIn(List<Integer> values) {
            addCriterion("shopId not in", values, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidBetween(Integer value1, Integer value2) {
            addCriterion("shopId between", value1, value2, "shopid");
            return (Criteria) this;
        }

        public Criteria andShopidNotBetween(Integer value1, Integer value2) {
            addCriterion("shopId not between", value1, value2, "shopid");
            return (Criteria) this;
        }

        public Criteria andUsercommentIsNull() {
            addCriterion("userComment is null");
            return (Criteria) this;
        }

        public Criteria andUsercommentIsNotNull() {
            addCriterion("userComment is not null");
            return (Criteria) this;
        }

        public Criteria andUsercommentEqualTo(String value) {
            addCriterion("userComment =", value, "usercomment");
            return (Criteria) this;
        }

        public Criteria andUsercommentNotEqualTo(String value) {
            addCriterion("userComment <>", value, "usercomment");
            return (Criteria) this;
        }

        public Criteria andUsercommentGreaterThan(String value) {
            addCriterion("userComment >", value, "usercomment");
            return (Criteria) this;
        }

        public Criteria andUsercommentGreaterThanOrEqualTo(String value) {
            addCriterion("userComment >=", value, "usercomment");
            return (Criteria) this;
        }

        public Criteria andUsercommentLessThan(String value) {
            addCriterion("userComment <", value, "usercomment");
            return (Criteria) this;
        }

        public Criteria andUsercommentLessThanOrEqualTo(String value) {
            addCriterion("userComment <=", value, "usercomment");
            return (Criteria) this;
        }

        public Criteria andUsercommentLike(String value) {
            addCriterion("userComment like", value, "usercomment");
            return (Criteria) this;
        }

        public Criteria andUsercommentNotLike(String value) {
            addCriterion("userComment not like", value, "usercomment");
            return (Criteria) this;
        }

        public Criteria andUsercommentIn(List<String> values) {
            addCriterion("userComment in", values, "usercomment");
            return (Criteria) this;
        }

        public Criteria andUsercommentNotIn(List<String> values) {
            addCriterion("userComment not in", values, "usercomment");
            return (Criteria) this;
        }

        public Criteria andUsercommentBetween(String value1, String value2) {
            addCriterion("userComment between", value1, value2, "usercomment");
            return (Criteria) this;
        }

        public Criteria andUsercommentNotBetween(String value1, String value2) {
            addCriterion("userComment not between", value1, value2, "usercomment");
            return (Criteria) this;
        }

        public Criteria andCommentdateIsNull() {
            addCriterion("commentDate is null");
            return (Criteria) this;
        }

        public Criteria andCommentdateIsNotNull() {
            addCriterion("commentDate is not null");
            return (Criteria) this;
        }

        public Criteria andCommentdateEqualTo(Date value) {
            addCriterion("commentDate =", value, "commentdate");
            return (Criteria) this;
        }

        public Criteria andCommentdateNotEqualTo(Date value) {
            addCriterion("commentDate <>", value, "commentdate");
            return (Criteria) this;
        }

        public Criteria andCommentdateGreaterThan(Date value) {
            addCriterion("commentDate >", value, "commentdate");
            return (Criteria) this;
        }

        public Criteria andCommentdateGreaterThanOrEqualTo(Date value) {
            addCriterion("commentDate >=", value, "commentdate");
            return (Criteria) this;
        }

        public Criteria andCommentdateLessThan(Date value) {
            addCriterion("commentDate <", value, "commentdate");
            return (Criteria) this;
        }

        public Criteria andCommentdateLessThanOrEqualTo(Date value) {
            addCriterion("commentDate <=", value, "commentdate");
            return (Criteria) this;
        }

        public Criteria andCommentdateIn(List<Date> values) {
            addCriterion("commentDate in", values, "commentdate");
            return (Criteria) this;
        }

        public Criteria andCommentdateNotIn(List<Date> values) {
            addCriterion("commentDate not in", values, "commentdate");
            return (Criteria) this;
        }

        public Criteria andCommentdateBetween(Date value1, Date value2) {
            addCriterion("commentDate between", value1, value2, "commentdate");
            return (Criteria) this;
        }

        public Criteria andCommentdateNotBetween(Date value1, Date value2) {
            addCriterion("commentDate not between", value1, value2, "commentdate");
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
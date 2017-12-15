package com.chihuobao.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 * 
 * @description 商品实体类扩展类
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public class GoodsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public GoodsExample() {
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

        public Criteria andGoodnumberIsNull() {
            addCriterion("goodNumber is null");
            return (Criteria) this;
        }

        public Criteria andGoodnumberIsNotNull() {
            addCriterion("goodNumber is not null");
            return (Criteria) this;
        }

        public Criteria andGoodnumberEqualTo(String value) {
            addCriterion("goodNumber =", value, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnumberNotEqualTo(String value) {
            addCriterion("goodNumber <>", value, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnumberGreaterThan(String value) {
            addCriterion("goodNumber >", value, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnumberGreaterThanOrEqualTo(String value) {
            addCriterion("goodNumber >=", value, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnumberLessThan(String value) {
            addCriterion("goodNumber <", value, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnumberLessThanOrEqualTo(String value) {
            addCriterion("goodNumber <=", value, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnumberLike(String value) {
            addCriterion("goodNumber like", value, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnumberNotLike(String value) {
            addCriterion("goodNumber not like", value, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnumberIn(List<String> values) {
            addCriterion("goodNumber in", values, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnumberNotIn(List<String> values) {
            addCriterion("goodNumber not in", values, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnumberBetween(String value1, String value2) {
            addCriterion("goodNumber between", value1, value2, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnumberNotBetween(String value1, String value2) {
            addCriterion("goodNumber not between", value1, value2, "goodnumber");
            return (Criteria) this;
        }

        public Criteria andGoodnameIsNull() {
            addCriterion("goodName is null");
            return (Criteria) this;
        }

        public Criteria andGoodnameIsNotNull() {
            addCriterion("goodName is not null");
            return (Criteria) this;
        }

        public Criteria andGoodnameEqualTo(String value) {
            addCriterion("goodName =", value, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodnameNotEqualTo(String value) {
            addCriterion("goodName <>", value, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodnameGreaterThan(String value) {
            addCriterion("goodName >", value, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodnameGreaterThanOrEqualTo(String value) {
            addCriterion("goodName >=", value, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodnameLessThan(String value) {
            addCriterion("goodName <", value, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodnameLessThanOrEqualTo(String value) {
            addCriterion("goodName <=", value, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodnameLike(String value) {
            addCriterion("goodName like", value, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodnameNotLike(String value) {
            addCriterion("goodName not like", value, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodnameIn(List<String> values) {
            addCriterion("goodName in", values, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodnameNotIn(List<String> values) {
            addCriterion("goodName not in", values, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodnameBetween(String value1, String value2) {
            addCriterion("goodName between", value1, value2, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodnameNotBetween(String value1, String value2) {
            addCriterion("goodName not between", value1, value2, "goodname");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidIsNull() {
            addCriterion("goodStyleId is null");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidIsNotNull() {
            addCriterion("goodStyleId is not null");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidEqualTo(Integer value) {
            addCriterion("goodStyleId =", value, "goodstyleid");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidNotEqualTo(Integer value) {
            addCriterion("goodStyleId <>", value, "goodstyleid");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidGreaterThan(Integer value) {
            addCriterion("goodStyleId >", value, "goodstyleid");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidGreaterThanOrEqualTo(Integer value) {
            addCriterion("goodStyleId >=", value, "goodstyleid");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidLessThan(Integer value) {
            addCriterion("goodStyleId <", value, "goodstyleid");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidLessThanOrEqualTo(Integer value) {
            addCriterion("goodStyleId <=", value, "goodstyleid");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidIn(List<Integer> values) {
            addCriterion("goodStyleId in", values, "goodstyleid");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidNotIn(List<Integer> values) {
            addCriterion("goodStyleId not in", values, "goodstyleid");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidBetween(Integer value1, Integer value2) {
            addCriterion("goodStyleId between", value1, value2, "goodstyleid");
            return (Criteria) this;
        }

        public Criteria andGoodstyleidNotBetween(Integer value1, Integer value2) {
            addCriterion("goodStyleId not between", value1, value2, "goodstyleid");
            return (Criteria) this;
        }

        public Criteria andPriceIsNull() {
            addCriterion("price is null");
            return (Criteria) this;
        }

        public Criteria andPriceIsNotNull() {
            addCriterion("price is not null");
            return (Criteria) this;
        }

        public Criteria andPriceEqualTo(Double value) {
            addCriterion("price =", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotEqualTo(Double value) {
            addCriterion("price <>", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThan(Double value) {
            addCriterion("price >", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThanOrEqualTo(Double value) {
            addCriterion("price >=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThan(Double value) {
            addCriterion("price <", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThanOrEqualTo(Double value) {
            addCriterion("price <=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceIn(List<Double> values) {
            addCriterion("price in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotIn(List<Double> values) {
            addCriterion("price not in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceBetween(Double value1, Double value2) {
            addCriterion("price between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotBetween(Double value1, Double value2) {
            addCriterion("price not between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andQuantityIsNull() {
            addCriterion("quantity is null");
            return (Criteria) this;
        }

        public Criteria andQuantityIsNotNull() {
            addCriterion("quantity is not null");
            return (Criteria) this;
        }

        public Criteria andQuantityEqualTo(Integer value) {
            addCriterion("quantity =", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityNotEqualTo(Integer value) {
            addCriterion("quantity <>", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityGreaterThan(Integer value) {
            addCriterion("quantity >", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityGreaterThanOrEqualTo(Integer value) {
            addCriterion("quantity >=", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityLessThan(Integer value) {
            addCriterion("quantity <", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityLessThanOrEqualTo(Integer value) {
            addCriterion("quantity <=", value, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityIn(List<Integer> values) {
            addCriterion("quantity in", values, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityNotIn(List<Integer> values) {
            addCriterion("quantity not in", values, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityBetween(Integer value1, Integer value2) {
            addCriterion("quantity between", value1, value2, "quantity");
            return (Criteria) this;
        }

        public Criteria andQuantityNotBetween(Integer value1, Integer value2) {
            addCriterion("quantity not between", value1, value2, "quantity");
            return (Criteria) this;
        }

        public Criteria andGoodpicIsNull() {
            addCriterion("goodPic is null");
            return (Criteria) this;
        }

        public Criteria andGoodpicIsNotNull() {
            addCriterion("goodPic is not null");
            return (Criteria) this;
        }

        public Criteria andGoodpicEqualTo(String value) {
            addCriterion("goodPic =", value, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodpicNotEqualTo(String value) {
            addCriterion("goodPic <>", value, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodpicGreaterThan(String value) {
            addCriterion("goodPic >", value, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodpicGreaterThanOrEqualTo(String value) {
            addCriterion("goodPic >=", value, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodpicLessThan(String value) {
            addCriterion("goodPic <", value, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodpicLessThanOrEqualTo(String value) {
            addCriterion("goodPic <=", value, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodpicLike(String value) {
            addCriterion("goodPic like", value, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodpicNotLike(String value) {
            addCriterion("goodPic not like", value, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodpicIn(List<String> values) {
            addCriterion("goodPic in", values, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodpicNotIn(List<String> values) {
            addCriterion("goodPic not in", values, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodpicBetween(String value1, String value2) {
            addCriterion("goodPic between", value1, value2, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodpicNotBetween(String value1, String value2) {
            addCriterion("goodPic not between", value1, value2, "goodpic");
            return (Criteria) this;
        }

        public Criteria andGoodintroIsNull() {
            addCriterion("goodIntro is null");
            return (Criteria) this;
        }

        public Criteria andGoodintroIsNotNull() {
            addCriterion("goodIntro is not null");
            return (Criteria) this;
        }

        public Criteria andGoodintroEqualTo(String value) {
            addCriterion("goodIntro =", value, "goodintro");
            return (Criteria) this;
        }

        public Criteria andGoodintroNotEqualTo(String value) {
            addCriterion("goodIntro <>", value, "goodintro");
            return (Criteria) this;
        }

        public Criteria andGoodintroGreaterThan(String value) {
            addCriterion("goodIntro >", value, "goodintro");
            return (Criteria) this;
        }

        public Criteria andGoodintroGreaterThanOrEqualTo(String value) {
            addCriterion("goodIntro >=", value, "goodintro");
            return (Criteria) this;
        }

        public Criteria andGoodintroLessThan(String value) {
            addCriterion("goodIntro <", value, "goodintro");
            return (Criteria) this;
        }

        public Criteria andGoodintroLessThanOrEqualTo(String value) {
            addCriterion("goodIntro <=", value, "goodintro");
            return (Criteria) this;
        }

        public Criteria andGoodintroLike(String value) {
            addCriterion("goodIntro like", value, "goodintro");
            return (Criteria) this;
        }

        public Criteria andGoodintroNotLike(String value) {
            addCriterion("goodIntro not like", value, "goodintro");
            return (Criteria) this;
        }

        public Criteria andGoodintroIn(List<String> values) {
            addCriterion("goodIntro in", values, "goodintro");
            return (Criteria) this;
        }

        public Criteria andGoodintroNotIn(List<String> values) {
            addCriterion("goodIntro not in", values, "goodintro");
            return (Criteria) this;
        }

        public Criteria andGoodintroBetween(String value1, String value2) {
            addCriterion("goodIntro between", value1, value2, "goodintro");
            return (Criteria) this;
        }

        public Criteria andGoodintroNotBetween(String value1, String value2) {
            addCriterion("goodIntro not between", value1, value2, "goodintro");
            return (Criteria) this;
        }

        public Criteria andSellstateIsNull() {
            addCriterion("sellState is null");
            return (Criteria) this;
        }

        public Criteria andSellstateIsNotNull() {
            addCriterion("sellState is not null");
            return (Criteria) this;
        }

        public Criteria andSellstateEqualTo(Integer value) {
            addCriterion("sellState =", value, "sellstate");
            return (Criteria) this;
        }

        public Criteria andSellstateNotEqualTo(Integer value) {
            addCriterion("sellState <>", value, "sellstate");
            return (Criteria) this;
        }

        public Criteria andSellstateGreaterThan(Integer value) {
            addCriterion("sellState >", value, "sellstate");
            return (Criteria) this;
        }

        public Criteria andSellstateGreaterThanOrEqualTo(Integer value) {
            addCriterion("sellState >=", value, "sellstate");
            return (Criteria) this;
        }

        public Criteria andSellstateLessThan(Integer value) {
            addCriterion("sellState <", value, "sellstate");
            return (Criteria) this;
        }

        public Criteria andSellstateLessThanOrEqualTo(Integer value) {
            addCriterion("sellState <=", value, "sellstate");
            return (Criteria) this;
        }

        public Criteria andSellstateIn(List<Integer> values) {
            addCriterion("sellState in", values, "sellstate");
            return (Criteria) this;
        }

        public Criteria andSellstateNotIn(List<Integer> values) {
            addCriterion("sellState not in", values, "sellstate");
            return (Criteria) this;
        }

        public Criteria andSellstateBetween(Integer value1, Integer value2) {
            addCriterion("sellState between", value1, value2, "sellstate");
            return (Criteria) this;
        }

        public Criteria andSellstateNotBetween(Integer value1, Integer value2) {
            addCriterion("sellState not between", value1, value2, "sellstate");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNull() {
            addCriterion("createTime is null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIsNotNull() {
            addCriterion("createTime is not null");
            return (Criteria) this;
        }

        public Criteria andCreatetimeEqualTo(Date value) {
            addCriterion("createTime =", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotEqualTo(Date value) {
            addCriterion("createTime <>", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThan(Date value) {
            addCriterion("createTime >", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("createTime >=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThan(Date value) {
            addCriterion("createTime <", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeLessThanOrEqualTo(Date value) {
            addCriterion("createTime <=", value, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeIn(List<Date> values) {
            addCriterion("createTime in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotIn(List<Date> values) {
            addCriterion("createTime not in", values, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeBetween(Date value1, Date value2) {
            addCriterion("createTime between", value1, value2, "createtime");
            return (Criteria) this;
        }

        public Criteria andCreatetimeNotBetween(Date value1, Date value2) {
            addCriterion("createTime not between", value1, value2, "createtime");
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
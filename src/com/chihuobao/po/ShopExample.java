package com.chihuobao.po;

import java.util.ArrayList;
import java.util.List;
/**
 * 
 * @description 商店实体类扩展类
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public class ShopExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ShopExample() {
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

        public Criteria andShopnumberIsNull() {
            addCriterion("shopNumber is null");
            return (Criteria) this;
        }

        public Criteria andShopnumberIsNotNull() {
            addCriterion("shopNumber is not null");
            return (Criteria) this;
        }

        public Criteria andShopnumberEqualTo(String value) {
            addCriterion("shopNumber =", value, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnumberNotEqualTo(String value) {
            addCriterion("shopNumber <>", value, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnumberGreaterThan(String value) {
            addCriterion("shopNumber >", value, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnumberGreaterThanOrEqualTo(String value) {
            addCriterion("shopNumber >=", value, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnumberLessThan(String value) {
            addCriterion("shopNumber <", value, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnumberLessThanOrEqualTo(String value) {
            addCriterion("shopNumber <=", value, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnumberLike(String value) {
            addCriterion("shopNumber like", value, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnumberNotLike(String value) {
            addCriterion("shopNumber not like", value, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnumberIn(List<String> values) {
            addCriterion("shopNumber in", values, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnumberNotIn(List<String> values) {
            addCriterion("shopNumber not in", values, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnumberBetween(String value1, String value2) {
            addCriterion("shopNumber between", value1, value2, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnumberNotBetween(String value1, String value2) {
            addCriterion("shopNumber not between", value1, value2, "shopnumber");
            return (Criteria) this;
        }

        public Criteria andShopnameIsNull() {
            addCriterion("shopName is null");
            return (Criteria) this;
        }

        public Criteria andShopnameIsNotNull() {
            addCriterion("shopName is not null");
            return (Criteria) this;
        }

        public Criteria andShopnameEqualTo(String value) {
            addCriterion("shopName =", value, "shopname");
            return (Criteria) this;
        }

        public Criteria andShopnameNotEqualTo(String value) {
            addCriterion("shopName <>", value, "shopname");
            return (Criteria) this;
        }

        public Criteria andShopnameGreaterThan(String value) {
            addCriterion("shopName >", value, "shopname");
            return (Criteria) this;
        }

        public Criteria andShopnameGreaterThanOrEqualTo(String value) {
            addCriterion("shopName >=", value, "shopname");
            return (Criteria) this;
        }

        public Criteria andShopnameLessThan(String value) {
            addCriterion("shopName <", value, "shopname");
            return (Criteria) this;
        }

        public Criteria andShopnameLessThanOrEqualTo(String value) {
            addCriterion("shopName <=", value, "shopname");
            return (Criteria) this;
        }

        public Criteria andShopnameLike(String value) {
            addCriterion("shopName like", value, "shopname");
            return (Criteria) this;
        }

        public Criteria andShopnameNotLike(String value) {
            addCriterion("shopName not like", value, "shopname");
            return (Criteria) this;
        }

        public Criteria andShopnameIn(List<String> values) {
            addCriterion("shopName in", values, "shopname");
            return (Criteria) this;
        }

        public Criteria andShopnameNotIn(List<String> values) {
            addCriterion("shopName not in", values, "shopname");
            return (Criteria) this;
        }

        public Criteria andShopnameBetween(String value1, String value2) {
            addCriterion("shopName between", value1, value2, "shopname");
            return (Criteria) this;
        }

        public Criteria andShopnameNotBetween(String value1, String value2) {
            addCriterion("shopName not between", value1, value2, "shopname");
            return (Criteria) this;
        }

        public Criteria andStoreridIsNull() {
            addCriterion("storerId is null");
            return (Criteria) this;
        }

        public Criteria andStoreridIsNotNull() {
            addCriterion("storerId is not null");
            return (Criteria) this;
        }

        public Criteria andStoreridEqualTo(Integer value) {
            addCriterion("storerId =", value, "storerid");
            return (Criteria) this;
        }

        public Criteria andStoreridNotEqualTo(Integer value) {
            addCriterion("storerId <>", value, "storerid");
            return (Criteria) this;
        }

        public Criteria andStoreridGreaterThan(Integer value) {
            addCriterion("storerId >", value, "storerid");
            return (Criteria) this;
        }

        public Criteria andStoreridGreaterThanOrEqualTo(Integer value) {
            addCriterion("storerId >=", value, "storerid");
            return (Criteria) this;
        }

        public Criteria andStoreridLessThan(Integer value) {
            addCriterion("storerId <", value, "storerid");
            return (Criteria) this;
        }

        public Criteria andStoreridLessThanOrEqualTo(Integer value) {
            addCriterion("storerId <=", value, "storerid");
            return (Criteria) this;
        }

        public Criteria andStoreridIn(List<Integer> values) {
            addCriterion("storerId in", values, "storerid");
            return (Criteria) this;
        }

        public Criteria andStoreridNotIn(List<Integer> values) {
            addCriterion("storerId not in", values, "storerid");
            return (Criteria) this;
        }

        public Criteria andStoreridBetween(Integer value1, Integer value2) {
            addCriterion("storerId between", value1, value2, "storerid");
            return (Criteria) this;
        }

        public Criteria andStoreridNotBetween(Integer value1, Integer value2) {
            addCriterion("storerId not between", value1, value2, "storerid");
            return (Criteria) this;
        }

        public Criteria andShopownerIsNull() {
            addCriterion("shopOwner is null");
            return (Criteria) this;
        }

        public Criteria andShopownerIsNotNull() {
            addCriterion("shopOwner is not null");
            return (Criteria) this;
        }

        public Criteria andShopownerEqualTo(String value) {
            addCriterion("shopOwner =", value, "shopowner");
            return (Criteria) this;
        }

        public Criteria andShopownerNotEqualTo(String value) {
            addCriterion("shopOwner <>", value, "shopowner");
            return (Criteria) this;
        }

        public Criteria andShopownerGreaterThan(String value) {
            addCriterion("shopOwner >", value, "shopowner");
            return (Criteria) this;
        }

        public Criteria andShopownerGreaterThanOrEqualTo(String value) {
            addCriterion("shopOwner >=", value, "shopowner");
            return (Criteria) this;
        }

        public Criteria andShopownerLessThan(String value) {
            addCriterion("shopOwner <", value, "shopowner");
            return (Criteria) this;
        }

        public Criteria andShopownerLessThanOrEqualTo(String value) {
            addCriterion("shopOwner <=", value, "shopowner");
            return (Criteria) this;
        }

        public Criteria andShopownerLike(String value) {
            addCriterion("shopOwner like", value, "shopowner");
            return (Criteria) this;
        }

        public Criteria andShopownerNotLike(String value) {
            addCriterion("shopOwner not like", value, "shopowner");
            return (Criteria) this;
        }

        public Criteria andShopownerIn(List<String> values) {
            addCriterion("shopOwner in", values, "shopowner");
            return (Criteria) this;
        }

        public Criteria andShopownerNotIn(List<String> values) {
            addCriterion("shopOwner not in", values, "shopowner");
            return (Criteria) this;
        }

        public Criteria andShopownerBetween(String value1, String value2) {
            addCriterion("shopOwner between", value1, value2, "shopowner");
            return (Criteria) this;
        }

        public Criteria andShopownerNotBetween(String value1, String value2) {
            addCriterion("shopOwner not between", value1, value2, "shopowner");
            return (Criteria) this;
        }

        public Criteria andAdressIsNull() {
            addCriterion("adress is null");
            return (Criteria) this;
        }

        public Criteria andAdressIsNotNull() {
            addCriterion("adress is not null");
            return (Criteria) this;
        }

        public Criteria andAdressEqualTo(String value) {
            addCriterion("adress =", value, "adress");
            return (Criteria) this;
        }

        public Criteria andAdressNotEqualTo(String value) {
            addCriterion("adress <>", value, "adress");
            return (Criteria) this;
        }

        public Criteria andAdressGreaterThan(String value) {
            addCriterion("adress >", value, "adress");
            return (Criteria) this;
        }

        public Criteria andAdressGreaterThanOrEqualTo(String value) {
            addCriterion("adress >=", value, "adress");
            return (Criteria) this;
        }

        public Criteria andAdressLessThan(String value) {
            addCriterion("adress <", value, "adress");
            return (Criteria) this;
        }

        public Criteria andAdressLessThanOrEqualTo(String value) {
            addCriterion("adress <=", value, "adress");
            return (Criteria) this;
        }

        public Criteria andAdressLike(String value) {
            addCriterion("adress like", value, "adress");
            return (Criteria) this;
        }

        public Criteria andAdressNotLike(String value) {
            addCriterion("adress not like", value, "adress");
            return (Criteria) this;
        }

        public Criteria andAdressIn(List<String> values) {
            addCriterion("adress in", values, "adress");
            return (Criteria) this;
        }

        public Criteria andAdressNotIn(List<String> values) {
            addCriterion("adress not in", values, "adress");
            return (Criteria) this;
        }

        public Criteria andAdressBetween(String value1, String value2) {
            addCriterion("adress between", value1, value2, "adress");
            return (Criteria) this;
        }

        public Criteria andAdressNotBetween(String value1, String value2) {
            addCriterion("adress not between", value1, value2, "adress");
            return (Criteria) this;
        }

        public Criteria andLongitudeIsNull() {
            addCriterion("longitude is null");
            return (Criteria) this;
        }

        public Criteria andLongitudeIsNotNull() {
            addCriterion("longitude is not null");
            return (Criteria) this;
        }

        public Criteria andLongitudeEqualTo(Double value) {
            addCriterion("longitude =", value, "longitude");
            return (Criteria) this;
        }

        public Criteria andLongitudeNotEqualTo(Double value) {
            addCriterion("longitude <>", value, "longitude");
            return (Criteria) this;
        }

        public Criteria andLongitudeGreaterThan(Double value) {
            addCriterion("longitude >", value, "longitude");
            return (Criteria) this;
        }

        public Criteria andLongitudeGreaterThanOrEqualTo(Double value) {
            addCriterion("longitude >=", value, "longitude");
            return (Criteria) this;
        }

        public Criteria andLongitudeLessThan(Double value) {
            addCriterion("longitude <", value, "longitude");
            return (Criteria) this;
        }

        public Criteria andLongitudeLessThanOrEqualTo(Double value) {
            addCriterion("longitude <=", value, "longitude");
            return (Criteria) this;
        }

        public Criteria andLongitudeIn(List<Double> values) {
            addCriterion("longitude in", values, "longitude");
            return (Criteria) this;
        }

        public Criteria andLongitudeNotIn(List<Double> values) {
            addCriterion("longitude not in", values, "longitude");
            return (Criteria) this;
        }

        public Criteria andLongitudeBetween(Double value1, Double value2) {
            addCriterion("longitude between", value1, value2, "longitude");
            return (Criteria) this;
        }

        public Criteria andLongitudeNotBetween(Double value1, Double value2) {
            addCriterion("longitude not between", value1, value2, "longitude");
            return (Criteria) this;
        }

        public Criteria andLatitudeIsNull() {
            addCriterion("latitude is null");
            return (Criteria) this;
        }

        public Criteria andLatitudeIsNotNull() {
            addCriterion("latitude is not null");
            return (Criteria) this;
        }

        public Criteria andLatitudeEqualTo(Double value) {
            addCriterion("latitude =", value, "latitude");
            return (Criteria) this;
        }

        public Criteria andLatitudeNotEqualTo(Double value) {
            addCriterion("latitude <>", value, "latitude");
            return (Criteria) this;
        }

        public Criteria andLatitudeGreaterThan(Double value) {
            addCriterion("latitude >", value, "latitude");
            return (Criteria) this;
        }

        public Criteria andLatitudeGreaterThanOrEqualTo(Double value) {
            addCriterion("latitude >=", value, "latitude");
            return (Criteria) this;
        }

        public Criteria andLatitudeLessThan(Double value) {
            addCriterion("latitude <", value, "latitude");
            return (Criteria) this;
        }

        public Criteria andLatitudeLessThanOrEqualTo(Double value) {
            addCriterion("latitude <=", value, "latitude");
            return (Criteria) this;
        }

        public Criteria andLatitudeIn(List<Double> values) {
            addCriterion("latitude in", values, "latitude");
            return (Criteria) this;
        }

        public Criteria andLatitudeNotIn(List<Double> values) {
            addCriterion("latitude not in", values, "latitude");
            return (Criteria) this;
        }

        public Criteria andLatitudeBetween(Double value1, Double value2) {
            addCriterion("latitude between", value1, value2, "latitude");
            return (Criteria) this;
        }

        public Criteria andLatitudeNotBetween(Double value1, Double value2) {
            addCriterion("latitude not between", value1, value2, "latitude");
            return (Criteria) this;
        }

        public Criteria andTelephoneIsNull() {
            addCriterion("telephone is null");
            return (Criteria) this;
        }

        public Criteria andTelephoneIsNotNull() {
            addCriterion("telephone is not null");
            return (Criteria) this;
        }

        public Criteria andTelephoneEqualTo(String value) {
            addCriterion("telephone =", value, "telephone");
            return (Criteria) this;
        }

        public Criteria andTelephoneNotEqualTo(String value) {
            addCriterion("telephone <>", value, "telephone");
            return (Criteria) this;
        }

        public Criteria andTelephoneGreaterThan(String value) {
            addCriterion("telephone >", value, "telephone");
            return (Criteria) this;
        }

        public Criteria andTelephoneGreaterThanOrEqualTo(String value) {
            addCriterion("telephone >=", value, "telephone");
            return (Criteria) this;
        }

        public Criteria andTelephoneLessThan(String value) {
            addCriterion("telephone <", value, "telephone");
            return (Criteria) this;
        }

        public Criteria andTelephoneLessThanOrEqualTo(String value) {
            addCriterion("telephone <=", value, "telephone");
            return (Criteria) this;
        }

        public Criteria andTelephoneLike(String value) {
            addCriterion("telephone like", value, "telephone");
            return (Criteria) this;
        }

        public Criteria andTelephoneNotLike(String value) {
            addCriterion("telephone not like", value, "telephone");
            return (Criteria) this;
        }

        public Criteria andTelephoneIn(List<String> values) {
            addCriterion("telephone in", values, "telephone");
            return (Criteria) this;
        }

        public Criteria andTelephoneNotIn(List<String> values) {
            addCriterion("telephone not in", values, "telephone");
            return (Criteria) this;
        }

        public Criteria andTelephoneBetween(String value1, String value2) {
            addCriterion("telephone between", value1, value2, "telephone");
            return (Criteria) this;
        }

        public Criteria andTelephoneNotBetween(String value1, String value2) {
            addCriterion("telephone not between", value1, value2, "telephone");
            return (Criteria) this;
        }

        public Criteria andShoppicIsNull() {
            addCriterion("shopPic is null");
            return (Criteria) this;
        }

        public Criteria andShoppicIsNotNull() {
            addCriterion("shopPic is not null");
            return (Criteria) this;
        }

        public Criteria andShoppicEqualTo(String value) {
            addCriterion("shopPic =", value, "shoppic");
            return (Criteria) this;
        }

        public Criteria andShoppicNotEqualTo(String value) {
            addCriterion("shopPic <>", value, "shoppic");
            return (Criteria) this;
        }

        public Criteria andShoppicGreaterThan(String value) {
            addCriterion("shopPic >", value, "shoppic");
            return (Criteria) this;
        }

        public Criteria andShoppicGreaterThanOrEqualTo(String value) {
            addCriterion("shopPic >=", value, "shoppic");
            return (Criteria) this;
        }

        public Criteria andShoppicLessThan(String value) {
            addCriterion("shopPic <", value, "shoppic");
            return (Criteria) this;
        }

        public Criteria andShoppicLessThanOrEqualTo(String value) {
            addCriterion("shopPic <=", value, "shoppic");
            return (Criteria) this;
        }

        public Criteria andShoppicLike(String value) {
            addCriterion("shopPic like", value, "shoppic");
            return (Criteria) this;
        }

        public Criteria andShoppicNotLike(String value) {
            addCriterion("shopPic not like", value, "shoppic");
            return (Criteria) this;
        }

        public Criteria andShoppicIn(List<String> values) {
            addCriterion("shopPic in", values, "shoppic");
            return (Criteria) this;
        }

        public Criteria andShoppicNotIn(List<String> values) {
            addCriterion("shopPic not in", values, "shoppic");
            return (Criteria) this;
        }

        public Criteria andShoppicBetween(String value1, String value2) {
            addCriterion("shopPic between", value1, value2, "shoppic");
            return (Criteria) this;
        }

        public Criteria andShoppicNotBetween(String value1, String value2) {
            addCriterion("shopPic not between", value1, value2, "shoppic");
            return (Criteria) this;
        }

        public Criteria andAnnounceIsNull() {
            addCriterion("announce is null");
            return (Criteria) this;
        }

        public Criteria andAnnounceIsNotNull() {
            addCriterion("announce is not null");
            return (Criteria) this;
        }

        public Criteria andAnnounceEqualTo(String value) {
            addCriterion("announce =", value, "announce");
            return (Criteria) this;
        }

        public Criteria andAnnounceNotEqualTo(String value) {
            addCriterion("announce <>", value, "announce");
            return (Criteria) this;
        }

        public Criteria andAnnounceGreaterThan(String value) {
            addCriterion("announce >", value, "announce");
            return (Criteria) this;
        }

        public Criteria andAnnounceGreaterThanOrEqualTo(String value) {
            addCriterion("announce >=", value, "announce");
            return (Criteria) this;
        }

        public Criteria andAnnounceLessThan(String value) {
            addCriterion("announce <", value, "announce");
            return (Criteria) this;
        }

        public Criteria andAnnounceLessThanOrEqualTo(String value) {
            addCriterion("announce <=", value, "announce");
            return (Criteria) this;
        }

        public Criteria andAnnounceLike(String value) {
            addCriterion("announce like", value, "announce");
            return (Criteria) this;
        }

        public Criteria andAnnounceNotLike(String value) {
            addCriterion("announce not like", value, "announce");
            return (Criteria) this;
        }

        public Criteria andAnnounceIn(List<String> values) {
            addCriterion("announce in", values, "announce");
            return (Criteria) this;
        }

        public Criteria andAnnounceNotIn(List<String> values) {
            addCriterion("announce not in", values, "announce");
            return (Criteria) this;
        }

        public Criteria andAnnounceBetween(String value1, String value2) {
            addCriterion("announce between", value1, value2, "announce");
            return (Criteria) this;
        }

        public Criteria andAnnounceNotBetween(String value1, String value2) {
            addCriterion("announce not between", value1, value2, "announce");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeIsNull() {
            addCriterion("businessTime is null");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeIsNotNull() {
            addCriterion("businessTime is not null");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeEqualTo(String value) {
            addCriterion("businessTime =", value, "businesstime");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeNotEqualTo(String value) {
            addCriterion("businessTime <>", value, "businesstime");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeGreaterThan(String value) {
            addCriterion("businessTime >", value, "businesstime");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeGreaterThanOrEqualTo(String value) {
            addCriterion("businessTime >=", value, "businesstime");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeLessThan(String value) {
            addCriterion("businessTime <", value, "businesstime");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeLessThanOrEqualTo(String value) {
            addCriterion("businessTime <=", value, "businesstime");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeLike(String value) {
            addCriterion("businessTime like", value, "businesstime");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeNotLike(String value) {
            addCriterion("businessTime not like", value, "businesstime");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeIn(List<String> values) {
            addCriterion("businessTime in", values, "businesstime");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeNotIn(List<String> values) {
            addCriterion("businessTime not in", values, "businesstime");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeBetween(String value1, String value2) {
            addCriterion("businessTime between", value1, value2, "businesstime");
            return (Criteria) this;
        }

        public Criteria andBusinesstimeNotBetween(String value1, String value2) {
            addCriterion("businessTime not between", value1, value2, "businesstime");
            return (Criteria) this;
        }

        public Criteria andStartpriceIsNull() {
            addCriterion("startPrice is null");
            return (Criteria) this;
        }

        public Criteria andStartpriceIsNotNull() {
            addCriterion("startPrice is not null");
            return (Criteria) this;
        }

        public Criteria andStartpriceEqualTo(Double value) {
            addCriterion("startPrice =", value, "startprice");
            return (Criteria) this;
        }

        public Criteria andStartpriceNotEqualTo(Double value) {
            addCriterion("startPrice <>", value, "startprice");
            return (Criteria) this;
        }

        public Criteria andStartpriceGreaterThan(Double value) {
            addCriterion("startPrice >", value, "startprice");
            return (Criteria) this;
        }

        public Criteria andStartpriceGreaterThanOrEqualTo(Double value) {
            addCriterion("startPrice >=", value, "startprice");
            return (Criteria) this;
        }

        public Criteria andStartpriceLessThan(Double value) {
            addCriterion("startPrice <", value, "startprice");
            return (Criteria) this;
        }

        public Criteria andStartpriceLessThanOrEqualTo(Double value) {
            addCriterion("startPrice <=", value, "startprice");
            return (Criteria) this;
        }

        public Criteria andStartpriceIn(List<Double> values) {
            addCriterion("startPrice in", values, "startprice");
            return (Criteria) this;
        }

        public Criteria andStartpriceNotIn(List<Double> values) {
            addCriterion("startPrice not in", values, "startprice");
            return (Criteria) this;
        }

        public Criteria andStartpriceBetween(Double value1, Double value2) {
            addCriterion("startPrice between", value1, value2, "startprice");
            return (Criteria) this;
        }

        public Criteria andStartpriceNotBetween(Double value1, Double value2) {
            addCriterion("startPrice not between", value1, value2, "startprice");
            return (Criteria) this;
        }

        public Criteria andDeliverycostIsNull() {
            addCriterion("deliveryCost is null");
            return (Criteria) this;
        }

        public Criteria andDeliverycostIsNotNull() {
            addCriterion("deliveryCost is not null");
            return (Criteria) this;
        }

        public Criteria andDeliverycostEqualTo(Double value) {
            addCriterion("deliveryCost =", value, "deliverycost");
            return (Criteria) this;
        }

        public Criteria andDeliverycostNotEqualTo(Double value) {
            addCriterion("deliveryCost <>", value, "deliverycost");
            return (Criteria) this;
        }

        public Criteria andDeliverycostGreaterThan(Double value) {
            addCriterion("deliveryCost >", value, "deliverycost");
            return (Criteria) this;
        }

        public Criteria andDeliverycostGreaterThanOrEqualTo(Double value) {
            addCriterion("deliveryCost >=", value, "deliverycost");
            return (Criteria) this;
        }

        public Criteria andDeliverycostLessThan(Double value) {
            addCriterion("deliveryCost <", value, "deliverycost");
            return (Criteria) this;
        }

        public Criteria andDeliverycostLessThanOrEqualTo(Double value) {
            addCriterion("deliveryCost <=", value, "deliverycost");
            return (Criteria) this;
        }

        public Criteria andDeliverycostIn(List<Double> values) {
            addCriterion("deliveryCost in", values, "deliverycost");
            return (Criteria) this;
        }

        public Criteria andDeliverycostNotIn(List<Double> values) {
            addCriterion("deliveryCost not in", values, "deliverycost");
            return (Criteria) this;
        }

        public Criteria andDeliverycostBetween(Double value1, Double value2) {
            addCriterion("deliveryCost between", value1, value2, "deliverycost");
            return (Criteria) this;
        }

        public Criteria andDeliverycostNotBetween(Double value1, Double value2) {
            addCriterion("deliveryCost not between", value1, value2, "deliverycost");
            return (Criteria) this;
        }

        public Criteria andShopscoreIsNull() {
            addCriterion("shopScore is null");
            return (Criteria) this;
        }

        public Criteria andShopscoreIsNotNull() {
            addCriterion("shopScore is not null");
            return (Criteria) this;
        }

        public Criteria andShopscoreEqualTo(Integer value) {
            addCriterion("shopScore =", value, "shopscore");
            return (Criteria) this;
        }

        public Criteria andShopscoreNotEqualTo(Integer value) {
            addCriterion("shopScore <>", value, "shopscore");
            return (Criteria) this;
        }

        public Criteria andShopscoreGreaterThan(Integer value) {
            addCriterion("shopScore >", value, "shopscore");
            return (Criteria) this;
        }

        public Criteria andShopscoreGreaterThanOrEqualTo(Integer value) {
            addCriterion("shopScore >=", value, "shopscore");
            return (Criteria) this;
        }

        public Criteria andShopscoreLessThan(Integer value) {
            addCriterion("shopScore <", value, "shopscore");
            return (Criteria) this;
        }

        public Criteria andShopscoreLessThanOrEqualTo(Integer value) {
            addCriterion("shopScore <=", value, "shopscore");
            return (Criteria) this;
        }

        public Criteria andShopscoreIn(List<Integer> values) {
            addCriterion("shopScore in", values, "shopscore");
            return (Criteria) this;
        }

        public Criteria andShopscoreNotIn(List<Integer> values) {
            addCriterion("shopScore not in", values, "shopscore");
            return (Criteria) this;
        }

        public Criteria andShopscoreBetween(Integer value1, Integer value2) {
            addCriterion("shopScore between", value1, value2, "shopscore");
            return (Criteria) this;
        }

        public Criteria andShopscoreNotBetween(Integer value1, Integer value2) {
            addCriterion("shopScore not between", value1, value2, "shopscore");
            return (Criteria) this;
        }

        public Criteria andOpenstateIsNull() {
            addCriterion("openState is null");
            return (Criteria) this;
        }

        public Criteria andOpenstateIsNotNull() {
            addCriterion("openState is not null");
            return (Criteria) this;
        }

        public Criteria andOpenstateEqualTo(Integer value) {
            addCriterion("openState =", value, "openstate");
            return (Criteria) this;
        }

        public Criteria andOpenstateNotEqualTo(Integer value) {
            addCriterion("openState <>", value, "openstate");
            return (Criteria) this;
        }

        public Criteria andOpenstateGreaterThan(Integer value) {
            addCriterion("openState >", value, "openstate");
            return (Criteria) this;
        }

        public Criteria andOpenstateGreaterThanOrEqualTo(Integer value) {
            addCriterion("openState >=", value, "openstate");
            return (Criteria) this;
        }

        public Criteria andOpenstateLessThan(Integer value) {
            addCriterion("openState <", value, "openstate");
            return (Criteria) this;
        }

        public Criteria andOpenstateLessThanOrEqualTo(Integer value) {
            addCriterion("openState <=", value, "openstate");
            return (Criteria) this;
        }

        public Criteria andOpenstateIn(List<Integer> values) {
            addCriterion("openState in", values, "openstate");
            return (Criteria) this;
        }

        public Criteria andOpenstateNotIn(List<Integer> values) {
            addCriterion("openState not in", values, "openstate");
            return (Criteria) this;
        }

        public Criteria andOpenstateBetween(Integer value1, Integer value2) {
            addCriterion("openState between", value1, value2, "openstate");
            return (Criteria) this;
        }

        public Criteria andOpenstateNotBetween(Integer value1, Integer value2) {
            addCriterion("openState not between", value1, value2, "openstate");
            return (Criteria) this;
        }

        public Criteria andAuditstateIsNull() {
            addCriterion("auditState is null");
            return (Criteria) this;
        }

        public Criteria andAuditstateIsNotNull() {
            addCriterion("auditState is not null");
            return (Criteria) this;
        }

        public Criteria andAuditstateEqualTo(Integer value) {
            addCriterion("auditState =", value, "auditstate");
            return (Criteria) this;
        }

        public Criteria andAuditstateNotEqualTo(Integer value) {
            addCriterion("auditState <>", value, "auditstate");
            return (Criteria) this;
        }

        public Criteria andAuditstateGreaterThan(Integer value) {
            addCriterion("auditState >", value, "auditstate");
            return (Criteria) this;
        }

        public Criteria andAuditstateGreaterThanOrEqualTo(Integer value) {
            addCriterion("auditState >=", value, "auditstate");
            return (Criteria) this;
        }

        public Criteria andAuditstateLessThan(Integer value) {
            addCriterion("auditState <", value, "auditstate");
            return (Criteria) this;
        }

        public Criteria andAuditstateLessThanOrEqualTo(Integer value) {
            addCriterion("auditState <=", value, "auditstate");
            return (Criteria) this;
        }

        public Criteria andAuditstateIn(List<Integer> values) {
            addCriterion("auditState in", values, "auditstate");
            return (Criteria) this;
        }

        public Criteria andAuditstateNotIn(List<Integer> values) {
            addCriterion("auditState not in", values, "auditstate");
            return (Criteria) this;
        }

        public Criteria andAuditstateBetween(Integer value1, Integer value2) {
            addCriterion("auditState between", value1, value2, "auditstate");
            return (Criteria) this;
        }

        public Criteria andAuditstateNotBetween(Integer value1, Integer value2) {
            addCriterion("auditState not between", value1, value2, "auditstate");
            return (Criteria) this;
        }

        public Criteria andShopstyleidIsNull() {
            addCriterion("shopStyleId is null");
            return (Criteria) this;
        }

        public Criteria andShopstyleidIsNotNull() {
            addCriterion("shopStyleId is not null");
            return (Criteria) this;
        }

        public Criteria andShopstyleidEqualTo(Integer value) {
            addCriterion("shopStyleId =", value, "shopstyleid");
            return (Criteria) this;
        }

        public Criteria andShopstyleidNotEqualTo(Integer value) {
            addCriterion("shopStyleId <>", value, "shopstyleid");
            return (Criteria) this;
        }

        public Criteria andShopstyleidGreaterThan(Integer value) {
            addCriterion("shopStyleId >", value, "shopstyleid");
            return (Criteria) this;
        }

        public Criteria andShopstyleidGreaterThanOrEqualTo(Integer value) {
            addCriterion("shopStyleId >=", value, "shopstyleid");
            return (Criteria) this;
        }

        public Criteria andShopstyleidLessThan(Integer value) {
            addCriterion("shopStyleId <", value, "shopstyleid");
            return (Criteria) this;
        }

        public Criteria andShopstyleidLessThanOrEqualTo(Integer value) {
            addCriterion("shopStyleId <=", value, "shopstyleid");
            return (Criteria) this;
        }

        public Criteria andShopstyleidIn(List<Integer> values) {
            addCriterion("shopStyleId in", values, "shopstyleid");
            return (Criteria) this;
        }

        public Criteria andShopstyleidNotIn(List<Integer> values) {
            addCriterion("shopStyleId not in", values, "shopstyleid");
            return (Criteria) this;
        }

        public Criteria andShopstyleidBetween(Integer value1, Integer value2) {
            addCriterion("shopStyleId between", value1, value2, "shopstyleid");
            return (Criteria) this;
        }

        public Criteria andShopstyleidNotBetween(Integer value1, Integer value2) {
            addCriterion("shopStyleId not between", value1, value2, "shopstyleid");
            return (Criteria) this;
        }

        public Criteria andServicescopeIsNull() {
            addCriterion("serviceScope is null");
            return (Criteria) this;
        }

        public Criteria andServicescopeIsNotNull() {
            addCriterion("serviceScope is not null");
            return (Criteria) this;
        }

        public Criteria andServicescopeEqualTo(Integer value) {
            addCriterion("serviceScope =", value, "servicescope");
            return (Criteria) this;
        }

        public Criteria andServicescopeNotEqualTo(Integer value) {
            addCriterion("serviceScope <>", value, "servicescope");
            return (Criteria) this;
        }

        public Criteria andServicescopeGreaterThan(Integer value) {
            addCriterion("serviceScope >", value, "servicescope");
            return (Criteria) this;
        }

        public Criteria andServicescopeGreaterThanOrEqualTo(Integer value) {
            addCriterion("serviceScope >=", value, "servicescope");
            return (Criteria) this;
        }

        public Criteria andServicescopeLessThan(Integer value) {
            addCriterion("serviceScope <", value, "servicescope");
            return (Criteria) this;
        }

        public Criteria andServicescopeLessThanOrEqualTo(Integer value) {
            addCriterion("serviceScope <=", value, "servicescope");
            return (Criteria) this;
        }

        public Criteria andServicescopeIn(List<Integer> values) {
            addCriterion("serviceScope in", values, "servicescope");
            return (Criteria) this;
        }

        public Criteria andServicescopeNotIn(List<Integer> values) {
            addCriterion("serviceScope not in", values, "servicescope");
            return (Criteria) this;
        }

        public Criteria andServicescopeBetween(Integer value1, Integer value2) {
            addCriterion("serviceScope between", value1, value2, "servicescope");
            return (Criteria) this;
        }

        public Criteria andServicescopeNotBetween(Integer value1, Integer value2) {
            addCriterion("serviceScope not between", value1, value2, "servicescope");
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
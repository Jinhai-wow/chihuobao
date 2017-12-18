package com.chihuobao.po;

import java.io.Serializable;

/**
 * 
 * @description 商店信息实体类
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public class Shop implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String shopNumber;//商店编号

    private String shopName;//商店名

    private Integer storerId;//商店id

    private String shopOwner;//商店法人

    private String address;//商店地址

    private Double longitude;//商店地址经度

    private Double latitude;//商店地址纬度

    private String telephone;//商店手机

    private String shopPic;//商店照片

    private String announce;//商店公告

    private String businessTime;//商店营业时间

    private Double startPrice;//商店起步价

    private Double deliveryCost;//商店配送费

    private Double shopScore;//商店评分

    private Integer openState;//商店状态

    private Integer auditState;//审核状态(0待审核/1已审核/2审核不通过)

    private Integer shopStyleId;//商店类型id

    private Integer serviceScope;//商店服务范围

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getShopNumber() {
        return shopNumber;
    }

    public void setShopNumber(String shopnumber) {
        this.shopNumber = shopnumber == null ? null : shopnumber.trim();
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopname) {
        this.shopName = shopname == null ? null : shopname.trim();
    }

    public Integer getStorerId() {
        return storerId;
    }

    public void setStorerId(Integer storerid) {
        this.storerId = storerid;
    }

    public String getShopOwner() {
        return shopOwner;
    }

    public void setShopOwner(String shopowner) {
        this.shopOwner = shopowner == null ? null : shopowner.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getShopPic() {
        return shopPic;
    }

    public void setShopPic(String shoppic) {
        this.shopPic = shoppic == null ? null : shoppic.trim();
    }

    public String getAnnounce() {
        return announce;
    }

    public void setAnnounce(String announce) {
        this.announce = announce == null ? null : announce.trim();
    }

    public String getBusinessTime() {
        return businessTime;
    }

    public void setBusinessTime(String businesstime) {
        this.businessTime = businesstime == null ? null : businesstime.trim();
    }

    public Double getStartPrice() {
        return startPrice;
    }

    public void setStartPrice(Double startprice) {
        this.startPrice = startprice;
    }

    public Double getDeliveryCost() {
        return deliveryCost;
    }

    public void setDeliveryCost(Double deliverycost) {
        this.deliveryCost = deliverycost;
    }

    public Double getShopScore() {
        return shopScore;
    }

    public void setShopScore(Double shopscore) {
        this.shopScore = shopscore;
    }

    public Integer getOpenState() {
        return openState;
    }

    public void setOpenState(Integer openstate) {
        this.openState = openstate;
    }

    public Integer getAuditState() {
        return auditState;
    }

    public void setAuditState(Integer auditstate) {
        this.auditState = auditstate;
    }

    public Integer getShopStyleId() {
        return shopStyleId;
    }

    public void setShopStyleId(Integer shopstyleid) {
        this.shopStyleId = shopstyleid;
    }

    public Integer getServiceScope() {
        return serviceScope;
    }

    public void setServiceScope(Integer servicescope) {
        this.serviceScope = servicescope;
    }
}
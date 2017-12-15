package com.chihuobao.vo;

import java.io.Serializable;
import java.util.List;

import com.chihuobao.po.ShopStyle;
import com.chihuobao.po.StorerAccount;

/**
 * shop vo实体操作类
 * @author 谢韦烈
 *
 */
public class ShopVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<Integer> ids;
	
	private Integer page;
	private Integer rows;
	
	private Integer id;
	private String shopName;
	private Integer storerId;
	private Integer shopStyleId;
	
	private String shopNumber;//商店编号

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

    private Integer shopScore;//商店评分

    private Integer openState;//商店状态

    private Integer auditState;//审核状态(0待审核/1已审核/2审核不通过)

    private Integer serviceScope;//商店服务范围
    
    private ShopStyle shopStyle;
	
	
    
	public String getShopNumber() {
		return shopNumber;
	}
	public void setShopNumber(String shopNumber) {
		this.shopNumber = shopNumber;
	}
	public String getShopOwner() {
		return shopOwner;
	}
	public void setShopOwner(String shopOwner) {
		this.shopOwner = shopOwner;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
		this.telephone = telephone;
	}
	public String getShopPic() {
		return shopPic;
	}
	public void setShopPic(String shopPic) {
		this.shopPic = shopPic;
	}
	public String getAnnounce() {
		return announce;
	}
	public void setAnnounce(String announce) {
		this.announce = announce;
	}
	public String getBusinessTime() {
		return businessTime;
	}
	public void setBusinessTime(String businessTime) {
		this.businessTime = businessTime;
	}
	public Double getStartPrice() {
		return startPrice;
	}
	public void setStartPrice(Double startPrice) {
		this.startPrice = startPrice;
	}
	public Double getDeliveryCost() {
		return deliveryCost;
	}
	public void setDeliveryCost(Double deliveryCost) {
		this.deliveryCost = deliveryCost;
	}
	public Integer getShopScore() {
		return shopScore;
	}
	public void setShopScore(Integer shopScore) {
		this.shopScore = shopScore;
	}
	public Integer getOpenState() {
		return openState;
	}
	public void setOpenState(Integer openState) {
		this.openState = openState;
	}
	public Integer getAuditState() {
		return auditState;
	}
	public void setAuditState(Integer auditState) {
		this.auditState = auditState;
	}
	public Integer getServiceScope() {
		return serviceScope;
	}
	public void setServiceScope(Integer serviceScope) {
		this.serviceScope = serviceScope;
	}
	private StorerAccount storerAccount;
	
	public ShopStyle getShopStyle() {
		return shopStyle;
	}
	public void setShopStyle(ShopStyle shopStyle) {
		this.shopStyle = shopStyle;
	}
	
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public Integer getStorerId() {
		return storerId;
	}
	public void setStorerId(Integer storerId) {
		this.storerId = storerId;
	}
	public Integer getShopStyleId() {
		return shopStyleId;
	}
	public void setShopStyleId(Integer shopStyleId) {
		this.shopStyleId = shopStyleId;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	
	public StorerAccount getStorerAccount() {
		return storerAccount;
	}
	public void setStorerAccount(StorerAccount storerAccount) {
		this.storerAccount = storerAccount;
	}
	public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	
	
	
	
}

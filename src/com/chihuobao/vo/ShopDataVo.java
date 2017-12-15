package com.chihuobao.vo;

import java.io.Serializable;
import java.util.List;



/**
 * 商店审核资料实体类
 * @author 谢韦烈
 * 2017-12-11
 *
 */
public class ShopDataVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	
	private Integer page;//扩展属性页码
	private Integer rows;//扩展属性行数
	private List<Integer> ids; //扩展属性id序列
	

	private int shopId;//商店id
	private String outPic;// 商店正面照
	private String inPic;// 商店内部照
	private String shopLicense;// 商店营业执照
	private String ownerId;// 法人身份证号码
	private String ownerIdUpPic;// 身份证正面照
	private String ownerIdDownPic;// 身份证背面面照
	private String serviceLicense;// 餐饮服务许可证照片
	private String advise; //审核建议
	
	
	private String shopNumber;//商店编号

    private String shopName;//商店名

    private Integer storerId;//商家id

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

    private Integer shopStyleId;//商店类型id

    private Integer serviceScope;//商店服务范围
    
    
    
    
    public String getAdvise() {
		return advise;
	}

	public void setAdvise(String advise) {
		this.advise = advise;
	}

	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getOutPic() {
		return outPic;
	}

	public void setOutPic(String outPic) {
		this.outPic = outPic;
	}

	public String getInPic() {
		return inPic;
	}

	public void setInPic(String inPic) {
		this.inPic = inPic;
	}

	public String getShopLicense() {
		return shopLicense;
	}

	public void setShopLicense(String shopLicense) {
		this.shopLicense = shopLicense;
	}

	public String getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}

	public String getOwnerIdUpPic() {
		return ownerIdUpPic;
	}

	public void setOwnerIdUpPic(String ownerIdUpPic) {
		this.ownerIdUpPic = ownerIdUpPic;
	}

	public String getOwnerIdDownPic() {
		return ownerIdDownPic;
	}

	public void setOwnerIdDownPic(String ownerIdDownPic) {
		this.ownerIdDownPic = ownerIdDownPic;
	}

	public String getServiceLicense() {
		return serviceLicense;
	}

	public void setServiceLicense(String serviceLicense) {
		this.serviceLicense = serviceLicense;
	}

	public String getShopNumber() {
		return shopNumber;
	}

	public void setShopNumber(String shopNumber) {
		this.shopNumber = shopNumber;
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

	public Integer getShopStyleId() {
		return shopStyleId;
	}

	public void setShopStyleId(Integer shopStyleId) {
		this.shopStyleId = shopStyleId;
	}

	public Integer getServiceScope() {
		return serviceScope;
	}

	public void setServiceScope(Integer serviceScope) {
		this.serviceScope = serviceScope;
	}
	
	
	
	
	

}

/**
 * 
 */
package com.chihuobao.po;

import java.io.Serializable;

/**
 * 
 * @description 商店审核资料实体类
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public class ShopData implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int shopId;//商店id
	private String outPic;// 商店正面照
	private String inPic;// 商店内部照
	private String shopLicense;// 商店营业执照
	private String ownerId;// 法人身份证号码
	private String ownerIdUpPic;// 身份证正面照
	private String ownerIdDownPic;// 身份证背面面照
	private String serviceLicense;// 餐饮服务许可证照片
	private String advice; //审核建议
	
	
	public String getAdvice() {
		return advice;
	}
	public void setAdvice(String advice) {
		this.advice = advice;
	}
	public int getShopId() {
		return shopId;
	}
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	
}

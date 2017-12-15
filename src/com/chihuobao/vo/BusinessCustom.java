/**
 * 
 */
package com.chihuobao.vo;

import java.io.Serializable;
import java.util.List;

import com.chihuobao.po.Goods;
import com.chihuobao.po.ManInfo;
import com.chihuobao.po.Shop;
import com.chihuobao.po.ShopData;
import com.chihuobao.po.StorerAccount;
import com.chihuobao.po.UserComment;

/**
 * 
 * @description 商家信息传入VO类
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public class BusinessCustom implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private StorerAccount storerAccount;//
	private Shop shop;//
	private ShopData shopData;//
	private UserComment userComment;
	private ManInfo manInfo;
	private List<Goods> goods;
	
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	public ShopData getShopData() {
		return shopData;
	}
	public void setShopData(ShopData shopData) {
		this.shopData = shopData;
	}
	public UserComment getUserComment() {
		return userComment;
	}
	public void setUserComment(UserComment userComment) {
		this.userComment = userComment;
	}
	public ManInfo getManInfo() {
		return manInfo;
	}
	public void setManInfo(ManInfo manInfo) {
		this.manInfo = manInfo;
	}
	public StorerAccount getStorerAccount() {
		return storerAccount;
	}
	public void setStorerAccount(StorerAccount storerAccount) {
		this.storerAccount = storerAccount;
	}
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	
}

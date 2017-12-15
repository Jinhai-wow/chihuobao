/**
 * 
 */
package com.chihuobao.vo;

import com.chihuobao.po.Shop;
import com.chihuobao.po.StorerAccount;

/**
 * 
 * @description 商家的扩展类
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public class BusinessExtend {
	private StorerAccount storerAccount;//
	private Shop shop;//
	
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

/**
 * 
 */
package com.chihuobao.vo;

import com.chihuobao.po.Shop;
import com.chihuobao.po.ShopData;

/**
 * @description 商店信息自定义类
 * @author 王锦海
 * @date 2017年12月8日
 * @version 1.0
 */
public class ShopCustom {
	private Shop shop;
	private ShopData shopData;
	
	
	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public ShopData getShopData() {
		return shopData;
	}

	public void setShopData(ShopData shopData) {
		this.shopData = shopData;
	}
}

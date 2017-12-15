package com.chihuobao.vo;

import java.util.List;
/**
 * 用于接收购物车传递过来的值
 * @author 何煜华
 *
 */
public class ShopCartMsgVo {
	private Double totalPrice;
	private Integer shopId;
	private Integer userId;
	private List<ShopCartGoodsListVo> shopCartGoodsList;
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public List<ShopCartGoodsListVo> getShopCartGoodsList() {
		return shopCartGoodsList;
	}
	public void setShopCartGoodsList(List<ShopCartGoodsListVo> shopCartGoodsList) {
		this.shopCartGoodsList = shopCartGoodsList;
	}
	@Override
	public String toString() {
		return "ShopCartMsgVo [totalPrice=" + totalPrice + ", shopId=" + shopId + ", userId=" + userId
				+ ", shopCartGoodsList=" + shopCartGoodsList + "]";
	}
	
	
}

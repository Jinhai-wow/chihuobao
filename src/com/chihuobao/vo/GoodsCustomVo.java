/**
 * 
 */
package com.chihuobao.vo;

import java.util.List;

import com.chihuobao.po.GoodsStyle;
import com.chihuobao.po.Goods;

/**
 * @description 商品实体类扩展类
 * @author 王锦海
 * @date 2017年12月5日
 * @version 1.0
 */
public class GoodsCustomVo{
//	private List<Order> orders;
//
//	public List<Order> getOrders() {
//		return orders;
//	}
//
//	public void setOrders(List<Order> orders) {
//		this.orders = orders;
//	}
//	
	private Goods goods;
	private GoodsCustom goodsCustom;
	private List<GoodsStyle> goodStyles;

	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public GoodsCustom getGoodsCustom() {
		return goodsCustom;
	}

	public void setGoodsCustom(GoodsCustom goodsCustom) {
		this.goodsCustom = goodsCustom;
	}

	public List<GoodsStyle> getGoodStyles() {
		return goodStyles;
	}

	public void setGoodStyles(List<GoodsStyle> goodStyles) {
		this.goodStyles = goodStyles;
	}
	
	}

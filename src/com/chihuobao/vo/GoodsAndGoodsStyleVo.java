package com.chihuobao.vo;

import java.io.Serializable;

import com.chihuobao.po.Goods;
import com.chihuobao.po.GoodsStyle;
import com.chihuobao.po.Shop;

public class GoodsAndGoodsStyleVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Goods goods;
	private GoodsStyle goodsStyle;
	
	private Integer page;
	private Integer rows;
	
	private Shop shop;
	
	
	
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
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
	
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public GoodsStyle getGoodsStyle() {
		return goodsStyle;
	}
	public void setGoodsStyle(GoodsStyle goodsStyle) {
		this.goodsStyle = goodsStyle;
	}
	
	
	
}

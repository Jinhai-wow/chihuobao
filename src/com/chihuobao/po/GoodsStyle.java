package com.chihuobao.po;

import java.io.Serializable;
import java.util.List;


/**
 * 商品类型实体
 * @author Administrator
 *
 */
public class GoodsStyle implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer shopId;
	private String styleName;
	private String styleDesc;
	

	
	private List<Goods> goods;
	
	
	public List<Goods> getGoods() {
		return goods;
	}
	public void setGoods(List<Goods> goods) {
		this.goods = goods;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public String getStyleName() {
		return styleName;
	}
	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}
	public String getStyleDesc() {
		return styleDesc;
	}
	public void setStyleDesc(String styleDesc) {
		this.styleDesc = styleDesc;
	}
	
	

}

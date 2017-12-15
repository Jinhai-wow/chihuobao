package com.chihuobao.po;

import java.io.Serializable;
import java.util.Date;

public class Goods implements Serializable{

	/**
	 * 商品实体
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String goodNumber;
	private String goodName;
	private Integer goodStyleId;
	private Double price;
	private Integer quantity;
	private String goodPic;
	private String goodIntro;
	private Integer sellState;
	private Date createTime;
	
	private GoodsStyle goodsStyle;  //商品关联的对象
	
	
	
	
	public GoodsStyle getGoodsStyle() {
		return goodsStyle;
	}
	public void setGoodsStyle(GoodsStyle goodsStyle) {
		this.goodsStyle = goodsStyle;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodNumber() {
		return goodNumber;
	}
	public void setGoodNumber(String goodNumber) {
		this.goodNumber = goodNumber;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public Integer getGoodStyleId() {
		return goodStyleId;
	}
	public void setGoodStyleId(Integer goodStyleId) {
		this.goodStyleId = goodStyleId;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getGoodPic() {
		return goodPic;
	}
	public void setGoodPic(String goodPic) {
		this.goodPic = goodPic;
	}
	public String getGoodIntro() {
		return goodIntro;
	}
	public void setGoodIntro(String goodIntro) {
		this.goodIntro = goodIntro;
	}
	public Integer getSellState() {
		return sellState;
	}
	public void setSellState(Integer sellState) {
		this.sellState = sellState;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
}

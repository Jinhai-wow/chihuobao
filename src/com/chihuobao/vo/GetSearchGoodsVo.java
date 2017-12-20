package com.chihuobao.vo;
/**
 * 用于存储搜索到的数据
 * @author 何煜华
 * 2017-12-18
 */
public class GetSearchGoodsVo {
	private Integer id;
	private String goodName;
	private Double price;
	private Integer sellState;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getSellState() {
		return sellState;
	}
	public void setSellState(Integer sellState) {
		this.sellState = sellState;
	}
	@Override
	public String toString() {
		return "GetSearchGoodsVo [id=" + id + ", goodName=" + goodName + ", price=" + price + ", sellState=" + sellState
				+ "]";
	}

}

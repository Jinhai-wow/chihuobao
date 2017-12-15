package com.chihuobao.vo;
/**
 * 用于接受购物车传递过来的值
 * @author 何煜华
 *
 */
public class ShopCartGoodsListVo {
	private Integer goodsId;
	private Integer goodsNum;
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Integer getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(Integer goodsNum) {
		this.goodsNum = goodsNum;
	}
	@Override
	public String toString() {
		return "ShopCartGoodsListVo [goodsId=" + goodsId + ", goodsNum=" + goodsNum + "]";
	}

}

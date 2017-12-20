package com.chihuobao.vo;

import java.util.List;

/**
 * 用于存储搜索到的数据
 * 
 * @author 何煜华 2017-12-18
 */
public class GetSearchShopAndGoodsVo {

	private Integer id;
	private String shopName;
	private Double shopScore;
	private Integer openState;

	private List<GetSearchGoodsStyleVo> getSearchGoodsStyleVo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public Double getShopScore() {
		return shopScore;
	}

	public void setShopScore(Double shopScore) {
		this.shopScore = shopScore;
	}

	public Integer getOpenState() {
		return openState;
	}

	public void setOpenState(Integer openState) {
		this.openState = openState;
	}

	public List<GetSearchGoodsStyleVo> getGetSearchGoodsStyleVo() {
		return getSearchGoodsStyleVo;
	}

	public void setGetSearchGoodsStyleVo(List<GetSearchGoodsStyleVo> getSearchGoodsStyleVo) {
		this.getSearchGoodsStyleVo = getSearchGoodsStyleVo;
	}

	@Override
	public String toString() {
		return "GetSearchShopAndGoodsVo [id=" + id + ", shopName=" + shopName + ", shopScore=" + shopScore
				+ ", openState=" + openState + ", getSearchGoodsStyleVo=" + getSearchGoodsStyleVo + "]";
	}


}

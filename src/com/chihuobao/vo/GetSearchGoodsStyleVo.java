package com.chihuobao.vo;

import java.util.List;

/**
 * 用于存储搜索到的数据
 * @author 何煜华
 * 2017-12-18
 */
public class GetSearchGoodsStyleVo {
	private List<GetSearchGoodsVo> getSearchGoodsVo;

	public List<GetSearchGoodsVo> getGetSearchGoodsVo() {
		return getSearchGoodsVo;
	}

	public void setGetSearchGoodsVo(List<GetSearchGoodsVo> getSearchGoodsVo) {
		this.getSearchGoodsVo = getSearchGoodsVo;
	}

	@Override
	public String toString() {
		return "GetSearchGoodsStyleVo [getSearchGoodsVo=" + getSearchGoodsVo + "]";
	}
}

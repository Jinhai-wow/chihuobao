package com.chihuobao.vo;

import java.util.List;

/**
 * 获取搜索内容字符串
 * 
 * @author 何煜华 2017-12-17
 */
public class GetSearchMsg {
	private String searchMsg;
	private List<Integer> nearbyShopIdList;
	public String getSearchMsg() {
		return searchMsg;
	}
	public void setSearchMsg(String searchMsg) {
		this.searchMsg = searchMsg;
	}
	public List<Integer> getNearbyShopIdList() {
		return nearbyShopIdList;
	}
	public void setNearbyShopIdList(List<Integer> nearbyShopIdList) {
		this.nearbyShopIdList = nearbyShopIdList;
	}
	@Override
	public String toString() {
		return "GetSearchMsg [searchMsg=" + searchMsg + ", nearbyShopIdList=" + nearbyShopIdList + "]";
	}
	
}

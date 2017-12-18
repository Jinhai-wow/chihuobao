/**
 * 
 */
package com.chihuobao.vo;

import java.util.List;

import com.chihuobao.po.Ordertable;
import com.chihuobao.po.User;
/**
 * @description 订单扩展类
 * @author 王锦海
 * @date 2017年12月12日
 * @version 1.0
 */
public class OrderCustom{
	
	private Ordertable ordertable;
	private User user;
	
	private Integer goodListCount;//商店商品销量
	
	public Integer getGoodListCount() {
		return goodListCount;
	}
	public void setGoodListCount(Integer goodListCount) {
		this.goodListCount = goodListCount;
	}
	public Ordertable getOrdertable() {
		return ordertable;
	}
	public void setOrdertable(Ordertable ordertable) {
		this.ordertable = ordertable;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}

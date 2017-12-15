package com.chihuobao.mapper.order;

import java.util.List;

import com.chihuobao.po.Complain;
import com.chihuobao.po.Ordergoods;
import com.chihuobao.po.Ordertable;
import com.chihuobao.po.PageBean;
import com.chihuobao.po.Shop;
import com.chihuobao.po.Shopcart;
import com.chihuobao.po.UserForOrder;


public interface OrdertableDao {
    
	/*public Ordertable getOrder(Integer id);*/
	public List<Ordertable> getOrderList();
	public Ordertable getOrder(long id);
	/*获取分页数据*/
	public List<Ordertable> getOrderListByPagination(PageBean pageBean);
	/*获取数据库订单的数量*/
	public int getOrderListSize();
	
	/*获取购物车数据*/
	public  Shopcart getShopCart(Integer shopcartid);
	/*查询用户，获取用户信息及对应的Address表的address*/
	public UserForOrder  getUser(Integer userid);
	
	public Shop getShop(Integer shopid);
	
	public void addOrder(Ordertable ordertable);
	
	public void addOrderGoods(Ordergoods ordergoods);
	
	public List<Ordergoods> getOrdergoodsListByOrderID(long orderid);
	
	public void updateOrder(Ordertable ordertable);
	
	
	public void updateOrderState(long id);
	public void applyCancelOrder(long id);
	
	
	/*查询该用户id，下所有未付款订单（即ordertable的state为0）*/
	
	
	public List<Ordertable> getOrderNoPay();
	
	public void modifyOrderState(List<Long> orderIdList);
	
	
	public void addComplain(Complain complain);
	
	

}

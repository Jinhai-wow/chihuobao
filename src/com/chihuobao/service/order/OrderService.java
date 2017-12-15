package com.chihuobao.service.order;

import java.util.List;

import com.chihuobao.po.Complain;
import com.chihuobao.po.Ordergoods;
import com.chihuobao.po.Ordertable;
import com.chihuobao.po.PageBean;
import com.chihuobao.po.Shop;
import com.chihuobao.po.Shopcart;
import com.chihuobao.po.User;
import com.chihuobao.po.UserForOrder;
import com.github.pagehelper.PageInfo;

public interface OrderService {
/*获取所有数据*/
	public List<Ordertable> getOrderList();
	public Ordertable getOrder(long id);
	
	/*使用mybatis分页插件pagehelper* page第几页，rows该页行数*/

	/*public PageInfo<Ordertable> getOrderListByPagination(Integer page,Integer rows);*/
	public List<Ordertable> getOrderListByPagination(PageBean pageBean);
	public int getOrderListSize();
	public  Shopcart getShopCart(Integer shopcartid);
	public UserForOrder  getUser(Integer userid);
	public Shop getShop(Integer shopid);
	
	public void addOrder(Ordertable ordertable);
	
	public void addOrderGoods(Ordergoods ordergoods);
	public List<Ordergoods> getOrdergoodsListByOrderID(long orderid);
	public void updateOrder(Ordertable ordertable);
	public void updateOrderState(long id);
	public void applyCancelOrder(long id);
	
	public List<Ordertable> getOrderNoPay();
	public void modifyOrderState(List<Long> orderIdList);
	public void addComplain(Complain complain);
}

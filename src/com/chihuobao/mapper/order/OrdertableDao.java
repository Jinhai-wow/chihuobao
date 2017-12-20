package com.chihuobao.mapper.order;

import java.util.List;

import com.chihuobao.po.Address;
import com.chihuobao.po.Complain;
import com.chihuobao.po.Ordergoods;
import com.chihuobao.po.Ordertable;
import com.chihuobao.po.PageBean;
import com.chihuobao.po.Shop;
import com.chihuobao.po.Shopcart;
import com.chihuobao.po.UserForOrder;

public interface OrdertableDao {

	/*
	 * 获取所有订单
	 */
	public List<Ordertable> getOrderList();

	/*
	 * 根据订单id获取订单   
	 * @param  id :订单id
	 */
	public Ordertable getOrder(long id);

	/* 
	 * 获取分页数据 ,返回订单集合
	 * @param  pageBean:自定义类，里面有page,rows属性对应页数，每页多少条数据
	 * 
	 * */
	public List<Ordertable> getOrderListByPagination(PageBean pageBean);

	/* 获取数据库订单的数量 */
	public int getOrderListSize(Integer userid);

	/*根据购物车id 获取购物车数据
	 * @param shopcartid:购物车id
	 *  */
	public Shopcart getShopCart(Integer shopcartid);

	/* 查询用户，获取用户信息及对应的Address表的address
	 * @param  userid :用户id
	 *  
	 *  */
	public UserForOrder getUser(Integer userid);

	/* 根据商店id查询商店
	 * @param   shopid :商店id
	 *  
	 *  */
	
	public Shop getShop(Integer shopid);


	/* 添加订单
	 * @param  ordertable :订单
	 *  
	 *  */
	
	public void addOrder(Ordertable ordertable);

	/* 添加订单里面的商品
	 * @param  ordergoods :订单中的商品
	 *  
	 *  */
	
	public void addOrderGoods(Ordergoods ordergoods);
	
	/*根据订单id获取订单中的商品
	 * @param  orderid :订单id
	 *  
	 *  */
	

	public List<Ordergoods> getOrdergoodsListByOrderID(long orderid);

	
	/*更新订单，比如提交评价后调用
	 * @param  ordertable :订单类
	 *  
	 *  */
	
	public void updateOrder(Ordertable ordertable);

	/*更新订单状态 	orderState 0 为未付款状态, 1为未接单状态，2为已接单状态，3为已接单并发货状态，
	 * 4为取消的订单，5为确认收货，6为删除订单，7申请取消未接单的订单，8确认收货且已评价，9为失效订单
	 * @param  id :订单id
	 *  
	 *  */
	/*确认收货*/
	public void updateOrderState(long id);
/* 支付成功后更改为未接单状态*/
	public void updateOrderStateNoTakeOrder(long id);
	/*
	 * 申请取消订单
	 * 
	 * @param id：订单id
	 * */
	
	public void applyCancelOrder(long id);

	
	
	
	/* 
	 * 查询该用户id，下所有未付款订单（即ordertable的state为0）
	 * 
	 *  
	 *  */

	public List<Ordertable> getOrderNoPay();
	
	/*
	 * 修改订单状态，用于quartz定时修改未付款订单，超过30分钟，为失效订单，orderstate为9
	 * 
	 * @param List<Long> orderIdList：订单id集合
	 * */
	

	public void modifyOrderState(List<Long> orderIdList);

	/*
	 * 评价
	 * 
	 * @param complain：评价对应的类
	 * */
	
	
	public void addComplain(Complain complain);
	/*
	 * 更新用户
	 * 
	 * @param userForOrder：对应用户信息的bean类
	 * */
	
	
	public void updateUser(UserForOrder userForOrder);
	
	/*
	 * 添加地址
	 * 
	 * @param  address：对应用户地址类
	 * */
	

	public void addAddress(Address address);
	/*把其他地址state先置为0*/
	public void modifyAddressState(Integer userid);
	
	

}

package com.chihuobao.service.impl.order;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.order.OrdertableDao;
import com.chihuobao.po.Address;
import com.chihuobao.po.Complain;
import com.chihuobao.po.Ordergoods;
import com.chihuobao.po.Ordertable;
import com.chihuobao.po.PageBean;
import com.chihuobao.po.Shop;
import com.chihuobao.po.Shopcart;
import com.chihuobao.po.UserForOrder;
import com.chihuobao.service.order.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrdertableDao ordertableDao;
	@Override
	public List<Ordertable> getOrderList() {
		List<Ordertable> orderList = ordertableDao.getOrderList();
		return orderList;
	}

	@Override
	public Ordertable getOrder(long id) {
		Ordertable order = ordertableDao.getOrder(id);
		return order;
	}

	@Override
	public List<Ordertable> getOrderListByPagination(PageBean pageBean) {
		List<Ordertable> orderList=ordertableDao.getOrderListByPagination(pageBean);
		return orderList;
	}

	
	@Override
	public int getOrderListSize() {
		int orderListSize=ordertableDao.getOrderListSize();
		return orderListSize;
	}

	@Override
	public Shopcart getShopCart(Integer shopcartid) {
		Shopcart shopcart=ordertableDao.getShopCart(shopcartid);
		
		return shopcart;
	}

	@Override
	public UserForOrder getUser(Integer userid) {
		UserForOrder user=ordertableDao.getUser(userid);
		return user;
	}

	@Override
	public Shop getShop(Integer shopid) {
		Shop  shop=ordertableDao.getShop(shopid);
		return shop;
	}
    @Transactional
	@Override
	public void addOrder(Ordertable ordertable) {
		ordertableDao.addOrder(ordertable);
		
	}
    @Transactional
	@Override
	public void addOrderGoods(Ordergoods ordergoods) {
    	ordertableDao.addOrderGoods(ordergoods);
		
	}

	@Override
	public List<Ordergoods> getOrdergoodsListByOrderID(long orderid) {
		// TODO Auto-generated method stub
		System.out.println(ordertableDao.getOrdergoodsListByOrderID(orderid));
		return ordertableDao.getOrdergoodsListByOrderID(orderid);
		
	}

	@Override
	public void updateOrder(Ordertable ordertable) {
		ordertableDao.updateOrder(ordertable);
		
	}

	@Override
	public void updateOrderState(long id) {
		ordertableDao.updateOrderState(id);
		
	}

	@Override
	public void applyCancelOrder(long id) {
		// TODO Auto-generated method stub
		ordertableDao.applyCancelOrder(id);
	}

	@Override
	public List<Ordertable> getOrderNoPay() {
		return ordertableDao.getOrderNoPay();
		
	}

	@Override
	public void modifyOrderState(List<Long> orderIdList) {
		ordertableDao.modifyOrderState(orderIdList);
		
	}

	@Override
	public void addComplain(Complain complain) {
		ordertableDao.addComplain(complain);
		
	}

	@Override
	public void updateUser(UserForOrder userForOrder) {
		ordertableDao.updateUser(userForOrder);
		
	}

	@Override
	public void addAddress(Address address) {
		// TODO Auto-generated method stub
		ordertableDao.addAddress(address);
	}

	@Override
	public void modifyAddressState() {
		ordertableDao.modifyAddressState();
		
	}


	



/*	@Override
	public PageInfo<Ordertable> getOrderListByPagination(Integer page, Integer rows) {
		分页合理化
		PageHelper.startPage(page, rows);
		List<Ordertable> orderList = ordertableDao.getOrderList();
		
		PageInfo<Ordertable> pageInfo=new PageInfo<Ordertable>(orderList);
		
		
		return pageInfo;
	}*/

	
	
	
	
}

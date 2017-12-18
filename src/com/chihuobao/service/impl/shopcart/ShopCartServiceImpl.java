package com.chihuobao.service.impl.shopcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.shopcart.ShopCartMapper;
import com.chihuobao.po.Goods;
import com.chihuobao.po.Shop;
import com.chihuobao.po.Shopcart;
import com.chihuobao.po.Shopcartlist;
import com.chihuobao.po.User;
import com.chihuobao.service.shopcart.ShopCartService;

@Service("ShopCartService")
@Transactional
public class ShopCartServiceImpl implements ShopCartService {

	@Autowired
	private ShopCartMapper shopCartMapper;

	//查找商店 、用户、商品判断其是否存在
	public Shop findShopByShopId(Integer id){
		return shopCartMapper.findShopByShopId(id);
	}
	public Goods findGoodsByGoodsId(Integer id){
		return shopCartMapper.findGoodsByGoodsId(id);
	}
	public User findUserByUserId(Integer id){
		return shopCartMapper.findUserByUserId(id);
	}
	
	//创建购物车
	public void createShopCart(Shopcart shopCart){
		shopCartMapper.createShopCart(shopCart);
	}
	//创建购物车的商品列表
	public void createShopCartGoods(Shopcartlist shopCartList){
		shopCartMapper.createShopCartGoods(shopCartList);
	}
	@Override
	public int selectLastShopCartId() {
		
		return shopCartMapper.selectShopCartId();
	}

}

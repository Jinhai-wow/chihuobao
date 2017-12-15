package com.chihuobao.mapper.shopcart;

import com.chihuobao.po.Goods;
import com.chihuobao.po.Shop;
import com.chihuobao.po.Shopcart;
import com.chihuobao.po.Shopcartlist;
import com.chihuobao.po.User;
/**
 * 购物车的Mapper方法
 * @author 何煜华
 * 2017-12-07
 */
public interface ShopCartMapper {
	
	//查找商店 、用户、商品判断其是否存在
	public Shop findShopByShopId(Integer id);
	public Goods findGoodsByGoodsId(Integer id);
	public User findUserByUserId(Integer id);
	
	
	//创建购物车
	public void createShopCart(Shopcart shopCart);
	//创建购物车的商品列表
	public void createShopCartGoods(Shopcartlist shopCartList);
}

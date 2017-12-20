package com.chihuobao.controller.shopcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.Goods;
import com.chihuobao.po.Shop;
import com.chihuobao.po.Shopcart;
import com.chihuobao.po.Shopcartlist;
import com.chihuobao.po.User;
import com.chihuobao.service.shopcart.ShopCartService;
import com.chihuobao.vo.ShopCartMsgVo;
import com.google.gson.Gson;

/**
 * shopcart的controller
 * 
 * @author 何煜华 2017-12-09
 */
@Controller
public class ShopCartController {

	@Autowired
	private ShopCartService shopCartService;

	// 添加商品
		@RequestMapping(value = "shopCartAddGoods.action", method = { RequestMethod.GET, RequestMethod.POST },produces = "text/json;charset=UTF-8")
		public @ResponseBody String shopCartAddGoods(@RequestBody String result ) {
			Gson gson=new Gson();
			ShopCartMsgVo fromJson = gson.fromJson(result, ShopCartMsgVo.class);
			//在数据库中查找 商店、用户、商品
			int shocatid = -1;
			try {
				Shop shop = shopCartService.findShopByShopId(fromJson.getShopId());
				User user = shopCartService.findUserByUserId(fromJson.getUserId());
				if(shop!=null && user!=null){
					//创建输入购物车信息
					Shopcart shopCart = new Shopcart();
					shopCart.setShopid(shop.getId());
					shopCart.setShopname(shop.getShopName());
					shopCart.setTotalprice(fromJson.getTotalPrice()+shop.getDeliveryCost());
					shopCart.setUserid(fromJson.getUserId());
					//创建购物车
					shopCartService.createShopCart(shopCart);
					System.out.println(shopCart.getShopcartid());
					
					for(int i=0;i<fromJson.getShopCartGoodsList().size();i++){
						System.out.println(fromJson.getShopCartGoodsList().get(i).getGoodsId());
						Goods goods = shopCartService.findGoodsByGoodsId(fromJson.getShopCartGoodsList().get(i).getGoodsId());
						//创建商品信息
						Shopcartlist shopCartList = new Shopcartlist();
						shopCartList.setGoodsname(goods.getGoodName());
						shopCartList.setGoodsquatity(fromJson.getShopCartGoodsList().get(i).getGoodsNum());
						shopCartList.setGoodsprice(goods.getPrice());
						shopCartList.setShopcartid(shopCart.getShopcartid());
						
						System.out.println(shopCartList);
						//创建购物车
						shopCartService.createShopCartGoods(shopCartList);
						shopCartService.selectLastShopCartId();
					}
					shocatid = shopCart.getShopcartid();
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return ""+shocatid;
		}

}

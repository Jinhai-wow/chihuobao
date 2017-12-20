package com.chihuobao.controller.search;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.Shop;
import com.chihuobao.service.search.ShopAndGoodsSearchService;
import com.chihuobao.vo.GetSearchMsg;
import com.chihuobao.vo.GetSearchShopAndGoodsVo;
import com.google.gson.Gson;

@Controller
public class ShopAndGoodsSearchController {
	@Autowired
	private ShopAndGoodsSearchService shopAndGoodsSearchService;

	@RequestMapping(value = "shopAndGoodsSearch.action", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody List<GetSearchShopAndGoodsVo> shopAndGoodsSearch(@RequestBody String result) {
		Gson gson = new Gson();
		GetSearchMsg fromJson =  gson.fromJson(result, GetSearchMsg.class);
		String searchMsg = fromJson.getSearchMsg();
		List<Integer> nearbyShopIdList = fromJson.getNearbyShopIdList();
		
		List<GetSearchShopAndGoodsVo> searchGoodsList = new ArrayList<GetSearchShopAndGoodsVo>();

		if(searchMsg.trim().length() == 0 || nearbyShopIdList.size() == 0){
			return searchGoodsList;//searchGoodsList = []
		}
		try {
			
			/*
			 * 返回的结果： [
			 * 		{shopMsg:shopMsg,Goods:[goods1,goods2]},
			 * 		{shopMsg:shopMsg,Goods:[goods1,goods2]},
			 * 		{shopMsg:shopMsg,Goods:[goods1,goods2]}
			 * ]
			 *  
			 * 商家信息 : id shopName shopScore openState
			 * 
			 * 在id为 [1,2,3,4]的商家中搜索满足条件的商品
			 * 
			 * 
			 * 先从商品名字查找，再从商店名查找
			 * html贴数据的时候，先贴有商品的，然后再查找这个商店名的是否已经写进去了
			 * 是 就跳过 ，否 就把这个商店名插到最前面
			 * 
			 * 
			 * 要记得判断页面拿到的，显示在页面上的商家id列表是否为空
			 */

			//搜索商品
			searchGoodsList = shopAndGoodsSearchService.searchGoodsList(fromJson);
			System.out.println("---------------");
			for (GetSearchShopAndGoodsVo getSearchShopAndGoodsVo : searchGoodsList) {
				System.out.println(getSearchShopAndGoodsVo);
			}
			//搜索商店
			List<Shop> shops = shopAndGoodsSearchService.shopSearch(searchMsg);
			for (Shop shop : shops) {
				//用于判断 是否存在只搜索到商店名而没有搜索到商品的
				Integer state = 0;
				//判断已搜索到的商品中，是否含找到的全部商家
				for(Integer i=0;i<searchGoodsList.size();i++){
					if(searchGoodsList.get(i).getId() == shop.getId()){
						state = 1;
					}
				}
				if(state == 0){
					GetSearchShopAndGoodsVo set = new GetSearchShopAndGoodsVo();
					set.setId(shop.getId());
					set.setShopName(shop.getShopName());
					set.setShopScore(shop.getShopScore());
					set.setOpenState(shop.getOpenState());
					searchGoodsList.add(set);
				}
			}
				
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return searchGoodsList;
	}
	@RequestMapping(value = "jumpToSearchResultPage.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String jumpToSearchResultPage() {
		return "search/searchResult";
	}
}

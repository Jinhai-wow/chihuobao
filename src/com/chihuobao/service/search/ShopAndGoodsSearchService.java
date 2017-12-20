package com.chihuobao.service.search;

import java.util.List;

import com.chihuobao.po.Shop;
import com.chihuobao.vo.GetSearchMsg;
import com.chihuobao.vo.GetSearchShopAndGoodsVo;

public interface ShopAndGoodsSearchService {
	// 搜索商家
	public List<Shop> shopSearch(String string);

	// 根据页面显示的商家与用户输入的内容查找商品列表
	public List<GetSearchShopAndGoodsVo> searchGoodsList(GetSearchMsg getSearchMsg);
}

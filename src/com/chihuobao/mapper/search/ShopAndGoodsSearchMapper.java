package com.chihuobao.mapper.search;

import java.util.List;

import com.chihuobao.po.Shop;
import com.chihuobao.vo.GetSearchMsg;
import com.chihuobao.vo.GetSearchShopAndGoodsVo;

/**
 * 搜索商店、商品Mapper
 * 
 * @author 何煜华 2017-12-17
 */

public interface ShopAndGoodsSearchMapper {
	// 搜索商家
	public List<Shop> shopSearch(String string);

	// 根据页面显示的商家与用户输入的内容查找商品列表
	public List<GetSearchShopAndGoodsVo> searchGoodsList(GetSearchMsg getSearchMsg);
}

package com.chihuobao.service.impl.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.search.ShopAndGoodsSearchMapper;
import com.chihuobao.po.Shop;
import com.chihuobao.service.search.ShopAndGoodsSearchService;
import com.chihuobao.vo.GetSearchMsg;
import com.chihuobao.vo.GetSearchShopAndGoodsVo;

@Service("ShopAndGoodsSearchService")
@Transactional
public class ShopAndGoodsSearchServiceImpl implements ShopAndGoodsSearchService {
	@Autowired
	private ShopAndGoodsSearchMapper shopAndGoodsSearchMapper;

	// 搜索商家
	public List<Shop> shopSearch(String string) {
		return shopAndGoodsSearchMapper.shopSearch(string);
	}

	// 根据页面显示的商家与用户输入的内容查找商品列表
	public List<GetSearchShopAndGoodsVo> searchGoodsList(GetSearchMsg getSearchMsg){
		return shopAndGoodsSearchMapper.searchGoodsList(getSearchMsg);
	}
}

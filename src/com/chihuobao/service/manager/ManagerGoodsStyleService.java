package com.chihuobao.service.manager;

import java.util.List;

import com.chihuobao.po.GoodsStyle;

public interface ManagerGoodsStyleService {

	GoodsStyle selectGoodsStyleById(Integer goodStyleId);

	List<GoodsStyle> selectGoodsStyle();

	//自增商品类型
	void saveGoodsStyle(String styleName);
}

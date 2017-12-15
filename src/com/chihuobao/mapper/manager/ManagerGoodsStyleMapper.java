package com.chihuobao.mapper.manager;

import java.util.List;

import com.chihuobao.po.GoodsStyle;

public interface ManagerGoodsStyleMapper {

	GoodsStyle selectGoodsStyleById(Integer goodStyleId);

	List<GoodsStyle> selectGoodsStyle();

	void saveGoodsStyle(String styleName);

	
}

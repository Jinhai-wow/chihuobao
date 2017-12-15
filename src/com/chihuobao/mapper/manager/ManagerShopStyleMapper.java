package com.chihuobao.mapper.manager;

import java.util.List;

import com.chihuobao.po.ShopStyle;
import com.chihuobao.vo.ShopStyleVo;

public interface ManagerShopStyleMapper {

	List<ShopStyle> selectShopStyle();

	void saveShopStyle(ShopStyle shopStyle);

	Integer selectShopStyleTotal();

	List<ShopStyleVo> selectShopStyleList(ShopStyleVo vo);

	ShopStyle selectShopStyleByid(Integer id);

	void updateShopStyle(ShopStyle shopStyle);

	void deleteShopStyleByids(ShopStyleVo vo);
	
	

}

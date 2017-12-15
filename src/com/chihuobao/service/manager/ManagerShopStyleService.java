package com.chihuobao.service.manager;

import java.util.List;

import com.chihuobao.po.ShopStyle;
import com.chihuobao.vo.ShopStyleVo;

public interface ManagerShopStyleService {

	List<com.chihuobao.po.ShopStyle> selectShopStyle();

	//新增商家类型
	void saveShopStyle(ShopStyle shopStyle);

	//查找商家总条数
	Integer selectShopStyleTotal();

	//查找商家类型列表
	List<ShopStyleVo> selectShopStyleList(ShopStyleVo vo);

	//根据id搜索类型显示到编辑页面
	ShopStyle selectShopStyleByid(Integer id);

	//更新修改过后的值
	void updateShopStyle(ShopStyle shopStyle);

	//删除商家类型
	void deleteShopStyleByids(ShopStyleVo vo);

}

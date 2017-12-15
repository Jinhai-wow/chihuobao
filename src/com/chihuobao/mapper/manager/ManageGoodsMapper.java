package com.chihuobao.mapper.manager;

import java.util.List;

import com.chihuobao.po.Goods;
import com.chihuobao.po.Shop;
import com.chihuobao.vo.GoodsAndGoodsStyleVo;
import com.chihuobao.vo.GoodsVo;

public interface ManageGoodsMapper {

	Integer selectGoodsTotal();

	List<GoodsAndGoodsStyleVo> selectGoodsList(GoodsAndGoodsStyleVo vo);

	Goods selectGoodsByid(Integer id);

	List<Shop> selectGoodsShopList();

	List<GoodsVo> selectGoodsDetailList(GoodsAndGoodsStyleVo vo);

	GoodsVo selectGoodsDetailById(Integer id);

	//有条件的查找商品总条数
	Integer selectTotalByContext(GoodsVo vo);

	//有条件的查找商品的列表
	List<GoodsVo> searchGoodsByContextPage(GoodsVo vo);

	void deleteGoodsByids(GoodsVo vo);

}

package com.chihuobao.service.manager;

import java.util.List;

import com.chihuobao.po.Goods;
import com.chihuobao.po.Shop;
import com.chihuobao.vo.GoodsAndGoodsStyleVo;
import com.chihuobao.vo.GoodsVo;

/**
 * 商品的业务服务接口
 * @author Administrator
 *
 */
public interface ManagerGoodsService {

	Integer selectGoodsTotal();

	List<GoodsAndGoodsStyleVo> selectGoodsList(GoodsAndGoodsStyleVo vo);

	Goods selectGoodsByid(Integer id);

	List<Shop> selectGoodsShopList();

	List<GoodsVo> selectGoodsDetailList(GoodsAndGoodsStyleVo vo);

	GoodsVo selectGoodsDetailById(Integer id);

	//有条件的查找有总条数
	Integer selectTotalByContext(GoodsVo vo);

	//有条件的查找商品的列表
	List<GoodsVo> searchGoodsByContextPage(GoodsVo vo);

	//根据id删除商品
	void deleteGoodsByids(GoodsVo vo);

}

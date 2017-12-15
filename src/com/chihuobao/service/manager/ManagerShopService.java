package com.chihuobao.service.manager;

import java.util.List;

import com.chihuobao.po.Shop;
import com.chihuobao.po.ShopData;
import com.chihuobao.vo.GoodsVo;
import com.chihuobao.vo.ShopDataVo;
import com.chihuobao.vo.ShopVo;

public interface ManagerShopService {

	Shop selectShopById(Integer shopId);

	Integer selectShopTotal();

	List<ShopVo> selectShopList(ShopVo vo);

	//根据条件查找商家数量
	Integer selectTotalByContext(ShopVo vo);

	//有条件的查找商家
	List<ShopVo> searchGoodsByContextPage(ShopVo vo);

	//删除
	void deleteGoodsByids(ShopVo vo);

	//根据商家id查找属于它的商品
	List<GoodsVo> selectGoodsByShopId(Integer id);

	//一对多一对多查询
	List<Shop> selectGoodsShopList(Integer id);

	//查找审核资料表待审核的条数
	Integer selectShopDataTotal(ShopDataVo shopDataVo);

	//查找审核资料表中待审核的所有记录
	List<ShopDataVo> selectShopDataList(ShopDataVo shopDataVo);

	//根据商店审核资料id获取信息回显到审核页面
	ShopData shopDataEdit(Integer id);

	//审核成功并将状态id置1
	void auditSuccess(Integer shopId);

	//审核失败并将状态值置为2
	void auditFail(Integer shopId);

	//根据资料id删除审核的资料结果
	void deleteAuditShopData(ShopDataVo vo);

	//保存审核建议
	void auditShopDataAdvise(ShopData shopData);
}

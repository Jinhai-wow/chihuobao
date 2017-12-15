package com.chihuobao.service.manager;

import java.util.List;

import com.chihuobao.po.OrderAnalyse;
import com.chihuobao.po.ShopAnalyse;

public interface ManagerDataAnalyseServie {

	//五张表联合查询当天的订单中购买最多的商品
	OrderAnalyse selectOrderAnalyseResult(String date);

	//保存分析的结果
	void saveOrderAnalyseResult(OrderAnalyse orderAnalyse);

	ShopAnalyse selectShopAnalyseResult(String date);

	void saveShopAnalyseResult(ShopAnalyse shopAnalyse);

	Integer selectBestGoodsTotal();

	List<OrderAnalyse> selectBestGoodsList(OrderAnalyse vo);

	List<OrderAnalyse> goodsChart();

	Integer selectBestShopTotal();

	List<ShopAnalyse> selectBestShopList(ShopAnalyse vo);

	List<ShopAnalyse> selectBestShop();

	//根据条件查找商品条数
	Integer selectBestGoodsTotalByTime(String payTime);

	//根据条件查找商品记录
	List<OrderAnalyse> selectBestGoodsListByTime(String payTime);

	//根据条件查找当天销售最多商品的商家数量
	Integer selectBestShopTotalByTime(String payTime);

	//根据条件查找当天销售最多的商家记录
	List<OrderAnalyse> selectBestShopListByTime(String payTime);

	//根据初始时间来获取销售最多的商品数据显示图表
	List<OrderAnalyse> goodsChartsListBydate(OrderAnalyse vo);

	//根据初始时间来获取销售最多商品的商店数据显示图表
	List<ShopAnalyse> shopChartsListBydate(ShopAnalyse vo);

}

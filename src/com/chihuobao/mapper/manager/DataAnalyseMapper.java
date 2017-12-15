package com.chihuobao.mapper.manager;


import java.util.List;

import com.chihuobao.po.OrderAnalyse;
import com.chihuobao.po.ShopAnalyse;

public interface DataAnalyseMapper {

	OrderAnalyse selectOrderAnalyseResult(String date);

	void saveOrderAnalyseResult(OrderAnalyse orderAnalyse);

	ShopAnalyse selectShopAnalyseResult(String date);

	void saveShopAnalyseResult(ShopAnalyse shopAnalyse);

	Integer selectBestGoodsTotal();

	List<OrderAnalyse> selectBestGoodsList(OrderAnalyse vo);

	List<OrderAnalyse> goodsChart();

	Integer selectBestShopTotal();

	List<ShopAnalyse> selectBestShopList(ShopAnalyse vo);

	List<ShopAnalyse> selectBestShop();

	Integer selectBestGoodsTotalByTime(String payTime);

	List<OrderAnalyse> selectBestGoodsListByTime(String payTime);

	Integer selectBestShopTotalByTime(String payTime);

	List<OrderAnalyse> selectBestShopListByTime(String payTime);

	//根据初始时间来获取数据显示图表
	List<OrderAnalyse> goodsChartsListBydate(OrderAnalyse vo);

	//根据初始时间来获取销售最多商品的商店数据显示图表
	List<ShopAnalyse> shopChartsListBydate(ShopAnalyse vo);

	

}

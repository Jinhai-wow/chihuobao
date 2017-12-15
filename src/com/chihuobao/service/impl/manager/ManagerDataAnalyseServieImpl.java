package com.chihuobao.service.impl.manager;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.manager.DataAnalyseMapper;
import com.chihuobao.po.OrderAnalyse;
import com.chihuobao.po.ShopAnalyse;
import com.chihuobao.service.manager.ManagerDataAnalyseServie;

@Service
@Transactional
public class ManagerDataAnalyseServieImpl implements ManagerDataAnalyseServie {

	@Autowired
	private DataAnalyseMapper dAnalyseMapper;
	
	@Override
	public OrderAnalyse selectOrderAnalyseResult(String date) {
		
		return dAnalyseMapper.selectOrderAnalyseResult(date);
	}

	@Override
	public void saveOrderAnalyseResult(OrderAnalyse orderAnalyse) {
		
		dAnalyseMapper.saveOrderAnalyseResult(orderAnalyse);
	}

	@Override
	public ShopAnalyse selectShopAnalyseResult(String date) {
		
		return dAnalyseMapper.selectShopAnalyseResult(date);
	}

	@Override
	public void saveShopAnalyseResult(ShopAnalyse shopAnalyse) {
		
		dAnalyseMapper.saveShopAnalyseResult(shopAnalyse);
	}

	@Override
	public Integer selectBestGoodsTotal() {
		
		return dAnalyseMapper.selectBestGoodsTotal();
	}

	@Override
	public List<OrderAnalyse> selectBestGoodsList(OrderAnalyse vo) {
		
		return dAnalyseMapper.selectBestGoodsList(vo);
	}

	@Override
	public List<OrderAnalyse> goodsChart() {
		
		return dAnalyseMapper.goodsChart();
	}

	@Override
	public Integer selectBestShopTotal() {
		
		return dAnalyseMapper.selectBestShopTotal();
	}

	@Override
	public List<ShopAnalyse> selectBestShopList(ShopAnalyse vo) {
		
		return dAnalyseMapper.selectBestShopList(vo);
	}

	@Override
	public List<ShopAnalyse> selectBestShop() {
		
		return dAnalyseMapper.selectBestShop();
	}

	//根据条件查找商品条数
	@Override
	public Integer selectBestGoodsTotalByTime(String payTime) {
		
		return dAnalyseMapper.selectBestGoodsTotalByTime(payTime);
	}

	//根据条件查找商品记录
	@Override
	public List<OrderAnalyse> selectBestGoodsListByTime(String payTime) {
		
		return dAnalyseMapper.selectBestGoodsListByTime(payTime);
	}

	//根据条件查找商家条数
	@Override
	public Integer selectBestShopTotalByTime(String payTime) {
		
		return dAnalyseMapper.selectBestShopTotalByTime(payTime);
	}

	////根据条件查找商家记录
	@Override
	public List<OrderAnalyse> selectBestShopListByTime(String payTime) {
		
		return dAnalyseMapper.selectBestShopListByTime(payTime);
	}

	//根据初始时间来获取销售最多的商品数据显示图表
	@Override
	public List<OrderAnalyse> goodsChartsListBydate(OrderAnalyse vo) {
		
		return dAnalyseMapper.goodsChartsListBydate(vo);
	}

	//根据初始时间来获取销售最多商品的商店数据显示图表
	@Override
	public List<ShopAnalyse> shopChartsListBydate(ShopAnalyse vo) {
		
		return dAnalyseMapper.shopChartsListBydate(vo);
	}
}

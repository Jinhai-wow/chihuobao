package com.chihuobao.service.impl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.manager.ManageGoodsMapper;
import com.chihuobao.po.Goods;
import com.chihuobao.po.Shop;
import com.chihuobao.service.manager.ManagerGoodsService;
import com.chihuobao.vo.GoodsAndGoodsStyleVo;
import com.chihuobao.vo.GoodsVo;

/**
 * 商品的业务服务实现类
 * 谢韦烈 2017-12-1
 * @author Administrator
 *
 */
@Service
@Transactional
public class ManagerGoodsServiceImpl implements ManagerGoodsService {

	@Autowired
	private ManageGoodsMapper mGoodsMapper;
	
	@Override
	public Integer selectGoodsTotal() {
		
		return mGoodsMapper.selectGoodsTotal();
	}

	@Override
	public List<GoodsAndGoodsStyleVo> selectGoodsList(GoodsAndGoodsStyleVo vo) {
		
		return mGoodsMapper.selectGoodsList(vo);
	}

	@Override
	public Goods selectGoodsByid(Integer id) {
		
		return mGoodsMapper.selectGoodsByid(id);
	}

	@Override
	public List<Shop> selectGoodsShopList() {
		return mGoodsMapper.selectGoodsShopList();
	}

	@Override
	public List<GoodsVo> selectGoodsDetailList(GoodsAndGoodsStyleVo vo) {
		return mGoodsMapper.selectGoodsDetailList(vo);
	}

	@Override
	public GoodsVo selectGoodsDetailById(Integer id) {
		
		return mGoodsMapper.selectGoodsDetailById(id);
	}

	//有条件的查找商品总条数
	@Override
	public Integer selectTotalByContext(GoodsVo vo) {
		return mGoodsMapper.selectTotalByContext(vo);
	}

	//有条件的查找商品的列表
	@Override
	public List<GoodsVo> searchGoodsByContextPage(GoodsVo vo) {
		return mGoodsMapper.searchGoodsByContextPage(vo);
	}

	//根据id删除商品
	@Override
	public void deleteGoodsByids(GoodsVo vo) {
		mGoodsMapper.deleteGoodsByids(vo);
	}

}

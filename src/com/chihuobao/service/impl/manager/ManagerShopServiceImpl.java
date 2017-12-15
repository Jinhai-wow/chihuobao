package com.chihuobao.service.impl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.manager.ManagerShopMapper;
import com.chihuobao.po.Shop;
import com.chihuobao.po.ShopData;
import com.chihuobao.service.manager.ManagerShopService;
import com.chihuobao.vo.GoodsVo;
import com.chihuobao.vo.ShopDataVo;
import com.chihuobao.vo.ShopVo;

/**
 * 
 * @author 谢韦烈
 *
 */
@Service
@Transactional
public class ManagerShopServiceImpl implements ManagerShopService {

	
	@Autowired
	private ManagerShopMapper managerShopMapper;
	
	@Override
	public Shop selectShopById(Integer shopId) {
		
		return managerShopMapper.selectShopById(shopId);
	}

	@Override
	public Integer selectShopTotal() {
		
		return managerShopMapper.selectShopTotal();
	}

	@Override
	public List<ShopVo> selectShopList(ShopVo vo) {
		
		return managerShopMapper.selectShopList(vo);
	}

	//根据条件查询所有的商家数量
	@Override
	public Integer selectTotalByContext(ShopVo vo) {
		
		return managerShopMapper.selectTotalByContext(vo);
	}

	//有条件的查找商家
	@Override
	public List<ShopVo> searchGoodsByContextPage(ShopVo vo) {
	
		return managerShopMapper.searchGoodsByContextPage(vo);
	}

	@Override
	public void deleteGoodsByids(ShopVo vo) {
	
		managerShopMapper.deleteGoodsByids(vo);
	}

	//根据商家id查找属于它的商品
	@Override
	public List<GoodsVo> selectGoodsByShopId(Integer id) {
		
		return managerShopMapper.selectGoodsByShopId(id);
	}

	//一对多一对多查询
	@Override
	public List<Shop> selectGoodsShopList(Integer id) {
		return managerShopMapper.selectGoodsShopList(id);
	}

	//查找审核资料表待审核的条数
	@Override
	public Integer selectShopDataTotal(ShopDataVo shopDataVo) {
		
		return managerShopMapper.selectShopDataTotal(shopDataVo);
	}

	//查找审核资料表中待审核的所有记录
	@Override
	public List<ShopDataVo> selectShopDataList(ShopDataVo shopDataVo) {
		
		return managerShopMapper.selectShopDataList(shopDataVo);
	}

	//根据商店审核资料id获取信息回显到审核页面
	@Override
	public ShopData shopDataEdit(Integer id) {
		
		return managerShopMapper.shopDataEdit(id);
	}

	//审核成功并将状态id置1
	@Override
	public void auditSuccess(Integer shopId) {
		
		managerShopMapper.auditSuccess(shopId); 
	}

	//审核失败并将状态值置为2
	@Override
	public void auditFail(Integer shopId) {
		
		managerShopMapper.auditFail(shopId);
	}

	//根据资料id删除审核的资料结果
	@Override
	public void deleteAuditShopData(ShopDataVo vo) {
		
		managerShopMapper.deleteAuditShopData();
	}

	//保存审核建议
	@Override
	public void auditShopDataAdvise(ShopData shopData) {
		
		managerShopMapper.auditShopDataAdvise(shopData);
	}

	
	

}

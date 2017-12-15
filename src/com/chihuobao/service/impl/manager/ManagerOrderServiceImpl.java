package com.chihuobao.service.impl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.manager.ManagerOrderMapper;
import com.chihuobao.po.ManagerOrderGoods;
import com.chihuobao.service.manager.ManagerOrderService;
import com.chihuobao.vo.ManagerOrderVo;


@Service
@Transactional
public class ManagerOrderServiceImpl implements ManagerOrderService {

	@Autowired
	private ManagerOrderMapper managerOrderMapper;
	
	@Override
	public Integer selectOrderTotal() {
		
		return managerOrderMapper.selectOrderTotal();
	}

	//查找所有的订单
	@Override
	public List<ManagerOrderVo> selectOrderList(ManagerOrderVo vo) {
		
		return managerOrderMapper.selectOrderList(vo);
	}

	//查找所有的订单类型
	@Override
	public List<ManagerOrderVo> selectOrderState() {
		
		return managerOrderMapper.selectOrderState();
	}

	// 按条件查找订单总条数
	@Override
	public Integer selectTotalByContext(ManagerOrderVo vo) {
		
		return managerOrderMapper.selectTotalByContext(vo);
	}

	//按条件查找订单
	@Override
	public List<ManagerOrderVo> searchOrderByContextPage(ManagerOrderVo vo) {
		
		return managerOrderMapper.searchOrderByContextPage(vo);
	}

	//删除所选的订单
	@Override
	public void deleteOrderByids(ManagerOrderVo vo) {
		managerOrderMapper.deleteOrderByids(vo);
	}

	//查找当前订单的所有商品
	@Override
	public List<ManagerOrderGoods> selectOrderGoodsByOrderId(Long id) {
		
		return managerOrderMapper.selectOrderGoodsByOrderId(id);
	}

}

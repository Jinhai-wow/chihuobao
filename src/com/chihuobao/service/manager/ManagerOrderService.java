package com.chihuobao.service.manager;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.po.ManagerOrderGoods;
import com.chihuobao.vo.ManagerOrderVo;
import com.chihuobao.vo.ShopVo;

@Service
@Transactional
public interface ManagerOrderService {

	Integer selectOrderTotal();

	List<ManagerOrderVo> selectOrderList(ManagerOrderVo vo);

	List<ManagerOrderVo> selectOrderState();

	// 按条件查找订单总条数
	Integer selectTotalByContext(ManagerOrderVo vo);

	//按条件查找订单
	List<ManagerOrderVo> searchOrderByContextPage(ManagerOrderVo vo);

	//删除对应的订单
	void deleteOrderByids(ManagerOrderVo vo);

	//查看当前订单的所有商品
	List<ManagerOrderGoods> selectOrderGoodsByOrderId(Integer id);

}

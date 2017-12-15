package com.chihuobao.mapper.manager;

import java.util.List;

import com.chihuobao.po.ManagerOrderGoods;
import com.chihuobao.vo.ManagerOrderVo;


public interface ManagerOrderMapper {

	Integer selectOrderTotal();

	List<ManagerOrderVo> selectOrderList(ManagerOrderVo vo);

	List<ManagerOrderVo> selectOrderState();

	Integer selectTotalByContext(ManagerOrderVo vo);

	List<ManagerOrderVo> searchOrderByContextPage(ManagerOrderVo vo);

	void deleteOrderByids(ManagerOrderVo vo);

	List<ManagerOrderGoods> selectOrderGoodsByOrderId(Long id);

}

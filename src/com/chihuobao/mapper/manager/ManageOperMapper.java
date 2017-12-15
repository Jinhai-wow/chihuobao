package com.chihuobao.mapper.manager;

import java.util.List;

import com.chihuobao.po.ManagerOpera;
import com.chihuobao.vo.ManagerOperaVo;

/**
 * 管理员操作的Mapper方法
 * 谢韦烈 2017-11-28
 *
 */
public interface ManageOperMapper {

	void saveManageOper(ManagerOpera mOpera);

	Integer getTotal();

	List<ManagerOpera> selectOperAll(ManagerOperaVo vo);

	void deleteOperasByids(ManagerOperaVo vo);

	Integer selectByOperaTotal(ManagerOpera opera);

	List<ManagerOpera> searchByOperaPage(ManagerOperaVo vo);

}

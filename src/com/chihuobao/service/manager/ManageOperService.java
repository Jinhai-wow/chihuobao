package com.chihuobao.service.manager;

import java.util.List;

import com.chihuobao.po.ManagerOpera;
import com.chihuobao.vo.ManagerOperaVo;

/**
 * 保存管理员操作的service方法
 * 谢韦烈 2017-11-28
 *
 */
public interface ManageOperService {

	
	void saveManageOper(ManagerOpera mOpera);

	Integer getOperTotal();

	List<ManagerOpera> selectOperAll(ManagerOperaVo vo);

	void deleteOperasByids(ManagerOperaVo vo);

	Integer selectByOperaTotal(ManagerOpera opera);

	List<ManagerOpera> searchByOperaPage(ManagerOperaVo vo);

}

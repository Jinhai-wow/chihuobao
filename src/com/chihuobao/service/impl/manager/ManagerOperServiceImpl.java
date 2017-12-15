package com.chihuobao.service.impl.manager;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.manager.ManageOperMapper;
import com.chihuobao.po.ManagerOpera;
import com.chihuobao.service.manager.ManageOperService;
import com.chihuobao.vo.ManagerOperaVo;

/**
 * 保存管理员操作的service实现方法
 * 谢韦烈 2017-11-28
 */
@Service
@Transactional
public class ManagerOperServiceImpl implements ManageOperService {

	@Autowired
	private ManageOperMapper mOperMapper;
	
	Date date = new Date();
	
	//保存管理员操作
	@Override
	public void saveManageOper(ManagerOpera mOpera) {
		
		mOpera.setOperaDate(date);
		mOpera.setOperaRole(1);
		mOperMapper.saveManageOper(mOpera);
	}

	@Override
	public Integer getOperTotal() {
		
		return mOperMapper.getTotal();
	}

	@Override
	public List<ManagerOpera> selectOperAll(ManagerOperaVo vo) {
		
		return mOperMapper.selectOperAll(vo);
	}

	//删除操作记录
	@Override
	public void deleteOperasByids(ManagerOperaVo vo) {
		
		mOperMapper.deleteOperasByids(vo);
	}

	@Override
	public Integer selectByOperaTotal(ManagerOpera opera) {
		
		return mOperMapper.selectByOperaTotal(opera);
	}

	@Override
	public List<ManagerOpera> searchByOperaPage(ManagerOperaVo vo) {
		
		return mOperMapper.searchByOperaPage(vo);
	}

}

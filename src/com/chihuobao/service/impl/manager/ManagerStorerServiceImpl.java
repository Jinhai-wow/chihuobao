package com.chihuobao.service.impl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.manager.ManagerStorerMapper;
import com.chihuobao.po.StorerAccount;
import com.chihuobao.service.manager.ManagerStorerService;
import com.chihuobao.vo.StorerAccountVo;

@Service
@Transactional
public class ManagerStorerServiceImpl implements ManagerStorerService {

	/**
	 * 
	 */
	@Autowired
	private ManagerStorerMapper managerStorerMapper;
	
	//根据页数和条数查找商家
	@Override
	public List<StorerAccount> queryStorerAll(StorerAccountVo vo) {
		
		return managerStorerMapper.queryStorerByPage(vo);
	}


	@Override
	public void deleteStorersByids(StorerAccountVo vo) {
	
		managerStorerMapper.deleteStorerByids(vo);
	}

	@Override
	public StorerAccount selectStorerByid(Integer id) {
		
		return managerStorerMapper.selectStorerByid(id);
	}

	@Override
	public void updateStorer(StorerAccount storerAccount) {
		
		managerStorerMapper.updateStorer(storerAccount);
	}

	@Override
	public void freezeStorerById(Integer id) {
		
		managerStorerMapper.freezeStorerById(id);
	}

	@Override
	public void releaseStorerById(Integer id) {
		
		managerStorerMapper.releaseStorerById(id);
	}

	//根据搜索的内容查询
	@Override
	public List<StorerAccount> searchByContextAll(Integer accountState) {
		
		return managerStorerMapper.searchByContextAll(accountState);
	}

	//查看总记录数
	@Override
	public Integer queryTotal() {
		
		return managerStorerMapper.queryTotal();
	}


	//有条件的查找商家总数
	@Override
	public Integer queryByContextTotal(StorerAccount storer) {
		
		return managerStorerMapper.queryByContextTatal(storer);
	}

	//有条件的查找商家
	@Override
	public List<StorerAccount> searchByContextPage(StorerAccountVo vo) {
		
		return managerStorerMapper.searchByContextPage(vo);
	}


	//查看商家的详情
	@Override
	public StorerAccountVo selectStorerDetailByid(Integer id) {
		
		return managerStorerMapper.selectStorerDetailByid(id);
	}


	@Override
	public List<StorerAccount> SelectStorerList() {
		
		return managerStorerMapper.SelectStorerList();
	}

	
	
	

}

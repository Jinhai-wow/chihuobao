package com.chihuobao.service.manager;

import java.util.List;

import com.chihuobao.po.StorerAccount;
import com.chihuobao.vo.StorerAccountVo;

public interface ManagerStorerService {
	
	
	
	//根据页数和条数查询商家
	List<StorerAccount> queryStorerAll(StorerAccountVo vo);

	void deleteStorersByids(StorerAccountVo vo);


	StorerAccount selectStorerByid(Integer id);

	void updateStorer(StorerAccount storerAccount);

	void freezeStorerById(Integer id);

	void releaseStorerById(Integer id);
	
	//根据搜索的内容查询
	List<StorerAccount> searchByContextAll(Integer accountState);

	//查看总记录数
	Integer queryTotal();
	
	//有条件的查找商家数量
	Integer queryByContextTotal(StorerAccount storer);
	
	//有条件的查找商家
	List<StorerAccount> searchByContextPage(StorerAccountVo vo);

	//查看商家详情
	StorerAccountVo selectStorerDetailByid(Integer id);

	List<StorerAccount> SelectStorerList();
}

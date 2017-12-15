package com.chihuobao.mapper.manager;

import java.util.List;

import com.chihuobao.po.StorerAccount;
import com.chihuobao.vo.StorerAccountVo;

/**
 * 
 * @author Administrator
 *
 */

public interface ManagerStorerMapper {

	//搜寻全部商家用户
	List<StorerAccount> queryStorerByPage(StorerAccountVo vo);

	//根据商家id删除商家
	void deleteStorerByids(StorerAccountVo vo);

	
	StorerAccount selectStorerByid(Integer id);

	void updateStorer(StorerAccount storerAccount);

	void freezeStorerById(Integer id);

	void releaseStorerById(Integer id);

	//根据搜索的内容查询
	List<StorerAccount> searchByContextAll(Integer accountState);

	//查看总记录数
	Integer queryTotal();
	
	//有条件的查找商家总记录数
	Integer queryByContextTatal(StorerAccount storer);

	//有条件的查找商家
	List<StorerAccount> searchByContextPage(StorerAccountVo vo);

	//查看商家详情
	StorerAccountVo selectStorerDetailByid(Integer id);

	List<StorerAccount> SelectStorerList();

	

	
}

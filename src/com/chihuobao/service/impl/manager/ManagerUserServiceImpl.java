package com.chihuobao.service.impl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.manager.ManagerUserMapper;
import com.chihuobao.po.Address;
import com.chihuobao.po.User;
import com.chihuobao.service.manager.ManagerUserService;
import com.chihuobao.vo.UserVo;

@Service
@Transactional
public class ManagerUserServiceImpl implements ManagerUserService {

	@Autowired
	private ManagerUserMapper mUserMapper;
	
	@Override
	public Integer SelectUserTotal() {
		
		return mUserMapper.SelectUserTotal();
	}

	@Override
	public List<User> selectUserList(UserVo vo) {
		
		return mUserMapper.selectUserList(vo);
	}

	@Override
	public User selectUserByid(Integer id) {
		
		return mUserMapper.selectUserByid(id);
	}

	@Override
	public void updateUser(User user) {
	
		mUserMapper.updateUser(user);
	}

	@Override
	public void freezeUserById(Integer id) {
		
		mUserMapper.freezeUserById(id);
	}

	@Override
	public void releaseUserById(Integer id) {
		
		mUserMapper.releaseUserById(id);
	}

	@Override
	public void deleteStorersByids(UserVo vo) {
		
		mUserMapper.deleteStorersByids(vo);
	}

	@Override
	public Integer selectTotalByContext(UserVo vo) {
		
		return mUserMapper.selectTotalByContext(vo);
	}

	@Override
	public List<User> searchByContextPage(UserVo vo) {
		
		return mUserMapper.searchByContextPage(vo);
	}

	@Override
	public List<Address> selectUserAddressDetailByUserId(Integer id) {
		
		return mUserMapper.selectUserAddressDetailByUserId(id);
	}

	
}

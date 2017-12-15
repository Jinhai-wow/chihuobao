package com.chihuobao.mapper.manager;

import java.util.List;

import com.chihuobao.po.Address;
import com.chihuobao.po.User;
import com.chihuobao.vo.UserVo;

public interface ManagerUserMapper {

	Integer SelectUserTotal();

	List<User> selectUserList(UserVo vo);

	User selectUserByid(Integer id);

	void updateUser(User user);

	void freezeUserById(Integer id);

	void releaseUserById(Integer id);

	void deleteStorersByids(UserVo vo);

	Integer selectTotalByContext(UserVo vo);

	List<User> searchByContextPage(UserVo vo);

	List<Address> selectUserAddressDetailByUserId(Integer id);

}

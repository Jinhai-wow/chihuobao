package com.chihuobao.mapper.user;

import java.util.List;

import com.chihuobao.po.Address;
import com.chihuobao.po.User;
import com.chihuobao.vo.StorerAccountEx;
import com.chihuobao.vo.UserVo;

/**
 * 用户的mapper类
 * @author 陈志杰
 *
 */

public interface UserMapper {

	//用户使用密码登陆
	public UserVo findUserByPassword(UserVo userVo) throws Exception;
	
	//用户短信注册
	public void messageRegister(UserVo userVo) throws Exception;
	
	//用户短信登陆
	public UserVo findUserByPhone(UserVo userVo) throws Exception;
	
	//登陆成功时，登陆状态栏写1
	public void setuserstatus(Integer id) throws Exception;
	
	//个人中心-个人资料，根据id查询用户信息
	public UserVo findUserById(Integer id) throws Exception;
	
	//修改用户名
	public void updateUsername(User user) throws Exception;
	
	//修改密码
	public void modifyPassword(User user) throws Exception;
	
	//保存上传的图片
	public void headPortrait(User user) throws Exception;
	
	//查找用户地址
	public List<Address> findUserAddress(Integer id) throws Exception;
	
	//商家密码登陆
	public StorerAccountEx findstoreraccountByPassword(StorerAccountEx storerAccountVo) throws Exception;
	
	//商家短信注册
	public void storeraccountmessageRegister(StorerAccountEx storerAccountVo) throws Exception;
	
	//商家短信登陆
	public StorerAccountEx findstoreraccountByPhone(StorerAccountEx storerAccountVo)throws Exception;
}

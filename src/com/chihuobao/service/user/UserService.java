package com.chihuobao.service.user;


import java.util.List;

import com.chihuobao.po.Address;
import com.chihuobao.po.Manager;
import com.chihuobao.po.User;
import com.chihuobao.vo.StorerAccountEx;
import com.chihuobao.vo.UserVo;

/**
 * 用户service接口类
 * @author 陈志杰
 *
 */
public interface UserService {

	//通过密码登陆
	public UserVo findUserByPassword(UserVo userVo) throws Exception;
	
	//用户获取登陆注册的手机验证码
	public void createCaptcha(String phone) throws Exception;
	
	//通过短信登陆或注册
	public UserVo loginRegisterByMessage(UserVo userVo) throws Exception;
	
	//个人中心-个人资料，根据id查询用户信息
	public UserVo findUserById(Integer id) throws Exception;
	
	//修改用户名
	public String updateUsername(User user) throws Exception;
	
	//修改密码
	public void modifyPassword(User user) throws Exception;
	
	//保存头像图片名
	public void headPortrait(User user) throws Exception;
	
	//查找用户地址
	public List<Address> findUserAddress(Integer id) throws Exception;
	
	//商家密码登陆
	public StorerAccountEx findstoreraccountByPassword(StorerAccountEx storerAccountVo) throws Exception;
		
	//商家通过短信登陆或注册
	public StorerAccountEx storerAccountloginRegisterByMessage(StorerAccountEx storerAccountVo) throws Exception;
	
	//添加地址
	public void addAddress(Address address) throws Exception;
	
	//删除地址
	public void deleteAddress(Integer id) throws Exception;
	
	//修改地址
	public void updateAddress(Address address) throws Exception;
	
	//管理员登陆
	public Manager findManagerByName(Manager managerVo) throws Exception;
	
}

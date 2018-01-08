package com.chihuobao.service.impl.user;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.exception.CustomException;
import com.chihuobao.mapper.user.UserMapper;
import com.chihuobao.po.Address;
import com.chihuobao.po.Manager;
import com.chihuobao.po.User;
import com.chihuobao.service.user.UserService;
import com.chihuobao.util.MessageVerification;
import com.chihuobao.vo.StorerAccountEx;
import com.chihuobao.vo.UserVo;


/**
 * 用户接口实现类
 * @author 陈志杰
 *
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	private String captcha;
	
	//用户通过密码登陆
	public UserVo findUserByPassword(UserVo userVo) throws Exception {
		UserVo user=userMapper.findUserByPassword(userVo);
		if(user==null){
			throw new CustomException("用户名或密码错误！");
		}
		//登陆成功时，写登陆状态为1
		userMapper.setuserstatus(user.getUser().getId());
		user.getUser().setUserstatus(1);
		return user;
	}
	
	//生成并发送6位的手机登陆注册验证码
	public void createCaptcha(String phone) throws Exception{
		//随机生成6位验证码
		if(phone==null){
			throw new CustomException("输入的手机号码为空！"); 
		}
		Integer icaptcha=(int)((Math.random()*9+1)*100000);
		String captcha=icaptcha.toString();
		this.captcha=captcha;
		MessageVerification.sendSms(phone, captcha);
	}

	//用户通过短信登陆或注册
	public UserVo loginRegisterByMessage(UserVo userVo) throws Exception {
		
		//输入的验证码为空
		if(userVo.getCaptcha()==null){
			throw new CustomException("输入的验证码不能为空！");
		}
		//验证输入的验证码
		if(userVo.getCaptcha().equals(this.captcha)!=true){
			throw new CustomException("输入的验证码错误");
		}
		
		//查找数据库，如果用户已注册就直接返回user对象并登陆状态写1
		UserVo user=userMapper.findUserByPhone(userVo);
		if(user==null){           //用户未注册，进行用户注册
			//随机生成11位用户名
			char[] cha ={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
			StringBuilder busername=new StringBuilder();
			for(int i=0;i<11;i++){
				busername.append(cha[(int)(Math.random()*16)]);
			}
			String username=busername.toString();
			//生成注册时间
			Date registertime=new Date();
				
			userVo.getUser().setUsername(username);
			userVo.getUser().setRegistertime(registertime);
			userMapper.messageRegister(userVo);
			userVo.getUser().setUserstatus(1);
			return userVo;
		}
		userMapper.setuserstatus(user.getUser().getId());
		return user;
	}

	//个人中心-个人资料，根据id查询用户信息
	public UserVo findUserById(Integer id) throws Exception {
		UserVo user=userMapper.findUserById(id);
		if(user==null){
			throw new CustomException("用户数据出现异常！");
		}
		return user;
	}

	//修改用户名
	public String updateUsername(User user) throws Exception {
		if(user.getUsername()==null){
			throw new CustomException("未输入要修改的用户名！");
		}
		userMapper.updateUsername(user);
		return user.getUsername();
	}

	//修改密码
	public void modifyPassword(User user) throws Exception {
		if(user.getPassword()==null){
			throw new  CustomException("修改密码失败！");
		}
		userMapper.modifyPassword(user);
	}

	//保存上传的头像名
	public void headPortrait(User user) throws Exception {
		userMapper.headPortrait(user);
	}

	//查找出所有该用户添加的地址
	public List<Address> findUserAddress(Integer id) throws Exception {
		if(id==null){
			throw new CustomException("地址加载失败！");
		}
		List<Address> addressList=userMapper.findUserAddress(id);
		
		return addressList;
	}

	//商家密码登陆
	public StorerAccountEx findstoreraccountByPassword(StorerAccountEx storerAccountVo)
			throws Exception {
		StorerAccountEx storerAccount=userMapper.findstoreraccountByPassword(storerAccountVo);
		if(storerAccount==null){
			throw new CustomException("用户名或密码错误！");
		}
		return storerAccount;
	}

	//商家通过短信登陆或注册
	public StorerAccountEx storerAccountloginRegisterByMessage(StorerAccountEx storerAccountVo)
			throws Exception{

		//输入的验证码为空
		if(storerAccountVo.getCaptcha()==null){
			throw new CustomException("输入的验证码不能为空！");
		}
		//验证输入的验证码
		if(storerAccountVo.getCaptcha().equals(this.captcha)!=true){
			throw new CustomException("输入的验证码错误");
		}
		
		//查找数据库，如果用户已注册就直接返回user对象并登陆状态写1
		StorerAccountEx storerAccount=userMapper.findstoreraccountByPhone(storerAccountVo);
		if(storerAccount==null){           //用户未注册，进行用户注册
			//随机生成11位用户名
			char[] cha ={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'};
			StringBuilder busername=new StringBuilder();
			for(int i=0;i<11;i++){
				busername.append(cha[(int)(Math.random()*16)]);
			}
			String username=busername.toString();
			//生成注册时间
			Date registertime=new Date();
				
			storerAccountVo.setStorerName(username);
			storerAccountVo.setStorerRegistTime(registertime);
			userMapper.storeraccountmessageRegister(storerAccountVo);
			return storerAccountVo;
		}
		return storerAccount;
	}

	//添加地址
	public void addAddress(Address address) throws Exception {
		if(address.getAddress()==null){
			throw new CustomException("输入的地址值为空！");
		}
		if(address.getUserid()==null){
			throw new CustomException("用户未登陆！");
		}
		userMapper.emptyAddressState(address);
		userMapper.addAddress(address);	
	}

	//删除地址
	public void deleteAddress(Integer id) throws Exception {
		if(id==null){
			throw new CustomException("删除地址异常！");
		}
		userMapper.deleteAddress(id);
	}

	//修改地址
	public void updateAddress(Address address) throws Exception {
		if(address==null){
			throw new CustomException("修改地址异常！");
		}
		userMapper.updateAddress(address);
	}

	//管理员登陆
	public Manager findManagerByName(Manager managerVo) throws Exception {
		if(managerVo==null||managerVo.getUsername()==null||managerVo.getUsername()==""
				||managerVo.getPassword()==null||managerVo.getPassword()==""){
			throw new CustomException("输入的用户名或密码有问题，管理员登陆失败！");
		}
		Manager manager=userMapper.findManagerByName(managerVo);
		return manager;
	}
}

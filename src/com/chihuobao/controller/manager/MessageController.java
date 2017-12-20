package com.chihuobao.controller.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.StorerAccount;
import com.chihuobao.po.StorerMessage;
import com.chihuobao.po.User;
import com.chihuobao.po.UserMessage;
import com.chihuobao.service.manager.ManagerMessageService;
import com.chihuobao.service.manager.ManagerUserService;
import com.chihuobao.vo.MessageObject;

/**
 * 消息管理控制controller类
 * @author 谢韦烈
 * 2017-12-17
 */
@Controller
public class MessageController {

	@Autowired
	private ManagerMessageService mMessageService; //消息管理的服务接口
	
	
	UserMessage userMessage = new UserMessage(); //消息管理实体类
	
	StorerMessage storerMessage = new StorerMessage(); //商家消息实体类
	
	//用户根据该id查找属于它的消息
	@RequestMapping(value="/selectMessageByUserId.action")
	public @ResponseBody List<UserMessage> selectMessageByUserId(Integer userId){
		
		 List<UserMessage> userMessageList = mMessageService.selectMessageByUserId(userId);
		 return userMessageList;
	}
	
	//商家根据该id查找属于它的消息
	@RequestMapping(value="/selectMessageByStorerId.action")
	public @ResponseBody List<StorerMessage> selectMessageByStorerId(Integer storerId){
		
		List<StorerMessage> storerMessageList = mMessageService.selectMessageByStorerId(storerId);
		return storerMessageList;
	}
	
	//用户根据消息id删除消息
	@RequestMapping(value="/deleteUserMessageById.action")
	public @ResponseBody Integer deleteUserMessageById(Integer id){
		
		mMessageService.deleteUserMessageById(id);
		return 1;
	}
	
	//商家根据消息id删除消息
	@RequestMapping(value="/deleteStorerMessageById.action")
	public @ResponseBody Integer deleteStorerMessageById(Integer id){
		
		mMessageService.deleteStorerMessageById(id);
		return 1;
	}
	
	//根据下拉框选择用户还是商家
	@RequestMapping(value="/selectUserOrStorer.action")
	public @ResponseBody List<MessageObject> selectUserOrStorer(Integer typeid){
		
		List<MessageObject> messageObjList = new ArrayList<MessageObject>();
		if(typeid == 1){
			
			messageObjList = mMessageService.selecUser();
			 
			System.out.println(typeid);
		}else{
			
			messageObjList = mMessageService.selectStorer();
		}
		
		return messageObjList;
	}
	
	//查找所有的用户
	public List<User> selectUserAll(){
		
		List<User> userList = mMessageService.selectUserAll();
		return userList;
	}
	
	//查找所有的用户
	public List<StorerAccount> selectStorerAll(){
			
		List<StorerAccount> storerList = mMessageService.selectStorerAll();
		return storerList;
	}
		
		
	//根据下拉框选择的条件选择发给谁
	@RequestMapping(value="/sendMessageToObject.action")
	public void sendMessageToObject(Integer style,Integer obj,String text){
		
		if(style == 1 ){
			if(obj != null){
			//给用户发送消息存入用户消息表
			userMessage.setMessage(text);
			userMessage.setUserId(obj);
			mMessageService.saveUestMessage(userMessage);
			
			}else{
				
				List<User> userList = this.selectUserAll();
				for(User user : userList){
					userMessage.setMessage(text);
					userMessage.setUserId(user.getId());
					mMessageService.saveUestMessage(userMessage);
				}
			
			}
			
		}else{
			if(obj != null){
				//将更改商家信息存入用户消息表
				storerMessage.setMessage(text);
				storerMessage.setStorerId(obj);
				mMessageService.saveStorerMessage(storerMessage);
			}else{
				
				List<StorerAccount> storerList = this.selectStorerAll();
				for(StorerAccount storer : storerList){
					storerMessage.setMessage(text);
					storerMessage.setStorerId(storer.getId());
					mMessageService.saveStorerMessage(storerMessage);
				}
			}	
		}
		
		System.out.println(style+"-"+obj+"-"+text);
	}
	
	
}

package com.chihuobao.service.manager;

import java.util.List;

import com.chihuobao.po.StorerAccount;
import com.chihuobao.po.StorerMessage;
import com.chihuobao.po.User;
import com.chihuobao.po.UserMessage;
import com.chihuobao.vo.MessageObject;

/**
 * 消息管理服务接口类
 * @author 谢韦烈
 *	2017-12-17
 */
public interface ManagerMessageService {

	//给用户发送消息保存大数据库中
	void saveUestMessage(UserMessage userMessage);

	//给商家发送消息保存大数据库中
	void saveStorerMessage(StorerMessage storerMessage);

	//根据用户id查找属于它的消息列大小
	List<UserMessage> selectMessageSizeByUserId(Integer userId);
	
	//根据用户id查找属于它的消息列
	List<UserMessage> selectMessageByUserId(Integer userId);

	//商家根据该id查找属于它的消息
	List<StorerMessage> selectMessageByStorerId(Integer storerId);

	//用户根据消息id删除消息
	void deleteUserMessageById(Integer id);

	//商家根据消息id删除消息
	void deleteStorerMessageById(Integer id);

	//根据下拉框选择用户
	List<MessageObject> selecUser();
	
	//还是商家
	List<MessageObject> selectStorer();

	//查找所有的用户
	List<User> selectUserAll();

	//查找所有的商家
	List<StorerAccount> selectStorerAll();
	
}

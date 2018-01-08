package com.chihuobao.mapper.manager;

import java.util.List;

import com.chihuobao.po.StorerAccount;
import com.chihuobao.po.StorerMessage;
import com.chihuobao.po.User;
import com.chihuobao.po.UserMessage;
import com.chihuobao.vo.MessageObject;

public interface ManagerMessageMapper {

	void saveUestMessage(UserMessage userMessage);

	void saveStorerMessage(StorerMessage storerMessage);

	List<UserMessage> selectMessageByUserId(Integer userId);

	List<StorerMessage> selectMessageByStorerId(Integer storerId);

	void deleteUserMessageById(Integer id);

	void deleteStorerMessageById(Integer id);

	List<MessageObject> selectUser();

	List<MessageObject> selectStorer();

	List<User> selectUserAll();

	List<StorerAccount> selectStorerAll();
	
	//用户查找出信息后置style为1，已读 
	public void updateMessageTypeByUserId(Integer userId) throws Exception;

}

package com.chihuobao.service.impl.manager;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.manager.ManagerMessageMapper;
import com.chihuobao.po.StorerAccount;
import com.chihuobao.po.StorerMessage;
import com.chihuobao.po.User;
import com.chihuobao.po.UserMessage;
import com.chihuobao.service.manager.ManagerMessageService;
import com.chihuobao.vo.MessageObject;

/**
 * 消息管理服务实现类
 * @author 谢韦烈
 * 2017-12-17
 */
@Service
@Transactional
public class ManagerMessageServiceImpl implements ManagerMessageService {

	@Autowired
	private ManagerMessageMapper mMessageMapper; //消息管理mapper接口
	
	Date date = new Date();
	
	@Override
	public void saveUestMessage(UserMessage userMessage) {
		
		userMessage.setMessageDate(date);
		mMessageMapper.saveUestMessage(userMessage);
		
	}

	@Override
	public void saveStorerMessage(StorerMessage storerMessage) {
		
		storerMessage.setMessageDate(date);
		mMessageMapper.saveStorerMessage(storerMessage);
	}
	
	//用户根据该id查找属于它的消息大小
	public List<UserMessage> selectMessageSizeByUserId(Integer userId) {
		List<UserMessage> userMessage=mMessageMapper.selectMessageByUserId(userId);
		//消息置为已读
		return userMessage;
	}

	//用户根据该id查找属于它的消息
	public List<UserMessage> selectMessageByUserId(Integer userId) {
		List<UserMessage> userMessage=mMessageMapper.selectMessageByUserId(userId);
		//消息置为已读
		try {
			mMessageMapper.updateMessageTypeByUserId(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userMessage;
	}

	//商家根据该id查找属于它的消息
	@Override
	public List<StorerMessage> selectMessageByStorerId(Integer storerId) {
		
		return mMessageMapper.selectMessageByStorerId(storerId);
	}

	//用户根据消息id删除消息
	@Override
	public void deleteUserMessageById(Integer id) {
		
		mMessageMapper.deleteUserMessageById(id);
	}

	//商家根据消息id删除消息
	@Override
	public void deleteStorerMessageById(Integer id) {
		
		mMessageMapper.deleteStorerMessageById(id);
	}

	//根据下拉框选择用户还是商家
	@Override
	public List<MessageObject> selecUser() {
		
		return mMessageMapper.selectUser();
	}

	//还是商家
	@Override
	public List<MessageObject> selectStorer() {
		
		return mMessageMapper.selectStorer();
	}

	//查找所有的用户
	@Override
	public List<User> selectUserAll() {
		
		return mMessageMapper.selectUserAll();
	}

	//查找所有的商家
	@Override
	public List<StorerAccount> selectStorerAll() {
		
		return mMessageMapper.selectStorerAll();
	}

}

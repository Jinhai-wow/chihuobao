package com.chihuobao.service.impl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.manager.CommentMapper;
import com.chihuobao.service.manager.CommentService;
import com.chihuobao.vo.ManagerOrderVo;

/**
 * 评论管理业务逻辑接口实现类
 * @author 谢韦烈
 * 2017-12-18
 */
@Service
@Transactional
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper commentMapper;
	
	
	//查找该商家全部的评论
	@Override
	public List<ManagerOrderVo> storerComment(Integer shopId) {
		
		return commentMapper.storerComment(shopId);
	}

	
}

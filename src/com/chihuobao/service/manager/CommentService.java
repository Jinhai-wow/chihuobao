package com.chihuobao.service.manager;

import java.util.List;

import com.chihuobao.vo.ManagerOrderVo;

/**
 * 评论管理业务逻辑接口
 * @author Administrator
 *
 */
public interface CommentService {

	//查找该商家全部的评论
	List<ManagerOrderVo> storerComment(Integer shopId);

}

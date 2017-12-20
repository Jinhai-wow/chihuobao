package com.chihuobao.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chihuobao.service.manager.CommentService;
import com.chihuobao.vo.ManagerOrderVo;

/**
 * 评论管理控制类
 * @author 谢韦烈
 * 2017-12-18
 */
@Controller
public class CommentController {

	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value="/storerComment.action")
	public String storerComment(Integer shopId,Model model){

		//查找该商家全部的评论
		List<ManagerOrderVo> orderVoList =  commentService.storerComment(shopId);
		model.addAttribute("comments", orderVoList);
		
		return "business/business_to_user_comment";
	}
}

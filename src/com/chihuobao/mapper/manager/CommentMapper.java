package com.chihuobao.mapper.manager;

import java.util.List;

import com.chihuobao.vo.ManagerOrderVo;

public interface CommentMapper {

	List<ManagerOrderVo> storerComment(Integer shopId);

}

package com.chihuobao.service.impl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.manager.ManagerGoodsStyleMapper;
import com.chihuobao.po.GoodsStyle;
import com.chihuobao.service.manager.ManagerGoodsStyleService;

@Service
@Transactional
public class ManagerGoodsStyleServiceImpl implements ManagerGoodsStyleService {

	@Autowired
	private ManagerGoodsStyleMapper managerGoodsStyleMapper;
	
	@Override
	public GoodsStyle selectGoodsStyleById(Integer goodStyleId) {
		
		return managerGoodsStyleMapper.selectGoodsStyleById(goodStyleId); 
	}

	@Override
	public List<GoodsStyle> selectGoodsStyle() {
		
		return managerGoodsStyleMapper.selectGoodsStyle();
	}

	@Override
	public void saveGoodsStyle(String styleName) {
		
		managerGoodsStyleMapper.saveGoodsStyle(styleName);
	}

}

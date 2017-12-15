package com.chihuobao.service.impl.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.manager.ManagerShopStyleMapper;
import com.chihuobao.po.ShopStyle;
import com.chihuobao.service.manager.ManagerShopStyleService;
import com.chihuobao.vo.ShopStyleVo;

@Service
@Transactional
public class ManagerShopStyleServiceImpl implements ManagerShopStyleService {

	@Autowired
	private ManagerShopStyleMapper managerShopStyleMapper;
	
	@Override
	public List<ShopStyle> selectShopStyle() {
		
		return managerShopStyleMapper.selectShopStyle();
	}

	//新增商家类型
	@Override
	public void saveShopStyle(ShopStyle shopStyle) {
		managerShopStyleMapper.saveShopStyle(shopStyle);
	}

	//查找商家总条数
	@Override
	public Integer selectShopStyleTotal() {
		return managerShopStyleMapper.selectShopStyleTotal();
	}

	//查找商家类型列表
	@Override
	public List<ShopStyleVo> selectShopStyleList(ShopStyleVo vo) {
		return managerShopStyleMapper.selectShopStyleList(vo);
	}

	//根据id搜索类型显示到编辑页面
	@Override
	public ShopStyle selectShopStyleByid(Integer id) {
		
		return managerShopStyleMapper.selectShopStyleByid(id);
	}

	//更新修改过后的值
	@Override
	public void updateShopStyle(ShopStyle shopStyle) {
		
		managerShopStyleMapper.updateShopStyle(shopStyle);
	}

	//删除商家类型
	@Override
	public void deleteShopStyleByids(ShopStyleVo vo) {
		
		managerShopStyleMapper.deleteShopStyleByids(vo);
	}

}

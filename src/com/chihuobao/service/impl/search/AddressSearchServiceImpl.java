package com.chihuobao.service.impl.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chihuobao.mapper.search.AddressSearchMapper;
import com.chihuobao.po.Shop;
import com.chihuobao.service.search.AddressSearchService;
import com.chihuobao.vo.LngAndLatVo;
@Service("addressSearchService")
public class AddressSearchServiceImpl implements AddressSearchService{
	@Autowired
	private AddressSearchMapper addressSearchMapper;
	
	public List<Shop> selectShopByUserPoint(LngAndLatVo lngAndLatVo){
		return addressSearchMapper.selectShopByUserPoint(lngAndLatVo);
	}
}

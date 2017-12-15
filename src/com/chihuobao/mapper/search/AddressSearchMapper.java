package com.chihuobao.mapper.search;

import java.util.List;

import com.chihuobao.po.Shop;
import com.chihuobao.vo.LngAndLatVo;
/**
 * 搜索地址的Mapper接口
 * @author 何煜华
 * 2017-12-17
 */
public interface AddressSearchMapper {
	//根据用户输入的商店名搜索商店
	
	//根据用户的经纬度搜索用户周边商家id
	public List<Shop> selectShopByUserPoint(LngAndLatVo lngAndLatVo);
}

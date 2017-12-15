package com.chihuobao.service.search;

import java.util.List;

import com.chihuobao.po.Shop;
import com.chihuobao.vo.LngAndLatVo;

public interface AddressSearchService {

	public List<Shop> selectShopByUserPoint(LngAndLatVo lngAndLatVo);
}

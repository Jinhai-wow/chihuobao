package com.chihuobao.controller.search;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.Shop;
import com.chihuobao.service.search.AddressSearchService;
import com.chihuobao.vo.GetUserLngAndLatVo;
import com.chihuobao.vo.LngAndLatVo;
import com.google.gson.Gson;

import net.sf.json.JSONArray;
@Controller
public class AddressSearchController {
	@Autowired
	private AddressSearchService addressSearchService;
	
	//显示能够进行配送的商家
	@RequestMapping(value="showShopId.action",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody String searchShops(@RequestBody String result){
		//接收得到的商家
		String jsonStr = "";
		//获取界面传过来的，用户的 经纬度 ，以及搜索范围（默认为10公里，也只做了10公里）
		Gson gson=new Gson();
		GetUserLngAndLatVo fromJson = gson.fromJson(result, GetUserLngAndLatVo.class);
		Double lng = fromJson.getLng();
		Double lat = fromJson.getLat();
		Integer range = fromJson.getRange();

		//创建对象存储经纬度，与配送距离
		LngAndLatVo lngAndLatVo = new LngAndLatVo();
		lngAndLatVo.setLat(lat);
		lngAndLatVo.setLng(lng);
		
		//这里是在数据库中，找出距离用户30公里范围内的所有商家，缩减查找商家访问，
		//不同经纬度起点，加上同样的经、纬度数，所变化的距离有所不同
		//如：(lat:0 ,lng :0 )到( lat:0+ 0.2,lng :0) 的距离 与 (lat:45 ,lng :0 )到 (lat:45+ 0.2,lng :0 )的距离不同
		//如果需要搜索其他范围的在这里添加case就可以了
		switch (range) {
			case 10:
				//纬度变化0.200000 公里数变化大概在15到20公里之间，缩小查找范围
				//(可以仔细找，找到无论怎么切换经纬度最低都是10公里的所需变化值)
				lngAndLatVo.setRangeLat(0.200000);
				lngAndLatVo.setRangeLng(0.200000);
				break;
			default:
				lngAndLatVo.setRangeLat(0.200000);
				lngAndLatVo.setRangeLng(0.200000);
				break;
		}
		//存储可以进行配送的商店id列表
		List<Shop> shopIdList = addressSearchService.selectShopByUserPoint(lngAndLatVo);
		//检测商家是否可以对这个坐标的用户进行配送
		try {
			JSONArray jsonObject = JSONArray.fromObject(shopIdList);
	        jsonStr = jsonObject.toString();
	        System.out.println(jsonStr);
			System.out.println(shopIdList);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return jsonStr;

	}
}

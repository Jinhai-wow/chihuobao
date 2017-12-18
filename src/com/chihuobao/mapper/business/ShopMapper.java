package com.chihuobao.mapper.business;

import com.chihuobao.po.Shop;
import com.chihuobao.po.ShopData;
import com.chihuobao.po.ShopExample;
import com.chihuobao.po.ShopStyle;
import com.chihuobao.po.Ordertable;

import java.util.List;
import org.apache.ibatis.annotations.Param;
/**
 * 
 * @description 商店信息访问接口
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public interface ShopMapper {
    int countByExample(ShopExample example);

    int deleteByExample(ShopExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Shop record);

    int insertSelective(Shop record);

    List<Shop> selectByExample(ShopExample example);

    Shop selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Shop record, @Param("example") ShopExample example);

    int updateByExample(@Param("record") Shop record, @Param("example") ShopExample example);

    int updateByPrimaryKeySelective(Shop record);

    int updateByPrimaryKey(Shop record);
    
    ShopData selectShopDataByShopId(Integer id);

	Shop selectShopByAccountId(Integer id);

	List<Ordertable> selectOrdersByShopId(Integer id);

	List<ShopStyle> selectShopStyle();

	int updateShopDataByShopId(ShopData shopData);

	int selectLastId();//返回最新的商店记录id

	int insertShopData(ShopData shopData);//

	int countOrdersByShopId(Integer shopId);//商家订单数
}
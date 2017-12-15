package com.chihuobao.mapper.business;

import com.chihuobao.po.GoodsStyle;
import com.chihuobao.po.Ordertable;
import com.chihuobao.po.User;
import com.chihuobao.po.Goods;
import com.chihuobao.po.GoodsExample;
import com.chihuobao.vo.GoodsCustom;

import java.util.List;
import org.apache.ibatis.annotations.Param;
/**
 * 
 * @description 商品信息数据访问接口
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public interface GoodsMapper {
    int countByExample(GoodsExample example);//多条件查询记录数

    int deleteByExample(GoodsExample example);//多条件删除记录

    int deleteByPrimaryKey(Integer id);//根据主键删除记录

    int insert(Goods record);//添加记录

    int insertSelective(Goods record);//选择性（不为null时）添加记录

    List<Goods> selectByExample(GoodsExample example);//多条件查询记录

    Goods selectByPrimaryKey(Integer id);//根据主键查询记录
    
    Goods selectByGoodNumber(String goodNumber);//根据商品编号查询商品

    int updateByExampleSelective(@Param("record") Goods record, @Param("example") GoodsExample example);

    int updateByExample(@Param("record") Goods record, @Param("example") GoodsExample example);//多条件更新记录

    int updateByPrimaryKeySelective(Goods record);//根据主键并不为null时更新记录

    int updateByPrimaryKey(Goods record);//根据主键更新记录
    
    List<GoodsStyle> selectGoodStyleByAll();//根据id获取更新商品时的数据
    
    
    GoodsCustom selectByPrimaryKeyWithGoodStyle(Integer id);//一对一查询获取商品详情
    
    List<GoodsStyle> selectStyleByShopId(Integer id);//根据商店id查找商品类型    
    
    List<Goods> selectGoodByShopId(Integer id);//根据商店id查找商品列表
    
    int insertGoodStyle(GoodsStyle goodStyle);//添加商品类型

	int selectGoodStyleIdByShopIdNew(Integer shopId);

	int deleteGoodStyleById(Integer id);

	Goods selectByGoodName(String goodName);//重名
    
	/**
	 * 商店相关
	 */
	public List<Ordertable> selectOrderByShopId(Integer id);
	public List<Ordertable> selectAcceptingOrderByShopId(Integer id);
	public List<Ordertable> selectCancelingOrderByShopId(Integer id);
	public List<Ordertable> selectFinishOrderByShopId(Integer id);
	public int updateOrderStateAccept(long id);
	public int updateOrderStateSend(Ordertable ordertable);
	public int updateOrderStateBackRefuse(Ordertable ordertable);
	public int updateOrderStateBackAccept(Long id);
	public List<Ordertable> selectNoSendOrderByShopId(Integer id);
	public int updateOrderRefuse(Ordertable ordertable);
	public List<Ordertable> selectSendOrderByShopId(Integer id);
	public User getUser(Integer userid);

}
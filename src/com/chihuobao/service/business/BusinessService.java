/**
 * 
 */
package com.chihuobao.service.business;

import java.util.List;

import com.chihuobao.po.GoodsStyle;
import com.chihuobao.po.Goods;
import com.chihuobao.po.ManInfo;
import com.chihuobao.po.Shop;
import com.chihuobao.po.ShopData;
import com.chihuobao.po.ShopStyle;
import com.chihuobao.po.StorerAccount;
import com.chihuobao.po.UserComment;
import com.chihuobao.vo.BusinessCustom;
import com.chihuobao.vo.BusinessExtend;
import com.chihuobao.vo.GoodsCustom;
import com.chihuobao.vo.OrderCustom;
import com.chihuobao.vo.ShopCustom;
import com.chihuobao.vo.StorerAccountVo;
import com.chihuobao.po.Ordertable;

/**
 * 
 * @description 商家业务处理逻辑接口
 * @author 王锦海
 * @date 2017年12月4日
 * @version 1.0
 */
public interface BusinessService {
	public Shop selectShopById(Integer id)throws Exception;//根据商家id获取信息
	public Shop selectShopByAccountId(Integer id)throws Exception;//根据账号id获取商店信息
	public int updateShopById(Shop shop);//根据商店id更新商店信息
	public ShopData selectShopDataByShopId(Integer id)throws Exception;//根据商店id查找商店审核资料
	public List<ShopStyle> selectShopStyle();//获取所有的商店类型
	public int updateShopDataByShopId(ShopData shopData);//根据商店id获取商店审核资料
	public int insertShop(ShopCustom shopCustom);//同时添加商店和审核资料
	public int insertShop(Shop shop);//添加商店
	public int insertShopDataByShopId(ShopData shopData);//添加商店审核资料
	
	public GoodsCustom selectGoodsById(Integer id)throws Exception;//根据id查询商品
	public List<Goods> selectGoodsByAll()throws Exception;//根据商店id查询全部商品
	public List<GoodsStyle> selectGoodStyleByAll();//所有商品类型
	public List<GoodsStyle> selectGoodStyleByShopId(Integer id);//根据商店id获取商品类型
	public int updateGoodById(Goods good);//根据id更新商品
	public int insertGood(Goods goods,Integer shopId);//添加商品
	public int deleteGoodById(Integer id) throws Exception;//根据商品id删除商品
	public List<Goods> seleteGoodByShopId(Integer id)throws Exception;//根据商家id获取商品
	public int insertGoodStyle(GoodsStyle goodStyle, Integer shopId)throws Exception;//添加商店的商品类型
	public int selectGoodStyleByShopIdNew(Integer shopId);//查询最新添加的商品类型的id
	public int deleteGoodStyleById(Integer id);//删除商品类型
	
	public List<ManInfo> selectSysMsgAll();//获取所有的系统消息
	public List<ManInfo> selectSysMsgByShopId(Integer id)throws Exception;//获取商店所有的系统消息
	public StorerAccountVo selectServiceMsg(Integer id);//获取商家的服务信息
	
	public StorerAccount selectAccountById(Integer id)throws Exception;//根据id获取账号信息
	public int updateAccountById(StorerAccount account);//根据账号id更新账号
	public int updateAccountPsw(StorerAccountVo storerAccountVo);//更新账号密码
	public int addStorerPic(StorerAccount account);//ajax更新头像
	public int updateAccontEmail(StorerAccount account)throws Exception;//重新绑定邮箱
	
	public int updateOrderByAccess(Integer id)throws Exception;//同意取消订单
	public int updateOrderByFinish(Integer id)throws Exception;//完成订单
	public int updateOrderByBack(Integer id)throws Exception;//退单
	public List<Ordertable> seleteOrderByShopId(Integer id)throws Exception;//根据商店id查找订单
	public OrderCustom selectOrderById(Long id)throws Exception;//根据订单id查找订单
	public List<Ordertable> seleteAcceptingOrderByShopId(Integer id);//查找待接订单
	public List<Ordertable> seleteCancelingOrderByShopId(Integer id);//查找申请取消订单
	public List<Ordertable> seleteFinishOrderByShopId(Integer id);//查找已完成订单
	public List<Ordertable> seleteNoSendOrderByShopId(Integer id);//未发货订单
	public List<Ordertable> seleteSendOrderByShopId(Integer id);//已发货订单
	public int acceptOrder(Long id)throws Exception;//根据订单id接单
	public int sendOrder(Ordertable ordertable);//发货
	public int backRefuseOrder(Ordertable ordertable);//拒绝取消订单
	public int backAcceptOrder(Long id);//接受取消订单
	public int refuseOrder(Ordertable ordertable);//不接订单

}

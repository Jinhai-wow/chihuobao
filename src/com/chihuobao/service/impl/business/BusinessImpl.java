/**
 * 
 */
package com.chihuobao.service.impl.business;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chihuobao.mapper.business.GoodsMapper;
import com.chihuobao.mapper.business.ManInfoMapper;
import com.chihuobao.mapper.business.ShopMapper;
import com.chihuobao.mapper.business.StorerAccountMapper;
import com.chihuobao.mapper.order.OrdertableDao;
import com.chihuobao.po.GoodsStyle;
import com.chihuobao.po.Goods;
import com.chihuobao.po.GoodsExample;
import com.chihuobao.po.GoodsExample.Criteria;
import com.chihuobao.po.ManInfo;
import com.chihuobao.po.Shop;
import com.chihuobao.po.ShopData;
import com.chihuobao.po.ShopExample;
import com.chihuobao.po.ShopStyle;
import com.chihuobao.po.StorerAccount;
import com.chihuobao.po.StorerMessage;
import com.chihuobao.po.UserComment;
import com.chihuobao.service.business.BusinessService;
import com.chihuobao.vo.BusinessCustom;
import com.chihuobao.vo.BusinessExtend;
import com.chihuobao.vo.GoodsCustom;
import com.chihuobao.vo.OrderCustom;
import com.chihuobao.vo.ShopCustom;
import com.chihuobao.vo.StorerAccountVo;
import com.chihuobao.po.Ordergoods;
import com.chihuobao.po.Ordertable;
import com.chihuobao.po.User;

/**
 * 
 * @description 商家业务接口实现
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
@Service
@Transactional
public class BusinessImpl implements BusinessService {

	@Autowired
	private GoodsMapper goodsMapper;//自动注入代理对象
	@Autowired
	private ShopMapper shopMapper;
	@Autowired
	private ManInfoMapper manInfoMapper;
	@Autowired
	private StorerAccountMapper storerAccountMapper;
	@Autowired
	private OrdertableDao ordertableDao;


	@Override
	public int updateOrderByAccess(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOrderByFinish(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOrderByBack(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Goods> selectGoodsByAll() throws Exception {
		
		return goodsMapper.selectByExample(null);
	}

	@Override
	public GoodsCustom selectGoodsById(Integer id) throws Exception {
		
		return goodsMapper.selectByPrimaryKeyWithGoodStyle(id);
	}

	@Override
	public int deleteGoodById(Integer id) throws Exception {
		
		return goodsMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int updateGoodById(Goods good) {
	
		return goodsMapper.updateByPrimaryKeySelective(good);	
	}

	@Override
	public List<GoodsStyle> selectGoodStyleByAll() {
		
		return goodsMapper.selectGoodStyleByAll();
	}

	@Override
	public int insertGood(Goods goods,Integer shopId) {
		List<Integer> styleIdList = new ArrayList<Integer>();
		List<GoodsStyle> goodStyles = this.selectGoodStyleByShopId(shopId);
		for (GoodsStyle goodStyle : goodStyles) {
			styleIdList.add((int) goodStyle.getId());//该商店下的类型
		}
		
		 if (goodsMapper.selectByGoodName(goods.getGoodName())==null) {
			 return goodsMapper.insertSelective(goods);
		}else if(!styleIdList.contains(goodsMapper.selectByGoodName(goods.getGoodName()).getGoodStyleId())){
			return goodsMapper.insertSelective(goods);
		}
		return -2;
	}

	@Override
	public Shop selectShopById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return shopMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Goods> seleteGoodByShopId(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.selectGoodByShopId(id);
	}

	@Override
	public List<GoodsStyle> selectGoodStyleByShopId(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.selectStyleByShopId(id);
	}

	@Override
	public int insertGoodStyle(GoodsStyle goodStyle,Integer shopId) {
		int record =0;
		if (goodStyle.getStyleName()==null || goodStyle.getStyleName()=="") {
			record = -2;
		}else{
			List<GoodsStyle> list = goodsMapper.selectStyleByShopId(shopId);
			for (GoodsStyle style : list) {
				if (style.getStyleName().equals(goodStyle.getStyleName())) {
					record = -3;
				}
			}
		}
		if (record != -3 && record != -2){
			record = goodsMapper.insertGoodStyle(goodStyle);
		}
		return record;
	}

	@Override
	public List<ManInfo> selectSysMsgAll() {
		// TODO Auto-generated method stub
		return manInfoMapper.selectSysMsgAll();
	}

	@Override
	public List<ManInfo> selectSysMsgByShopId(Integer id) {
		// TODO Auto-generated method stub
		return manInfoMapper.selectSysMsgByShopId(id);
	}

	@Override
	public Shop selectShopByAccountId(Integer id) throws Exception {
		
		return shopMapper.selectShopByAccountId(id);
	}

	@Override
	public ShopData selectShopDataByShopId(Integer id) {
		// TODO Auto-generated method stub
		
		return shopMapper.selectShopDataByShopId(id);
	}

	@Override
	public StorerAccount selectAccountById(Integer id) {
		// TODO Auto-generated method stub
		return storerAccountMapper.selectByPrimaryKey(id);
	}

	@Override
	public StorerAccountVo selectServiceMsg(Integer id) {
		StorerAccountVo storerAccountVo = new StorerAccountVo();
		Double income = 0.00;//收入
		Double disbursement = 0.00;//支出
		Integer count=0;
		List<Ordertable> ordertables = shopMapper.selectPaiedOrdersByShopId(id);
		for (Ordertable ordertable : ordertables) {
			income = income + ordertable.getTotalmoney();
			count += 1; 
		}
		storerAccountVo.setOrders(ordertables);
		storerAccountVo.setIncome(income);
		storerAccountVo.setDisbursement(disbursement);
		storerAccountVo.setListCounts(count);
		return storerAccountVo;
	}

	@Override
	public int updateAccountById(StorerAccount account) {
		
		return storerAccountMapper.updateByPrimaryKeySelective(account);
	}

	@Override
	public int updateAccountPsw(StorerAccountVo storerAccountVo) {
		String newPsw = storerAccountVo.getNewPassword();
		StorerAccount storerAccount = storerAccountMapper.selectByPrimaryKey
				(storerAccountVo.getStorerAccount().getId());
		if (storerAccountVo.getStorerAccount().getPassword() != storerAccount.getPassword()) {
			storerAccountVo.getStorerAccount().setPassword(newPsw);
			return storerAccountMapper.updateByPrimaryKeySelective(storerAccountVo.getStorerAccount());
		}
		return -2;
	}

	@Override
	public int updateShopById(Shop shop) {
		// TODO Auto-generated method stub
		return shopMapper.updateByPrimaryKeySelective(shop);
	}

	@Override
	public List<ShopStyle> selectShopStyle() {
		// TODO Auto-generated method stub
		return shopMapper.selectShopStyle();
	}

	@Override
	public int updateShopDataByShopId(ShopData shopData) {
		// TODO Auto-generated method stub
		Shop shop = shopMapper.selectByPrimaryKey(shopData.getShopId());
		if (shop.getAuditState()!=0) {
			shop.setAuditState(0);
			shopMapper.updateByPrimaryKey(shop);
		}//修改商家为待审核
		return shopMapper.updateShopDataByShopId(shopData);
	}

	@Override
	public int addStorerPic(StorerAccount account) {
		
		return storerAccountMapper.updateByPrimaryKeySelective(account);
	}

	@Override
	public int selectGoodStyleByShopIdNew(Integer shopId) {
		// TODO Auto-generated method stub
		return goodsMapper.selectGoodStyleIdByShopIdNew(shopId);
	}

	@Override
	public int deleteGoodStyleById(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.deleteGoodStyleById(id);
	}

	@Override
	public int insertShop(ShopCustom shopCustom) {
		Integer record = shopMapper.insertSelective(shopCustom.getShop());
		Integer shopId;
		if (record>0) {
			shopId = shopMapper.selectLastId();
			shopCustom.getShopData().setShopId(shopId);
		}
		return shopMapper.insertShopData(shopCustom.getShopData());
	}

	@Override
	public int insertShop(Shop shop) {
		if (shopMapper.insertSelective(shop)>0) {
			return shopMapper.selectLastId();//返回添加的商店id
		}
		return -2;
	}

	@Override
	public int insertShopDataByShopId(ShopData shopData) {
		// TODO Auto-generated method stub
		return shopMapper.insertShopData(shopData);
	}

	@Override
	public List<Ordertable> seleteOrderByShopId(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.selectOrderByShopId(id);
	}

	@Override
	public OrderCustom selectOrderById(Long id) {
		// TODO Auto-generated method stub
		OrderCustom orderCustom = new OrderCustom();
		Ordertable ordertable = ordertableDao.getOrder(id);
		List<Ordergoods> ordergoods = ordertableDao.getOrdergoodsListByOrderID(id);
		User user = goodsMapper.getUser(ordertable.getUserid());
		orderCustom.setOrdertable(ordertable);
		orderCustom.setUser(user);
		orderCustom.getOrdertable().setOrdergoodsList(ordergoods);
		return orderCustom;
	}

	@Override
	public List<Ordertable> seleteAcceptingOrderByShopId(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.selectAcceptingOrderByShopId(id);
	}

	@Override
	public List<Ordertable> seleteCancelingOrderByShopId(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.selectCancelingOrderByShopId(id);
	}

	@Override
	public List<Ordertable> seleteFinishOrderByShopId(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.selectFinishOrderByShopId(id);
	}

	@Override
	public int acceptOrder(Long id) throws Exception {
		// TODO Auto-generated method stub
		return goodsMapper.updateOrderStateAccept(id);
	}

	@Override
	public int sendOrder(Ordertable ordertable) {
		// TODO Auto-generated method stub
		Ordertable order = ordertableDao.getOrder(ordertable.getId());
		Shop shop = shopMapper.selectByPrimaryKey(order.getShopid());
		StorerAccount account = storerAccountMapper.selectByPrimaryKey(shop.getStorerId());
		account.setStorerMoney(account.getStorerMoney()+order.getTotalmoney());
		storerAccountMapper.updateByPrimaryKeySelective(account);//发货后订单资金加进商家资金
		return goodsMapper.updateOrderStateSend(ordertable);
	}

	@Override
	public int backRefuseOrder(Ordertable ordertable) {
		// TODO Auto-generated method stub
		return goodsMapper.updateOrderStateBackRefuse(ordertable);
	}

	@Override
	public int backAcceptOrder(Long id) {
		// TODO Auto-generated method stub
		return goodsMapper.updateOrderStateBackAccept(id);
	}

	@Override
	public List<Ordertable> seleteNoSendOrderByShopId(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.selectNoSendOrderByShopId(id);
	}

	@Override
	public int refuseOrder(Ordertable ordertable) {
		// TODO Auto-generated method stub
		return goodsMapper.updateOrderRefuse(ordertable);
	}

	@Override
	public List<Ordertable> seleteSendOrderByShopId(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.selectSendOrderByShopId(id);
	}

	@Override
	public int updateAccontEmail(StorerAccount account) throws Exception {
		// TODO Auto-generated method stub
		return storerAccountMapper.updateByPrimaryKeySelective(account);
	}

	@Override
	public ShopCustom selectShopMsgById(Integer shopId) {
		// TODO Auto-generated method stub
		ShopCustom shopCustom = new ShopCustom();
		Shop shop = shopMapper.selectByPrimaryKey(shopId);
		int orderCounts = shopMapper.countOrdersByShopId(shopId);
		shopCustom.setShop(shop);
		shopCustom.setOrderCounts(orderCounts);
		return shopCustom;
	}

	@Override
	public List<StorerMessage> selectSysMsgByAccountId(Integer id) {
		// TODO Auto-generated method stub
		List<StorerMessage> messages=storerAccountMapper.selectSysMsgByStorerId(id);
		for (StorerMessage storerMessage : messages) {
			storerAccountMapper.updateSysMsgHadRead(storerMessage.getId());
		}
		return storerAccountMapper.selectSysMsgByStorerId(id);
	}

}

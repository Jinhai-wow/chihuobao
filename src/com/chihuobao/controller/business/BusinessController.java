/**
 * 
 */
package com.chihuobao.controller.business;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.stat.TableStat.Mode;
import com.chihuobao.po.GoodsStyle;
import com.chihuobao.po.Goods;
import com.chihuobao.po.ManInfo;
import com.chihuobao.po.Shop;
import com.chihuobao.po.ShopData;
import com.chihuobao.po.ShopStyle;
import com.chihuobao.po.StorerAccount;
import com.chihuobao.po.StorerMessage;
import com.chihuobao.po.UserComment;
import com.chihuobao.service.business.BusinessService;
import com.chihuobao.util.MailUtil;
import com.chihuobao.util.UploadImageUtil;
import com.chihuobao.vo.BusinessCustom;
import com.chihuobao.vo.GoodsCustom;
import com.chihuobao.vo.GoodsCustomVo;
import com.chihuobao.vo.OrderCustom;
import com.chihuobao.vo.ShopCustom;
import com.chihuobao.vo.StorerAccountVo;
import com.chihuobao.po.Ordertable;

/**
 * 
 * @description 商家控制类
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
@Controller
public class BusinessController {
	@Autowired
	private BusinessService businessService;

	/**
	 * 获取所有订单
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getOrdersList.action")
	public String getOrdersList(Model model, HttpSession session) {

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
		Shop shop = business.getShop();
		List<Ordertable> ordertables;
		try {
			ShopData shopData = businessService.selectShopDataByShopId(shop.getId());
			if (shop == null || shop.getAuditState() == 2 || shopData == null) {
				return "business/business_noshopOrwaitingaudit";
			}
			ordertables = businessService.seleteOrderByShopId(shop.getId());
			// business.setGoods(goods);
			// session.setAttribute("business", business);
			model.addAttribute("ordersList", ordertables);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "business/business_error";
		}

		return "business/business_order_List";
	}

	/**
	 * 获取待接订单
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getOrdersAccepting.action")
	public String getOrdersAccepting(Model model, HttpSession session) {

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
		Shop shop = business.getShop();
		List<Ordertable> ordertables;
		try {
			ordertables = businessService.seleteAcceptingOrderByShopId(shop.getId());
			model.addAttribute("ordersList", ordertables);
			model.addAttribute("orderState", 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "business/business_error";
		}

		return "business/business_order_choose_List";
	}

	/**
	 * 获取未发货订单
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getOrdersNoSend.action")
	public String getOrdersNoSend(Model model, HttpSession session) {

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
		Shop shop = business.getShop();
		List<Ordertable> ordertables;
		try {
			ordertables = businessService.seleteNoSendOrderByShopId(shop.getId());
			model.addAttribute("ordersList", ordertables);
			model.addAttribute("orderState", 2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "business/business_error";
		}

		return "business/business_order_choose_List";
	}

	/**
	 * 获取未发货订单
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getOrdersSend.action")
	public String getOrdersSend(Model model, HttpSession session) {

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
		Shop shop = business.getShop();
		List<Ordertable> ordertables;
		try {
			ordertables = businessService.seleteSendOrderByShopId(shop.getId());
			model.addAttribute("ordersList", ordertables);
			model.addAttribute("orderState", 3);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "business/business_error";
		}

		return "business/business_order_choose_List";
	}

	/**
	 * 获取取消订单
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getOrdersCanceling.action")
	public String getOrdersCanceling(Model model, HttpSession session) {

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
		Shop shop = business.getShop();
		List<Ordertable> ordertables;
		try {
			ordertables = businessService.seleteCancelingOrderByShopId(shop.getId());
			model.addAttribute("ordersList", ordertables);
			model.addAttribute("orderState", 7);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "business/business_error";
		}

		return "business/business_order_choose_List";
	}

	/**
	 * 获取已完成订单
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getOrdersFinish.action")
	public String getOrdersFinish(Model model, HttpSession session) {

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
		Shop shop = business.getShop();
		List<Ordertable> ordertables;
		try {
			ordertables = businessService.seleteFinishOrderByShopId(shop.getId());
			model.addAttribute("ordersList", ordertables);
			model.addAttribute("orderState", 5);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "business/business_error";
		}

		return "business/business_order_choose_List";
	}

	/**
	 * 接单
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/acceptOrder.action", method = RequestMethod.POST)
	@ResponseBody
	public int acceptOrder(Long id) {
		int record;
		try {
			record = businessService.acceptOrder(id);
		} catch (Exception e) {
			// TODO: handle exception
			record = -1;
		}
		return record;
	}

	/**
	 * 发货
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/sendOrder.action", method = RequestMethod.POST)
	@ResponseBody
	public int sendOrder(Ordertable ordertable) {
		int record;
		try {
			record = businessService.sendOrder(ordertable);
		} catch (Exception e) {
			// TODO: handle exception
			record = -1;
		}
		return record;
	}

	/**
	 * 不接订单
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/refuseOrder.action", method = RequestMethod.POST)
	@ResponseBody
	public int refuseOrder(Ordertable ordertable) {
		int record;
		try {
			record = businessService.refuseOrder(ordertable);
		} catch (Exception e) {
			// TODO: handle exception
			record = -1;
		}
		return record;
	}

	/**
	 * 拒绝取消订单
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/backRefuseOrder.action", method = RequestMethod.POST)
	@ResponseBody
	public int backRefuseOrder(Ordertable ordertable) {
		int record;
		try {
			record = businessService.backRefuseOrder(ordertable);
		} catch (Exception e) {
			// TODO: handle exception
			record = -1;
		}
		return record;
	}

	/**
	 * 接受取消订单
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/backAcceptOrder.action", method = RequestMethod.POST)
	@ResponseBody
	public int backAcceptOrder(Long id) {
		int record;
		try {
			record = businessService.backAcceptOrder(id);
		} catch (Exception e) {
			// TODO: handle exception
			record = -1;
		}
		return record;
	}

	/**
	 * 获取订单详情
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getOrderDetail.action")
	public String getOrderDetail(@RequestParam("id") long id, Model model) {

		try {
			OrderCustom order = businessService.selectOrderById(id);
			model.addAttribute("order", order);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "business/business_order_detail";
	}

	/**
	 * 获取商品详情
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getGoodDetail.action")
	public String getGoodDetail(Integer id, Model model) {

		GoodsCustom good;
		try {
			good = businessService.selectGoodsById(id);
			model.addAttribute("good", good);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "business/business_error";
		}

		return "business/business_goods_detail";
	}

	/**
	 * 获取所有商品
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getGoodsList.action")
	public String getGoodsList(Model model, HttpSession session) {

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
		Shop shop = business.getShop();
		List<Goods> goods;
		try {
			if (shop == null || shop.getAuditState() == 2) {
				return "business/business_noshopOrwaitingaudit";
			}
			goods = businessService.seleteGoodByShopId(business.getShop().getId());
			// business.setGoods(goods);
			// session.setAttribute("business", business);
			model.addAttribute("goodsList", goods);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "business/business_error";
		}

		return "business/business_goods_List";
	}

	/**
	 * 去更新商品
	 * 
	 * @param id
	 * @param goodsCustomVo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/toGoodEdit.action")
	public ModelAndView toGoodEdit(Integer id, GoodsCustomVo goodsCustomVo, HttpSession session) throws Exception {

		BusinessCustom businessCustom = (BusinessCustom) session.getAttribute("business");
		GoodsCustom good = businessService.selectGoodsById(id);
		List<GoodsStyle> GoodsStyles = businessService.selectGoodStyleByShopId(businessCustom.getShop().getId());// 获取商品类型
		goodsCustomVo.setGoodsCustom(good);
		goodsCustomVo.setGoodStyles(GoodsStyles);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("goodVo", goodsCustomVo);
		modelAndView.setViewName("business/business_goods_edit");

		return modelAndView;
	}


	/**
	 * 更新商品
	 * 
	 * @param good
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/updateGood.action", method = RequestMethod.POST)
	public String updateGood(GoodsCustomVo good, HttpSession session, 
			@RequestParam(value = "goodPic") MultipartFile goodPic) {
		UploadImageUtil uImageUtil = new UploadImageUtil(goodPic,session);
		int record;
		try {
			if (uImageUtil.getFileName() != null) {
				good.getGoods().setGoodPic(uImageUtil.getFileName());
			}
			record = businessService.updateGoodById(good.getGoods());
			if (record > 0) {
				uImageUtil.saveToDisk();
			}
		} catch (Exception e) {
			record = -1;
		}
		return "redirect:/getGoodsList.action";
	}

	/**
	 * 删除商品
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteGood.action")
	public String deleteGood(Integer id) {
		int record;
		try {
			record = businessService.deleteGoodById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			record = -1;
		}

		return "redirect:/getGoodsList.action";
	}

	/**
	 * 去添加商品
	 * 
	 * @param goodsCustomVo
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/toAddGood.action")
	public ModelAndView toAddGood(GoodsCustomVo goodsCustomVo, HttpSession session) {

		BusinessCustom businessCustom = (BusinessCustom) session.getAttribute("business");
		List<GoodsStyle> GoodsStyles = businessService.selectGoodStyleByShopId(businessCustom.getShop().getId());// 获取商品类型
		goodsCustomVo.setGoodStyles(GoodsStyles);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("goodVo", goodsCustomVo);
		modelAndView.setViewName("business/business_goods_add");

		return modelAndView;
	}

	
	/**
	 * 添加商品
	 * 
	 * @param good
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/addGood.action", method = RequestMethod.POST)
	public String addGood(GoodsCustomVo good, @RequestParam(value = "goodPic") MultipartFile goodPic,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		UploadImageUtil uImageUtil = new UploadImageUtil(goodPic,session);
		BusinessCustom businessCustom = (BusinessCustom) session.getAttribute("business");
		int record;
		try {
			good.getGoods().setGoodPic(uImageUtil.getFileName());
			record = businessService.insertGood(good.getGoods(), businessCustom.getShop().getId());
			if (record > 0) {
				uImageUtil.saveToDisk();
			}
		} catch (Exception e) {
			record = -1;
			e.printStackTrace();
		}

		return "redirect:/getGoodsList.action";
	}

	/**
	 * 添加商店商品类型
	 * 
	 * @param GoodsStyle
	 * @return
	 */
	@RequestMapping(value = "/addGoodsStyle.action", method = RequestMethod.POST)
	@ResponseBody
	public Integer addGoodsStyle(GoodsStyle GoodsStyle,HttpSession session) {
		BusinessCustom businessCustom = (BusinessCustom) session.getAttribute("business");
		int record;
		try {
			businessService.insertGoodStyle(GoodsStyle,businessCustom.getShop().getId());
			record = businessService.selectGoodStyleByShopIdNew(GoodsStyle.getShopId());
		} catch (Exception e) {
			record = -1;
		}
		return record;
	}

	/**
	 * 删除商店商品类型
	 * 
	 * @param GoodsStyle
	 * @return
	 */
	@RequestMapping(value = "/deleteGoodsStyle.action", method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteGoodsStyle(Integer id) {
		int record;
		try {
			record = businessService.deleteGoodStyleById(id);
		} catch (Exception e) {
			record = -1;
		}
		return record;
	}


	/**
	 * 获取所有系统消息
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getSysMsg.action")
	public String getSysMsg(Model model, HttpSession session) {

		BusinessCustom businessCustom = (BusinessCustom) session.getAttribute("business");
		Shop shop = businessCustom.getShop();
		try {
			ShopData shopData = businessService.selectShopDataByShopId(shop.getId());
			if (shop == null || shop.getAuditState() == 2 || shopData == null) {
				return "business/business_noshopOrwaitingaudit";
			}
			List<StorerMessage> manInfos = businessService.selectSysMsgByAccountId(businessCustom.getStorerAccount().getId());
			model.addAttribute("sysMsgs", manInfos);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "business/business_sys_message";
	}

	/**
	 * 获取所有用户评论消息
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getUserComment.action")
	public String getUserComment(Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		BusinessCustom businessCustom = (BusinessCustom) session.getAttribute("business");
		Shop shop = businessCustom.getShop();
		try {
			ShopData shopData = businessService.selectShopDataByShopId(shop.getId());
			if (shop == null || shop.getAuditState() == 2 || shopData == null) {
				return "business/business_noshopOrwaitingaudit";
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return "business/business_user_message";
	}

	/**
	 * 获取商家的服务信息
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getMyService.action")
	public String getMyService(Model model, HttpSession session) {
		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
		Shop shop = business.getShop();
		StorerAccount storerAccount = business.getStorerAccount();
		try {
			ShopData shopData = businessService.selectShopDataByShopId(shop.getId());
			if (shop == null || shop.getAuditState() == 2 || shopData == null) {
				return "business/business_noshopOrwaitingaudit";
			}
			StorerAccountVo storerAccountVo = businessService.selectServiceMsg(shop.getId());//
			storerAccountVo.setStorerAccount(storerAccount);
			model.addAttribute("myService", storerAccountVo);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "business/business_service_money";
	}

	/**
	 * 获取账号信息页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getAccount.action")
	public String getAccount(Model model,HttpSession session) {
		return "business/business_account_message";
	}

//	/**
//	 * 更新账号
//	 * 
//	 * @param account
//	 * @param storerPic
//	 * @param session
//	 * @return
//	 */
//	@RequestMapping(value = "/updateAccount.action", method = RequestMethod.POST)
//	public String updateAccount(StorerAccountVo account, @RequestParam(value = "storerPic") MultipartFile storerPic,
//			HttpSession session) {
//		UploadImageUtil uImageUtil = new UploadImageUtil(storerPic);
//
//		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
//		int record;
//		try {
//			if (uImageUtil.getFileName() != null) {
//				account.getStorerAccount().setStorerPic(uImageUtil.getFileName());// 图片
//			}
//			record = businessService.updateAccountById(account.getStorerAccount());
//			StorerAccount storerAccount = businessService.selectAccountById(account.getStorerAccount().getId());
//			business.setStorerAccount(storerAccount);
//			if (record > 0) {
//				uImageUtil.saveToDisk();
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			record = -1;
//		}
//		session.setAttribute("business", business);
//		return "redirect:/getAccount.action";
//	}
	
	/**
	 * 更新账号
	 * 
	 * @param account
	 * @param storerPic
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/updateAccount.action", method = RequestMethod.POST)
	public String updateAccount(StorerAccountVo account, @RequestParam(value = "storerPic") MultipartFile storerPic,
			HttpSession session) {
		UploadImageUtil uImageUtil = new UploadImageUtil(storerPic,session);

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
		int record;
		try {
			if (uImageUtil.getFileName() != null) {
				account.getStorerAccount().setStorerPic(uImageUtil.getFileName());// 图片
			}
			record = businessService.updateAccountById(account.getStorerAccount());
			StorerAccount storerAccount = businessService.selectAccountById(account.getStorerAccount().getId());
			business.setStorerAccount(storerAccount);
			if (record > 0) {
				uImageUtil.saveToDisk();
			}
		} catch (Exception e) {
			// TODO: handle exception
			record = -1;
		}
		session.setAttribute("business", business);
		return "redirect:/getAccount.action";
	}

	/**
	 * 获取密码页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getPassword.action")
	public String getPassword() {

		return "business/business_password_message";
	}

	/**
	 * 更新密码
	 * 
	 * @param account
	 * @return
	 */
	@RequestMapping(value = "/updatePassword.action", method = RequestMethod.POST)
	@ResponseBody
	public int updatePassword(StorerAccountVo account) {

		int record;
		try {
			record = businessService.updateAccountPsw(account);
		} catch (Exception e) {
			// TODO: handle exception
			record = -1;
		}
		return record;
	}

	/**
	 * 去商店进驻
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toShopIn.action")
	public String toShopIn(Model model, HttpSession session) {
		List<ShopStyle> shopStyles = businessService.selectShopStyle();
		model.addAttribute("shopStyle", shopStyles);
		return "business/business_shopIn_shop";
	}

//	/**
//	 * 添加商店信息
//	 * 
//	 * @param businessCustom
//	 * @param model
//	 * @param request
//	 * @param response
//	 * @param session
//	 * @return
//	 */
//	@RequestMapping(value = "/shopIn.action", method = RequestMethod.POST)
//	public String addShop(BusinessCustom businessCustom, @RequestParam(value = "shopPic") MultipartFile shopPic,
//			HttpSession session) {
//
//		UploadImageUtil uImageUtil = new UploadImageUtil(shopPic);
//
//		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
//		int shopId;
//		try {
//			if (uImageUtil.getFileName() != null) {
//				businessCustom.getShop().setShopPic(uImageUtil.getFileName());// 图片
//			}
//			shopId = businessService.insertShop(businessCustom.getShop());
//			Shop shop = businessService.selectShopById(shopId);
//			business.setShop(shop);
//			if (shopId > 0) {
//				uImageUtil.saveToDisk();
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			shopId = -1;
//		}
//		session.setAttribute("business", business);
//		return "business/business_shopIn_shopData";
//	}
	
	/**
	 * 添加商店信息
	 * 
	 * @param businessCustom
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/shopIn.action", method = RequestMethod.POST)
	public String addShop(BusinessCustom businessCustom, @RequestParam(value = "shopPic") MultipartFile shopPic,
			HttpSession session) {

		UploadImageUtil uImageUtil = new UploadImageUtil(shopPic,session);

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
		int shopId;
		try {
			if (uImageUtil.getFileName() != null) {
				businessCustom.getShop().setShopPic(uImageUtil.getFileName());// 图片
			}
			shopId = businessService.insertShop(businessCustom.getShop());
			Shop shop = businessService.selectShopById(shopId);
			business.setShop(shop);
			if (shopId > 0) {
				uImageUtil.saveToDisk();
			}
		} catch (Exception e) {
			// TODO: handle exception
			shopId = -1;
		}
		session.setAttribute("business", business);
		return "business/business_shopIn_shopData";
	}

	/**
	 * 去完善审核资料
	 * 
	 * @return
	 */
	@RequestMapping(value = "/toShopDataIn.action")
	public String toShopDataIn(Model model, HttpSession session) {

		return "business/business_shopIn_shopData";
	}

//	/**
//	 * 更新商店审核资料
//	 * 
//	 * @param shopCustom
//	 * @return
//	 */
//	@RequestMapping(value = "/shopDataIn.action", method = RequestMethod.POST)
//	public String addShopData(ShopCustom shopCustom, @RequestParam(value = "outPic") MultipartFile outPic,
//			@RequestParam(value = "inPic") MultipartFile inPic,
//			@RequestParam(value = "serviceLicense") MultipartFile serviceLicense,
//			@RequestParam(value = "shopLicense") MultipartFile shopLicense,
//			@RequestParam(value = "ownerIdUpPic") MultipartFile ownerIdUpPic,
//			@RequestParam(value = "ownerIdDownPic") MultipartFile ownerIdDownPic, HttpSession session) {
//
//		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
//
//		UploadImageUtil uImageUtil1 = new UploadImageUtil(outPic);
//		UploadImageUtil uImageUtil2 = new UploadImageUtil(inPic);
//		UploadImageUtil uImageUtil3 = new UploadImageUtil(serviceLicense);
//		UploadImageUtil uImageUtil4 = new UploadImageUtil(shopLicense);
//		UploadImageUtil uImageUtil5 = new UploadImageUtil(ownerIdUpPic);
//		UploadImageUtil uImageUtil6 = new UploadImageUtil(ownerIdDownPic);
//		int record;
//		try {
//			if (uImageUtil1.getFileName() != null) {
//				shopCustom.getShopData().setOutPic(uImageUtil1.getFileName());// 图片
//			}
//			if (uImageUtil2.getFileName() != null) {
//				shopCustom.getShopData().setInPic(uImageUtil2.getFileName());// 图片
//			}
//			if (uImageUtil3.getFileName() != null) {
//				shopCustom.getShopData().setServiceLicense(uImageUtil3.getFileName());// 图片
//			}
//			if (uImageUtil4.getFileName() != null) {
//				shopCustom.getShopData().setShopLicense(uImageUtil4.getFileName());// 图片
//			}
//			if (uImageUtil5.getFileName() != null) {
//				shopCustom.getShopData().setOwnerIdUpPic(uImageUtil5.getFileName());// 图片
//			}
//			if (uImageUtil6.getFileName() != null) {
//				shopCustom.getShopData().setOwnerIdDownPic(uImageUtil6.getFileName());// 图片
//			}
//
//			record = businessService.insertShopDataByShopId(shopCustom.getShopData());
//
//			if (record > 0) {
//				uImageUtil1.saveToDisk();
//				uImageUtil2.saveToDisk();
//				uImageUtil3.saveToDisk();
//				uImageUtil4.saveToDisk();
//				uImageUtil5.saveToDisk();
//				uImageUtil6.saveToDisk();
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			record = -1;
//		}
//		return "business/business_addSuccess";
//	}
	
	/**
	 * 更新商店审核资料
	 * 
	 * @param shopCustom
	 * @return
	 */
	@RequestMapping(value = "/shopDataIn.action", method = RequestMethod.POST)
	public String addShopData(ShopCustom shopCustom, @RequestParam(value = "outPic") MultipartFile outPic,
			@RequestParam(value = "inPic") MultipartFile inPic,
			@RequestParam(value = "serviceLicense") MultipartFile serviceLicense,
			@RequestParam(value = "shopLicense") MultipartFile shopLicense,
			@RequestParam(value = "ownerIdUpPic") MultipartFile ownerIdUpPic,
			@RequestParam(value = "ownerIdDownPic") MultipartFile ownerIdDownPic, HttpSession session) {

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");

		UploadImageUtil uImageUtil1 = new UploadImageUtil(outPic,session);
		UploadImageUtil uImageUtil2 = new UploadImageUtil(inPic,session);
		UploadImageUtil uImageUtil3 = new UploadImageUtil(serviceLicense,session);
		UploadImageUtil uImageUtil4 = new UploadImageUtil(shopLicense,session);
		UploadImageUtil uImageUtil5 = new UploadImageUtil(ownerIdUpPic,session);
		UploadImageUtil uImageUtil6 = new UploadImageUtil(ownerIdDownPic,session);
		int record;
		try {
			if (uImageUtil1.getFileName() != null) {
				shopCustom.getShopData().setOutPic(uImageUtil1.getFileName());// 图片
			}
			if (uImageUtil2.getFileName() != null) {
				shopCustom.getShopData().setInPic(uImageUtil2.getFileName());// 图片
			}
			if (uImageUtil3.getFileName() != null) {
				shopCustom.getShopData().setServiceLicense(uImageUtil3.getFileName());// 图片
			}
			if (uImageUtil4.getFileName() != null) {
				shopCustom.getShopData().setShopLicense(uImageUtil4.getFileName());// 图片
			}
			if (uImageUtil5.getFileName() != null) {
				shopCustom.getShopData().setOwnerIdUpPic(uImageUtil5.getFileName());// 图片
			}
			if (uImageUtil6.getFileName() != null) {
				shopCustom.getShopData().setOwnerIdDownPic(uImageUtil6.getFileName());// 图片
			}

			record = businessService.insertShopDataByShopId(shopCustom.getShopData());

			if (record > 0) {
				uImageUtil1.saveToDisk();
				uImageUtil2.saveToDisk();
				uImageUtil3.saveToDisk();
				uImageUtil4.saveToDisk();
				uImageUtil5.saveToDisk();
				uImageUtil6.saveToDisk();
			}
		} catch (Exception e) {
			// TODO: handle exception
			record = -1;
		}
		return "business/business_addSuccess";
	}


	/**
	 * 获取商店信息页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/getShopMsg.action")
	public String getShopMsg(Model model, HttpSession session) {
		BusinessCustom businessCustom = (BusinessCustom) session.getAttribute("business");
		Shop shop = businessCustom.getShop();
		try {
			if (shop == null || shop.getAuditState() == 2) {
				if (shop!=null) {
					ShopData shopData = businessService.selectShopDataByShopId(shop.getId());
					if (shopData == null) {
						return "business/business_shop_message_noshop";
					}
					model.addAttribute("shopData", shopData);
				}
				return "business/business_shop_message_noshop";
			}
			
			List<ShopStyle> shopStyles = businessService.selectShopStyle();
			model.addAttribute("shopStyle", shopStyles);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "business/business_shop_message";
	}

//	/**
//	 * 更新商店
//	 * 
//	 * @param businessCustom
//	 * @param model
//	 * @param request
//	 * @param response
//	 * @param session
//	 * @return
//	 */
//	@RequestMapping(value = "/updateShop.action", method = RequestMethod.POST)
//	public String updateShop(BusinessCustom businessCustom, @RequestParam(value = "shopPic") MultipartFile shopPic,
//			HttpSession session) {
//		UploadImageUtil uImageUtil = new UploadImageUtil(shopPic);
//
//		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
//		int record;
//		try {
//			if (uImageUtil.getFileName() != null) {
//				businessCustom.getShop().setShopPic(uImageUtil.getFileName());// 图片
//			}
//			record = businessService.updateShopById(businessCustom.getShop());
//			Shop shop = businessService.selectShopById(businessCustom.getShop().getId());
//			business.setShop(shop);
//			if (record > 0) {
//				uImageUtil.saveToDisk();
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			record = -1;
//		}
//		session.setAttribute("business", business);
//		return "redirect:/getShopMsg.action";
//	}
	
	/**
	 * 更新商店
	 * 
	 * @param businessCustom
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/updateShop.action", method = RequestMethod.POST)
	public String updateShop(BusinessCustom businessCustom, @RequestParam(value = "shopPic") MultipartFile shopPic,
			HttpSession session) {
		UploadImageUtil uImageUtil = new UploadImageUtil(shopPic,session);

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
		int record;
		try {
			if (uImageUtil.getFileName() != null) {
				businessCustom.getShop().setShopPic(uImageUtil.getFileName());// 图片
			}
			record = businessService.updateShopById(businessCustom.getShop());
			Shop shop = businessService.selectShopById(businessCustom.getShop().getId());
			business.setShop(shop);
			if (record > 0) {
				uImageUtil.saveToDisk();
			}
		} catch (Exception e) {
			// TODO: handle exception
			record = -1;
		}
		session.setAttribute("business", business);
		return "redirect:/getShopMsg.action";
	}

	/**
	 * 获取商店审核信息
	 * 
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getShopData.action")
	public String getShopData(Model model, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {
		BusinessCustom businessCustom = (BusinessCustom) session.getAttribute("business");
		Shop shop = businessCustom.getShop();
		
		try {
			if (shop == null || shop.getAuditState() == 2) {
				return "business/business_shop_message_noshop";
			}else {
				ShopData shopData = businessService.selectShopDataByShopId(shop.getId());
				if (shopData == null) {
					model.addAttribute("shopData", shopData);
					return "business/business_shop_message_noshop";
				}
				model.addAttribute("shopData", shopData);
			}
			
//			model.addAttribute("shopData", shopData);
		} catch (Exception e) {
			// TODO: handle exception
//			System.out.println("");
			return "business/business_shop_message_noshop";
		}

		return "business/business_shopData_message";
	}

//	/**
//	 * 更新商店审核资料
//	 * 
//	 * @param shopCustom
//	 * @return
//	 */
//	@RequestMapping(value = "/updateShopData.action", method = RequestMethod.POST)
//	public String updateShopData(ShopCustom shopCustom, @RequestParam(value = "outPic") MultipartFile outPic,
//			@RequestParam(value = "inPic") MultipartFile inPic,
//			@RequestParam(value = "serviceLicense") MultipartFile serviceLicense,
//			@RequestParam(value = "shopLicense") MultipartFile shopLicense,
//			@RequestParam(value = "ownerIdUpPic") MultipartFile ownerIdUpPic,
//			@RequestParam(value = "ownerIdDownPic") MultipartFile ownerIdDownPic, HttpSession session) {
//
//		BusinessCustom business = (BusinessCustom) session.getAttribute("business");
//
//		UploadImageUtil uImageUtil1 = new UploadImageUtil(outPic);
//		UploadImageUtil uImageUtil2 = new UploadImageUtil(inPic);
//		UploadImageUtil uImageUtil3 = new UploadImageUtil(serviceLicense);
//		UploadImageUtil uImageUtil4 = new UploadImageUtil(shopLicense);
//		UploadImageUtil uImageUtil5 = new UploadImageUtil(ownerIdUpPic);
//		UploadImageUtil uImageUtil6 = new UploadImageUtil(ownerIdDownPic);
//		int record;
//		try {
//			if (uImageUtil1.getFileName() != null) {
//				shopCustom.getShopData().setOutPic(uImageUtil1.getFileName());// 图片
//			}
//			if (uImageUtil2.getFileName() != null) {
//				shopCustom.getShopData().setInPic(uImageUtil2.getFileName());// 图片
//			}
//			if (uImageUtil3.getFileName() != null) {
//				shopCustom.getShopData().setServiceLicense(uImageUtil3.getFileName());// 图片
//			}
//			if (uImageUtil4.getFileName() != null) {
//				shopCustom.getShopData().setShopLicense(uImageUtil4.getFileName());// 图片
//			}
//			if (uImageUtil5.getFileName() != null) {
//				shopCustom.getShopData().setOwnerIdUpPic(uImageUtil5.getFileName());// 图片
//			}
//			if (uImageUtil6.getFileName() != null) {
//				shopCustom.getShopData().setOwnerIdDownPic(uImageUtil6.getFileName());// 图片
//			}
//			record = businessService.updateShopDataByShopId(shopCustom.getShopData());
//
//			if (record > 0) {
//				uImageUtil1.saveToDisk();
//				uImageUtil2.saveToDisk();
//				uImageUtil3.saveToDisk();
//				uImageUtil4.saveToDisk();
//				uImageUtil5.saveToDisk();
//				uImageUtil6.saveToDisk();
//				Shop shop = businessService.selectShopById(business.getShop().getId());
//				business.setShop(shop);
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			record = -1;
//		}
//		return "redirect:/getShopData.action";
//	}
	
	/**
	 * 更新商店审核资料
	 * 
	 * @param shopCustom
	 * @return
	 */
	@RequestMapping(value = "/updateShopData.action", method = RequestMethod.POST)
	public String updateShopData(ShopCustom shopCustom, @RequestParam(value = "outPic") MultipartFile outPic,
			@RequestParam(value = "inPic") MultipartFile inPic,
			@RequestParam(value = "serviceLicense") MultipartFile serviceLicense,
			@RequestParam(value = "shopLicense") MultipartFile shopLicense,
			@RequestParam(value = "ownerIdUpPic") MultipartFile ownerIdUpPic,
			@RequestParam(value = "ownerIdDownPic") MultipartFile ownerIdDownPic, HttpSession session) {

		BusinessCustom business = (BusinessCustom) session.getAttribute("business");

		UploadImageUtil uImageUtil1 = new UploadImageUtil(outPic,session);
		UploadImageUtil uImageUtil2 = new UploadImageUtil(inPic,session);
		UploadImageUtil uImageUtil3 = new UploadImageUtil(serviceLicense,session);
		UploadImageUtil uImageUtil4 = new UploadImageUtil(shopLicense,session);
		UploadImageUtil uImageUtil5 = new UploadImageUtil(ownerIdUpPic,session);
		UploadImageUtil uImageUtil6 = new UploadImageUtil(ownerIdDownPic,session);
		int record;
		try {
			if (uImageUtil1.getFileName() != null) {
				shopCustom.getShopData().setOutPic(uImageUtil1.getFileName());// 图片
			}
			if (uImageUtil2.getFileName() != null) {
				shopCustom.getShopData().setInPic(uImageUtil2.getFileName());// 图片
			}
			if (uImageUtil3.getFileName() != null) {
				shopCustom.getShopData().setServiceLicense(uImageUtil3.getFileName());// 图片
			}
			if (uImageUtil4.getFileName() != null) {
				shopCustom.getShopData().setShopLicense(uImageUtil4.getFileName());// 图片
			}
			if (uImageUtil5.getFileName() != null) {
				shopCustom.getShopData().setOwnerIdUpPic(uImageUtil5.getFileName());// 图片
			}
			if (uImageUtil6.getFileName() != null) {
				shopCustom.getShopData().setOwnerIdDownPic(uImageUtil6.getFileName());// 图片
			}
			record = businessService.updateShopDataByShopId(shopCustom.getShopData());

			if (record > 0) {
				uImageUtil1.saveToDisk();
				uImageUtil2.saveToDisk();
				uImageUtil3.saveToDisk();
				uImageUtil4.saveToDisk();
				uImageUtil5.saveToDisk();
				uImageUtil6.saveToDisk();
				Shop shop = businessService.selectShopById(business.getShop().getId());
				business.setShop(shop);
			}
		} catch (Exception e) {
			// TODO: handle exception
			record = -1;
		}
		return "redirect:/getShopData.action";
	}
	
	/**
	 * 发送邮箱验证码
	 * @param emailTo
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/sendEmail.action", method = RequestMethod.POST)
	@ResponseBody
	public int sendEmail(String emailTo,HttpSession session){
		String checkCode = String.valueOf(Math.random()*99999);
		int state;
		try {
			MailUtil.send_mail(emailTo, checkCode);
			state = 1;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			state = -1;
		}
		session.setAttribute("emailCheckCode", checkCode);
		return state;
	}
	
	/**
	 * 绑定邮箱
	 * @param emailTo
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/changeEmail.action", method = RequestMethod.POST)
	@ResponseBody
	public int changeEmail(String checkCode,StorerAccount account,HttpSession session){
		BusinessCustom businessCustom = (BusinessCustom) session.getAttribute("business");
		String code = (String) session.getAttribute("emailCheckCode");
		int state = 0;
		try {
			if (checkCode == code) {
				state = businessService.updateAccontEmail(account);
			}
			StorerAccount storerAccount = businessService.selectAccountById(account.getId());
			businessCustom.setStorerAccount(storerAccount);
			session.setAttribute("business", businessCustom);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			state = -1;
		}
		return state;
	}
	
	/**
	 * 商家登录进入首页时获取信息
	 * 
	 * @param id
	 * @param business
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/getBusiness.action")
	public String getBusiness(Model model, BusinessCustom business, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		StorerAccount account = (StorerAccount) session.getAttribute("storerAccount");
		
		String record;
		try {
			StorerAccount storerAccount = businessService.selectAccountById(account.getId());
			if (storerAccount == null) {
				return "user/storer_login_register";
			}
			Shop shop = businessService.selectShopByAccountId(account.getId());

			business.setStorerAccount(account);
			session.setAttribute("business", business);
			if (shop == null || shop.getAuditState() == 2) {
				if (shop!=null) {
					business.setShop(shop);
					ShopData shopData = businessService.selectShopDataByShopId(shop.getId());
					if (shopData == null) {
						return "business/business_noshopOrwaitingaudit";
					}
					List<Ordertable> ordertables = businessService.seleteOrderByShopId(shop.getId());
					model.addAttribute("shopData", shopData);
					model.addAttribute("ordersList", ordertables);//订单
				}
				return "business/business_noshopOrwaitingaudit";// 没有商店或待审核或审核失败
			}
			business.setShop(shop);
			ShopData shopData = businessService.selectShopDataByShopId(shop.getId());
			// business.setGoods(goods);
			if (shopData == null) {
				return "business/business_noshopOrwaitingaudit";
			}
			List<Ordertable> ordertables = businessService.seleteOrderByShopId(shop.getId());
			model.addAttribute("ordersList", ordertables);//订单
			model.addAttribute("shopData", shopData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			record = "101";
			return "business/business_error";
		}

		return "business/business_order_List";
	}

	
	//退出登录
		@RequestMapping(value="/StorerLogout.action")
		public String StorerLogout(HttpSession session) throws Exception{
			session.invalidate();
			return "user/storer_login_register";
		}
}

/**
 * 
 */
package com.chihuobao.vo;

import java.util.Date;
import java.util.List;

import com.chihuobao.po.GoodsStyle;
import com.chihuobao.po.Goods;

/**
 * @description 商品自定义类
 * @author 王锦海
 * @date 2017年12月5日
 * @version 1.0
 */
public class GoodsCustom extends Goods{
	 	
		private Goods goods;
	
	    private GoodsStyle goodStyle;

	    private GoodsCustom goodsCustom;
	    
		private List<GoodsStyle> goodStyles;
		
		private GoodsCustom goodCounts;
		

		public GoodsCustom getGoodCounts() {
			return goodCounts;
		}

		public void setGoodCounts(GoodsCustom goodCounts) {
			this.goodCounts = goodCounts;
		}

		public Goods getGoods() {
			return goods;
		}

		public void setGoods(Goods goods) {
			this.goods = goods;
		}

		public GoodsCustom getGoodsCustom() {
			return goodsCustom;
		}

		public void setGoodsCustom(GoodsCustom goodsCustom) {
			this.goodsCustom = goodsCustom;
		}

		public List<GoodsStyle> getGoodStyles() {
			return goodStyles;
		}

		public void setGoodStyles(List<GoodsStyle> goodStyles) {
			this.goodStyles = goodStyles;
		}

	    public GoodsStyle getGoodStyle() {
			return goodStyle;
		}

		public void setGoodStyle(GoodsStyle goodStyle) {
			this.goodStyle = goodStyle;
		}

}

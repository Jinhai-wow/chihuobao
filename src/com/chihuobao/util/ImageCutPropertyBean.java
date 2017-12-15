package com.chihuobao.util;

import java.math.BigDecimal;

/**
 * 头像裁剪时的相关数据
 * @author  陈志杰
 * 
 */
public class ImageCutPropertyBean {

	private int x;
	private int y;
	private int w;
	private int h;
	private String oldImgPath;

	
	
	public String getOldImgPath() {
		return oldImgPath;
	}

	public void setOldImgPath(String oldImgPath) {
		this.oldImgPath = oldImgPath;
	}

	public int getX() {
		return x;
	}

	public void setX(String x) {
		this.x = obtainImageSize(x);
	}

	public int getY() {
		return y;
	}

	public void setY(String y) {
		this.y = obtainImageSize(y);
	}

	public int getW() {
		return w;
	}

	public void setW(String w) {
		this.w = obtainImageSize(w);
	}

	public int getH() {
		return h;
	}

	public void setH(String h) {
		this.h = obtainImageSize(h);
	}


	//
	private int obtainImageSize(String value) {
		return new BigDecimal(value).setScale(0, BigDecimal.ROUND_HALF_UP)
				.intValue();
	}

}

package com.chihuobao.vo;

import com.chihuobao.po.StorerAccount;

public class StorerAccountEx extends StorerAccount{
	
	public String captcha;     //验证码

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	
}

package com.chihuobao.vo;
/**
 * 用来获取从地图页面过来的JSON数据
 * @author 何煜华
 *
 */

public class GetUserLngAndLatVo {
	private Double lat;
	private Double lng;
	private Integer range;
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public Integer getRange() {
		return range;
	}
	public void setRange(Integer range) {
		this.range = range;
	}
	@Override
	public String toString() {
		return "GetUserLngAndLatVo [lat=" + lat + ", lng=" + lng + ", range=" + range + "]";
	}
	
}

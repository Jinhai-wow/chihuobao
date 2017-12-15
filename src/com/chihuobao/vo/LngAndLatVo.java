package com.chihuobao.vo;
/**
 * 用来查找10公里内的商家
 * @author 何煜华
 *
 */

public class LngAndLatVo {

	private Double lng;
	private Double lat;
	private Double rangeLng;
	private Double rangeLat;
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getRangeLng() {
		return rangeLng;
	}
	public void setRangeLng(Double rangeLng) {
		this.rangeLng = rangeLng;
	}
	public Double getRangeLat() {
		return rangeLat;
	}
	public void setRangeLat(Double rangeLat) {
		this.rangeLat = rangeLat;
	}
	@Override
	public String toString() {
		return "LngAndLatVo [lng=" + lng + ", lat=" + lat + ", rangeLng=" + rangeLng + ", rangeLat=" + rangeLat + "]";
	}
}

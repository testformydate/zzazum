package com.mydate.zzazum.location.vo;

public class LocationVo {
	private int p_id;
	private String p_name, p_category, p_addr, p_image;
	private Double p_lng, p_lat;
	

	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public int getP_no() {
		return p_id;
	}
	public void setP_no(int p_id) {
		this.p_id = p_id;
	}
	public Double getP_lat() {
		return p_lat;
	}
	public void setP_lat(Double p_lat) {
		this.p_lat = p_lat;
	}
	public Double getP_lng() {
		return p_lng;
	}
	public void setP_lng(Double p_lng) {
		this.p_lng = p_lng;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getP_addr() {
		return p_addr;
	}
	public void setP_addr(String p_addr) {
		this.p_addr = p_addr;
	}
}

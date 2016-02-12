package com.mydate.zzazum.postscript.vo;

public class PostScriptDetail {
	private int pd_no, ps_no, pd_like;
	private String pd_email, pd_location, pd_context, pd_date, pd_image, mem_primg, mem_nick;
	public int getPd_no() {
		return pd_no;
	}
	
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_primg() {
		return mem_primg;
	}
	public void setMem_primg(String mem_primg) {
		this.mem_primg = mem_primg;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
	public int getPs_no() {
		return ps_no;
	}
	public void setPs_no(int ps_no) {
		this.ps_no = ps_no;
	}
	public int getPd_like() {
		return pd_like;
	}
	public void setPd_like(int pd_like) {
		this.pd_like = pd_like;
	}
	public String getPd_email() {
		return pd_email;
	}
	public void setPd_email(String pd_email) {
		this.pd_email = pd_email;
	}
	public String getPd_location() {
		return pd_location;
	}
	public void setPd_location(String pd_location) {
		this.pd_location = pd_location;
	}
	public String getPd_context() {
		return pd_context;
	}
	public void setPd_context(String pd_context) {
		this.pd_context = pd_context;
	}
	public String getPd_date() {
		return pd_date;
	}
	public void setPd_date(String pd_date) {
		this.pd_date = pd_date;
	}
	public String getPd_image() {
		return pd_image;
	}
	public void setPd_image(String pd_image) {
		this.pd_image = pd_image;
	}
}

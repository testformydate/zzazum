package com.mydate.zzazum.postscript.vo;

public class PostScriptLike {
	private String mem_id;
	private int ps_no, pd_no, likeVal;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getPs_no() {
		return ps_no;
	}
	public int getLikeVal() {
		return likeVal;
	}
	public void setLikeVal(int likeVal) {
		this.likeVal = likeVal;
	}
	public void setPs_no(int ps_no) {
		this.ps_no = ps_no;
	}
	public int getPd_no() {
		return pd_no;
	}
	public void setPd_no(int pd_no) {
		this.pd_no = pd_no;
	}
}

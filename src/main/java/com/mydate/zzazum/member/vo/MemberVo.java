package com.mydate.zzazum.member.vo;

import org.springframework.stereotype.Component;

@Component
public class MemberVo {

	private int mem_no;
	private String mem_id;
	private String mem_nick;
	private String mem_pw;
	private String mem_tel;
	private String mem_bhday;
	private String mem_primg;
	private String mem_love;
	
	public String getMem_love() {
		return mem_love;
	}
	public void setMem_love(String mem_love) {
		this.mem_love = mem_love;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_bhday() {
		return mem_bhday;
	}
	public void setMem_bhday(String mem_bhday) {
		this.mem_bhday = mem_bhday;
	}
	public String getMem_primg() {
		return mem_primg;
	}
	public void setMem_primg(String mem_primg) {
		this.mem_primg = mem_primg;
	}
	
}

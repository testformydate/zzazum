package com.mydate.zzazum.postscript.vo;

import org.springframework.stereotype.Component;

@Component
public class PostScriptList {
	private String ps_email, ps_location, ps_date, ps_image, ps_title, ps_context, mem_primg,  ps_clike;
	private int ps_no, ps_psno, ps_hour, ps_like, ps_hits, track_Num, track_Count, ps_clip;
	
	
	public int getPs_clip() {
		return ps_clip;
	}
	public void setPs_clip(int ps_clip) {
		this.ps_clip = ps_clip;
	}
	public String getPs_clike() {
		return ps_clike;
	}
	public void setPs_clike(String ps_clike) {
		this.ps_clike = ps_clike;
	}
	public int getTrack_Num() {
		return track_Num;
	}
	public void setTrack_Num(int track_Num) {
		this.track_Num = track_Num;
	}
	public int getTrack_Count() {
		return track_Count;
	}
	public void setTrack_Count(int track_Count) {
		this.track_Count = track_Count;
	}
	public String getMem_primg() {
		return mem_primg;
	}
	public void setMem_primg(String mem_primg) {
		this.mem_primg = mem_primg;
	}
	public String getPs_email() {
		return ps_email;
	}
	public void setPs_email(String ps_email) {
		this.ps_email = ps_email;
	}
	public String getPs_location() {
		return ps_location;
	}
	public void setPs_location(String ps_location) {
		this.ps_location = ps_location;
	}
	public String getPs_date() {
		return ps_date;
	}
	public void setPs_date(String ps_date) {
		this.ps_date = ps_date;
	}
	public String getPs_image() {
		return ps_image;
	}
	public void setPs_image(String ps_image) {
		this.ps_image = ps_image;
	}
	public String getPs_title() {
		return ps_title;
	}
	public void setPs_title(String ps_title) {
		this.ps_title = ps_title;
	}
	public String getPs_context() {
		return ps_context;
	}
	public void setPs_context(String ps_context) {
		this.ps_context = ps_context;
	}
	public int getPs_no() {
		return ps_no;
	}
	public void setPs_no(int ps_no) {
		this.ps_no = ps_no;
	}
	public int getPs_psno() {
		return ps_psno;
	}
	public void setPs_psno(int ps_psno) {
		this.ps_psno = ps_psno;
	}
	public int getPs_hour() {
		return ps_hour;
	}
	public void setPs_hour(int ps_hour) {
		this.ps_hour = ps_hour;
	}
	public int getPs_like() {
		return ps_like;
	}
	public void setPs_like(int ps_like) {
		this.ps_like = ps_like;
	}
	public int getPs_hits() {
		return ps_hits;
	}
	public void setPs_hits(int ps_hits) {
		this.ps_hits = ps_hits;
	}
}

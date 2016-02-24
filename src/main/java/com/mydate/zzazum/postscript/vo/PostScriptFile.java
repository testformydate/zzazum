package com.mydate.zzazum.postscript.vo;

import org.springframework.web.multipart.MultipartFile;

public class PostScriptFile {
	private int pf_no;
	private String pf_name, pf_email;
	private MultipartFile[] pd_images;
	
	public int getPf_no() {
		return pf_no;
	}
	public void setPf_no(int pf_no) {
		this.pf_no = pf_no;
	}
	public String getPf_name() {
		return pf_name;
	}
	public void setPf_name(String pf_name) {
		this.pf_name = pf_name;
	}
	public MultipartFile[] getPd_images() {
		return pd_images;
	}
	public void setPd_images(MultipartFile[] pd_images) {
		this.pd_images = pd_images;
	}
	public String getPf_email() {
		return pf_email;
	}
	public void setPf_email(String pf_email) {
		this.pf_email = pf_email;
	}
	
}

package com.mydate.zzazum.member.repository;

import com.mydate.zzazum.member.vo.MemberVo;

public interface MemberInter {
	boolean memberIns(MemberVo memberVo);
	MemberVo memberLog(MemberVo memberVo);
	int memberUp(MemberVo memberVo);
	int memberDel(String mem_id);
	MemberVo memberInfo(String mem_id);
	boolean memberModify(MemberVo member);
	int loginAuthentication(String mem_hash);
	public String idChecker(String mem_id);
	public String nameChecker(String mem_nick);
	public String logChecker(MemberVo memberVo);
	/*boolean memberDel(String mem_id);*/
}

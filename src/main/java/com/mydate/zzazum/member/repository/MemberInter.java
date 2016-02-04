package com.mydate.zzazum.member.repository;

import com.mydate.zzazum.member.vo.MemberVo;

public interface MemberInter {
	boolean memberJoin(MemberVo memberVo);
	MemberVo memberInfo(String mem_id);
	boolean memberModify(MemberVo member);
	boolean memberDel(String mem_id);
}

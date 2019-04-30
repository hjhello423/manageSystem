package com.manage.app.member.service;

import com.manage.app.member.repository.Member;

public interface IMemberService {
    void memberRegister(Member member);
    Member memberSearch(String memId, String memPw);
    void memberRemove();
	boolean memberModify(Member member);
}

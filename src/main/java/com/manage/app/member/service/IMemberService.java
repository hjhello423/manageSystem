package com.manage.app.member.service;

import com.manage.app.member.Member;

public interface IMemberService {
    void memberRegister(Member member);
    Member memberSearch(String memId, String memPw);
    void memberModify();
    void memberRemove();
}

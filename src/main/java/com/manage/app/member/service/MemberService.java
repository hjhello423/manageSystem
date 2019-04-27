package com.manage.app.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.manage.app.member.Member;


@Service
public class MemberService implements IMemberService {

	@Autowired
	com.manage.app.member.dao.MemberDao dao;
	
	@Override
	public void memberRegister(Member member) {
		System.out.println("memberRegister()");
		
		dao.memberInsert(member);
	}

	@Override
	public Member memberSearch(String memId, String memPw) {
		System.out.println("memberSearch()");
		System.out.println("memId : " + memId);
		System.out.println("memPw : " + memPw);
		
		Member member = dao.memberSelect(memId, memPw);
		
		return member;
	}

	@Override
	public void memberModify() {
		
	}

	@Override
	public void memberRemove() {
		
	}

}
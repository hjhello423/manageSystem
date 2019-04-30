package com.manage.app.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.manage.app.LoginInterceptor;
import com.manage.app.repository.Member;
import com.manage.app.repository.MemberRepository;

import javassist.NotFoundException;

@Service
public class MemberService implements IMemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	
	@Autowired
	private MemberRepository memberRepository;

	@Transactional
	@Override
	public void memberRegister(Member member) {
		logger.info("요청 멤버 정보 : " + member.toString());

		Member mem = memberRepository.saveAndFlush(member);

		if (mem == null) {
			logger.warn("계정 등록 실패 - null");
		}
	}

	@Transactional
	@Override
	public Member memberSearch(String memId, String memPw) {
		Member member = null;

		try {
			member = memberRepository.findByMemIdAndMemPw(memId, memPw);
			logger.info(member.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}

	@Override
	public boolean memberModify(Member member) {
		String id = member.getMemId();
		Member mem = memberRepository.findByMemId(id);
		if (mem == null) {
			return false;
		}
		mem.setMemPw(member.getMemPw());
		mem.setMemName(member.getMemName());
		mem.setMemMail(member.getMemMail());

		memberRepository.saveAndFlush(mem);

		return true;
	}

	@Override
	public void memberRemove() {

	}

}
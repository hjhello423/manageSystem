package com.manage.app.member.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.manage.app.MemberDB;
import com.manage.app.member.Member;

@Component
//@Repository
public class MemberDao implements IMemberDao {

	private static HashMap<String, Member> dbMap;


	@PostConstruct
	public void initPool() {
	}
	
	@PreDestroy
	public void destroyPool() {
	}

	public MemberDao() {
//		dbMap = new HashMap<String, Member>();
	}

	@Override
	public void memberInsert(String memId, String memPw, String memMail, String memPhone1, String memPhone2,
			String memPhone3) {
		System.out.println("memberInsert()");
		System.out.println("memId : " + memId);
		System.out.println("memPw : " + memPw);
		System.out.println("memMail : " + memMail);
		System.out.println("memPhone : " + memPhone1 + " - " + memPhone2 + " - " + memPhone3);

		Member member = new Member();
		member.setMemId(memId);
		member.setMemPw(memPw);
		member.setMemMail(memMail);

		dbMap.put(memId, member);

		Set<String> keys = dbMap.keySet();
		Iterator<String> iterator = keys.iterator();

		while (iterator.hasNext()) {
			String key = iterator.next();
			Member mem = dbMap.get(key);
			System.out.print("memberId:" + mem.getMemId() + "\t");
			System.out.print("|memberPw:" + mem.getMemPw() + "\t");
			System.out.print("|memberMail:" + mem.getMemMail() + "\t");
		}

	}

	@Override
	public Member memberSelect(String memId, String memPw) {

		Member member = null;
		
		HashMap<String, Member> data = MemberDB.getInstance().getData();
		Iterator<String> itr = data.keySet().iterator();
		
		while (itr.hasNext()) {
			String key = itr.next();
			if (key.equals(memId)) {
				member = data.get(key);
				break;
			}
		}

		return member;
	}

	@Override
	public void memberUpdate() {

	}

	@Override
	public void memberDelete() {

	}

}
package com.manage.app.member.dao;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.manage.app.MemberDB;
import com.manage.app.member.repository.Member;
import com.manage.app.member.repository.MemberRepository;

//@Component
@Repository
public class MemberDao implements IMemberDao {

	private static HashMap<String, Member> dbMap;

//	@Autowired
//	MemberRepository memberRepository;

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
	public void memberInsert(Member member) {
		System.out.println("memberInsert()");

		try {
			MemberDB conn = MemberDB.getInstance();
			HashMap<String, Member> db = conn.getData();
			db.put(member.getMemId(), member);

			conn.setData(db);
		} catch (Exception e) {
			System.out.println("exception 처리");
			e.printStackTrace();
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
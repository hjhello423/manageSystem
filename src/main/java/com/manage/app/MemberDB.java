package com.manage.app;

import java.io.ObjectInputStream.GetField;
import java.util.HashMap;
import java.util.Random;

import com.manage.app.repository.Member;

public class MemberDB {

	private static MemberDB instance = new MemberDB();
	private HashMap<String, Member> data = new HashMap<String, Member>();

	private MemberDB() {
		makeData();
	}

	public static MemberDB getInstance() {
		return instance;
	}

	private void makeData() {
		for (int i = 11; i < 20; i++) {
			Member tmp = new Member();
			tmp.setMemId(String.valueOf(i));
			tmp.setMemPw(String.valueOf(i));
			tmp.setMemMail(i + "@mail.com");
			tmp.setMemName(i + "이름");
			tmp.setMemQualify(new Random().nextInt(4 - 1 + 1) + 1);

			data.put(String.valueOf(i), tmp);
		}
	}

	public HashMap<String, Member> getData() {
		return data;
	}

	public void setData(HashMap<String, Member> data) {
		data = data;
	}
}

package com.manage.app.member;

import java.lang.annotation.Native;
import java.util.HashMap;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Member {
	@NotEmpty(message = "필수 사항 입니다.")
	@Length(max = 10, min = 2, message = "2~10글자 입력.")
    private String memId;
	@NotEmpty(message = "필수 사항 입니다.")
	@Length(max = 10, min = 2, message = "2~10글자 입력.")
    private String memPw;
	@Email(message = "잘못된 e-mail 주소 입니다.")
    private String memMail;
	@Length(max = 5, min = 2, message = "2~5글자 입력.")
    private String memName;
    private int memQualify = 3;

    public Member() {
	}
    
	public Member(String memId, String memPw, String memMail, String memName) {
		this.memId = memId;
		this.memPw = memPw;
		this.memMail = memMail;
		this.memName = memName;
	}
	
	public Member(HashMap<String, String> member) {
		this.memId = member.get("memId");
		this.memPw = member.get("memPw");
		this.memMail = member.get("memMail");
		this.memName = member.get("memName");
	}

	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemMail() {
		return memMail;
	}
	public void setMemMail(String memMail) {
		this.memMail = memMail;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getMemQualify() {
		return memQualify;
	}
	public void setMemQualify(int memQualify) {
		this.memQualify = memQualify;
	}
}

package com.manage.app.repository;

import java.lang.annotation.Native;
import java.util.HashMap;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "member")
public class Member {
	@Id
	
	@Column(name = "id")
	private String memId;

	@Column(name = "pwd")
	private String memPw;

	@Column(name = "mail")
	private String memMail;

	@Column(name = "name")
	private String memName;

	@Column(name = "mem_qualify")
	private int memQualify = 3;

	public Member() {
	}

	public Member(String memId, String memPw, String memMail, String memName, int memQualify) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memMail = memMail;
		this.memName = memName;
		this.memQualify = memQualify;
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

	@Override
	public String toString() {
		return "Member [memId=" + memId + ", memPw=" + memPw + ", memMail=" + memMail + ", memName=" + memName
				+ ", memQualify=" + memQualify + "]";
	}

}

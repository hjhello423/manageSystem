package com.manage.app.member;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class RequestMemberDto {

	@NotEmpty
	@Length(min = 2, max = 10)
	private String memId;

	@NotEmpty
	@Length(min = 2, max = 10)
	private String memPw;

	@Length(min = 2, max = 18)
	private String memMail;

	@NotEmpty
	@Length(min = 2, max = 5)
	private String memName;

	private int memQualify = 3;

	public RequestMemberDto() {
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

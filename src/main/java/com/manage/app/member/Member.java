package com.manage.app.member;

public class Member {
    private String memId;
    private String memPw;
    private String memMail;
    private String memName;
    private int memQualify = 3;

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

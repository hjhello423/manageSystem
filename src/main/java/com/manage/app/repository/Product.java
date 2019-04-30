package com.manage.app.repository;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {
	@Id
	@Column(name = "serial")
	private String serial;

	@Column(name = "license")
	private String license;

	@Column(name = "regDate")
	private Date regDate;

	@Column(name = "endDate")
	private Date endDate;

	@ManyToOne(targetEntity = Member.class)
	@JoinColumn(name = "register")
	private Member register;

	public Product() {
		super();
	}

	public String getSerial() {
		return serial;
	}

	public void setSerial(String serial) {
		this.serial = serial;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Member getRegister() {
		return register;
	}

	public void setRegister(Member register) {
		this.register = register;
	}

	@Override
	public String toString() {
		return "Product [serial=" + serial + ", license=" + license + ", regDate=" + regDate + ", endDate=" + endDate
				+ ", register=" + register + "]";
	}

}

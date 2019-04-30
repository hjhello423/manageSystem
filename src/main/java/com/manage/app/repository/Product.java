package com.manage.app.repository;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

	@Column(name = "nation")
	private String nation;

	@Column(name = "mac")
	private String mac;

	@Column(name = "os")
	private String os;

	@Column(name = "model_line")
	private String modelLine;

	@Column(name = "model")
	private String model;

	@Column(name = "sale")
	private String sale;

	@Column(name = "regDate")
	private Date regDate;

	@ManyToOne
	@JoinColumn(name = "register")
	private Member mem;

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

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getModelLine() {
		return modelLine;
	}

	public void setModelLine(String modelLine) {
		this.modelLine = modelLine;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getSale() {
		return sale;
	}

	public void setSale(String sale) {
		this.sale = sale;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Member getMem() {
		return mem;
	}

	public void setMem(Member mem) {
		this.mem = mem;
	}

	@Override
	public String toString() {
		return "Product [serial=" + serial + ", license=" + license + ", nation=" + nation + ", mac=" + mac + ", os="
				+ os + ", modelLine=" + modelLine + ", model=" + model + ", sale=" + sale + ", regDate=" + regDate
				+ ", mem=" + mem + "]";
	}

	public String getSha256(String str) {

		StringBuffer buf = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(str.getBytes());

			byte[] msgStr = md.digest();
			for (int i = 0; i < msgStr.length; i++) {
				byte tmpStrByte = msgStr[i];
				String tmpEncTxt = Integer.toString((tmpStrByte & 0xff) + 0x100, 16).substring(1);

				
				buf.append(tmpEncTxt);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return buf.toString();
	}

}

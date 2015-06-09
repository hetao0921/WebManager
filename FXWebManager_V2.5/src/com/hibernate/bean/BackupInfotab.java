package com.hibernate.bean;

/**
 * BackupInfotab entity. @author MyEclipse Persistence Tools
 */

public class BackupInfotab implements java.io.Serializable {

	// Fields

	private String centerIp;
	private String centerName;
	private String centerId;
	private String flag;
	private String status;

	// Constructors

	/** default constructor */
	public BackupInfotab() {
	}

	/** minimal constructor */
	public BackupInfotab(String centerIp, String flag, String status) {
		this.centerIp = centerIp;
		this.flag = flag;
		this.status = status;
	}

	/** full constructor */
	public BackupInfotab(String centerIp, String centerName, String centerId,
			String flag, String status) {
		this.centerIp = centerIp;
		this.centerName = centerName;
		this.centerId = centerId;
		this.flag = flag;
		this.status = status;
	}

	// Property accessors

	public String getCenterIp() {
		return this.centerIp;
	}

	public void setCenterIp(String centerIp) {
		this.centerIp = centerIp;
	}

	public String getCenterName() {
		return this.centerName;
	}

	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}

	public String getCenterId() {
		return this.centerId;
	}

	public void setCenterId(String centerId) {
		this.centerId = centerId;
	}

	public String getFlag() {
		return this.flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
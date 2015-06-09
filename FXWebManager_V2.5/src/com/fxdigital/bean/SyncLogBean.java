package com.fxdigital.bean;

public class SyncLogBean implements DataRow{
	
	private String centerid;
	private String centername;
	private String operatetime;
	private String operate;
	private String operateinfo;
	private String errorinfo;
	
	public String getCenterid() {
		return centerid;
	}
	public void setCenterid(String centerid) {
		this.centerid = centerid;
	}
	public String getCentername() {
		return centername;
	}
	public void setCentername(String centername) {
		this.centername = centername;
	}
	public String getOperatetime() {
		return operatetime;
	}
	public void setOperatetime(String operatetime) {
		this.operatetime = operatetime;
	}
	public String getOperate() {
		return operate;
	}
	public void setOperate(String operate) {
		this.operate = operate;
	}
	public String getOperateinfo() {
		return operateinfo;
	}
	public void setOperateinfo(String operateinfo) {
		this.operateinfo = operateinfo;
	}
	public String getErrorinfo() {
		return errorinfo;
	}
	public void setErrorinfo(String errorinfo) {
		this.errorinfo = errorinfo;
	}
	
}

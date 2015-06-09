package com.fxdigital.bean;

import com.alibaba.fastjson.JSONObject;
import com.pojo.Hikmatrix;

public class HikmatrixExt extends Hikmatrix{
	private Hikmatrix hikmatrix;
	
	public HikmatrixExt(Hikmatrix hx){
		this.hikmatrix = hx;
	}

	@Override
	public String getAddress() {
		// TODO Auto-generated method stub
		return hikmatrix.getAddress();
	}

	@Override
	public String getAdmin() {
		// TODO Auto-generated method stub
		return hikmatrix.getAdmin();
	}

	@Override
	public String getClassType() {
		// TODO Auto-generated method stub
		return hikmatrix.getClassType();
	}

	@Override
	public String getDeviceId() {
		// TODO Auto-generated method stub
		return hikmatrix.getDeviceId();
	}

	@Override
	public String getDeviceType() {
		// TODO Auto-generated method stub
		return hikmatrix.getDeviceType();
	}

	@Override
	public int getOutmodel() {
		// TODO Auto-generated method stub
		return hikmatrix.getOutmodel();
	}

	@Override
	public String getPass() {
		// TODO Auto-generated method stub
		return hikmatrix.getPass();
	}

	@Override
	public int getPort() {
		// TODO Auto-generated method stub
		return hikmatrix.getPort();
	}
	
	public String getDeviceTypev() {
		if(hikmatrix.getClassType().equals("HIKHD6408")){
			return "FXH6408";
		}else{
			return hikmatrix.getClassType();
		}
	}
	public static void main(String[] args) {
		HikmatrixExt hm=new HikmatrixExt(new Hikmatrix());
		System.out.println(JSONObject.toJSONString(hm));
	}
}

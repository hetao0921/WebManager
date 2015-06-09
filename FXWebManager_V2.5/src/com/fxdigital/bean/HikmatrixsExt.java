package com.fxdigital.bean;

import java.util.ArrayList;
import java.util.List;

import com.pojo.Hikmatrix;
import com.pojo.Hikmatrixs;

public class HikmatrixsExt extends Hikmatrixs{
	private Hikmatrixs hikmatrixs;
	public HikmatrixsExt(Hikmatrixs hm){
		this.hikmatrixs = hm;
	}
	@Override
	public List<Hikmatrix> getList() {
		List<Hikmatrix> list= new ArrayList<Hikmatrix>();
		
		for(Hikmatrix hx:hikmatrixs.getList()) {
			list.add(new HikmatrixExt(hx));
		}
		
		return list;
	}
	
}

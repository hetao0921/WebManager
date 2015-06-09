package com.fxdigital.db.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.hibernate.db.ConnDo;

@Component
public class IncrementdataInfotabDao {
	
	
	public static  IncrementdataInfotabDao incrementdataInfotabDao= null;
	/**
	 * 实例化对象
	 * 
	 */
	public static IncrementdataInfotabDao getInstance() {
		if (null == incrementdataInfotabDao) {
			incrementdataInfotabDao = new IncrementdataInfotabDao();
		}
		return incrementdataInfotabDao;
	}
	
	public List<Map<String, Object>> queryIncrementData(){
		String hql = "from IncrementdataInfotab order by id asc";
		return ConnDo.getConnDo().executeQueryToObjectList(hql);
	}
	
	public int deleteIncrementdataID(String id){
		
		String sql = "delete from IncrementdataInfotab where id='"+id+"'";
		return ConnDo.getConnDo().executeUpdate(sql);
	}
}

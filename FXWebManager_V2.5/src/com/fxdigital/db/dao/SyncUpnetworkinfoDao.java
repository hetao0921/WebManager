package com.fxdigital.db.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fxdigital.manager.LocalCenter;
import com.hibernate.bean.SyncSubapply;
import com.hibernate.bean.SyncUpnetworkinfo;
import com.hibernate.db.ConnDo;
import com.hibernate.db.ConvertMapUtil;


@Repository
public class SyncUpnetworkinfoDao {
	
	
	@SuppressWarnings("unchecked")
	public SyncUpnetworkinfo query() {
		String map = ConvertMapUtil.map(SyncSubapply.class);
		String sql = "from SyncUpnetworkinfo";
		List<Map<String, Object>> list = ConnDo.getConnDo()
				.executeQueryToObjectList(sql);
		if (list != null && list.size() > 0) {
			Map<String, Object> data = (Map<String, Object>) list.get(0);
			SyncUpnetworkinfo syncUpnetworkinfo = new SyncUpnetworkinfo();
			syncUpnetworkinfo.setSubId(data.get("subId").toString());
			syncUpnetworkinfo.setSubIp(data.get("subIp").toString());
			syncUpnetworkinfo.setSubPort(Integer.valueOf((null==data.get("subPort").toString()||data.get("subPort").equals(""))?"0":data.get("subPort").toString()));
			syncUpnetworkinfo.setSupIp(data.get("supIp").toString());
			syncUpnetworkinfo.setSupPort(Integer.valueOf((null==data.get("supPort").toString()||data.get("supPort").equals(""))?"0":data.get("supPort").toString()));
			return syncUpnetworkinfo;
		} else {
			return null;
		}
	}
	
	
//	public int update(String centerid){
//		String sql = "update SyncUpnetworkinfo set status="+int_status+" where mqIp='"+ip+"' and applyTime='"+time+"'";
//		ConnDo.getConnDo().executeUpdate(sql);
//		return 1;
//	}
	
	
	public int save(SyncUpnetworkinfo syncUpnetworkinfo){
		
		ConnDo.getConnDo().save(syncUpnetworkinfo);
		return 1;
	}	
	
	
	public int deleteRecord(){
		String sql = "delete from SyncUpnetworkinfo";
		return ConnDo.getConnDo().executeUpdate(sql);
	}
}

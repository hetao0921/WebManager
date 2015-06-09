package com.fxdigital.db.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.fxdigital.bean.SyncLogBean;
import com.hibernate.db.ConnDo;
import com.hibernate.db.Database;
import com.hibernate.db.HibernateConn;
import com.mysql.jdbc.StringUtils;

@Component
public class SyncLogDao {
	
	private HibernateConn conn;
	
	@PostConstruct
	public void init(){
		conn = new HibernateConn(Database.jms_client);
	}
	
	public long query(String start, String end, String centerid){
		StringBuilder hql = new StringBuilder(
				"select new Map(count(*) as num) from DataOperateRecord");
		hql = createSql(hql, start, end, centerid);
		List<HashMap<String,String>> list = conn.executeQuery(hql.toString());
		if (list == null || list.size() == 0) {
			return 0;
		} else {
			return Long.parseLong(list.get(0).get("num"));
		}
	}
	
	public List<SyncLogBean> query(String start, String end, String centerid,
			int page, int rows, String sidx, String sord){
		StringBuilder hql = new StringBuilder("from DataOperateRecord");
		hql = createSql(hql, start, end, centerid);
		if (!StringUtils.isNullOrEmpty(sidx)) {
			hql.append(" order by " + sidx + " " + sord);
		}
		List<HashMap<String,String>> list = ConnDo.getConnDo().executeQueryToList(hql.toString(),(page - 1) * rows,rows);
		if (list == null || list.size() == 0) {
			return null;
		} else {
			List<SyncLogBean> slbs = new ArrayList<SyncLogBean>();
			for (Map<String, String> row : list) {
				SyncLogBean slb = new SyncLogBean();
				slb.setCenterid(row.get("centerid"));
				slb.setCentername(row.get("centername"));
				slb.setErrorinfo(row.get("errorinfo"));
				slb.setOperate(row.get("operate"));
				slb.setOperateinfo(row.get("operateinfo"));
				slb.setOperatetime(row.get("operatetime"));
				slbs.add(slb);
			}
			return slbs;
		}
	}
	
	private StringBuilder createSql(StringBuilder sql, String start,
			String end, String centerid) {
		if (start != null || end != null || !StringUtils.isNullOrEmpty(centerid)) {
			sql.append(" where");
		}
		boolean flag = false;
		if (!StringUtils.isNullOrEmpty(centerid)) {
			sql.append(" centerid='" + centerid + "'");
			flag = true;
		}
		if (start != null || end != null) {
			if (flag) {
				sql.append(" and");
			}
			if (start != null && end != null) {
				sql.append(" operatetime between '" + start + "' and '" + end + "'");
			} else if (start != null) {
				sql.append(" operatetime>='" + start + "'");
			} else if (end != null) {
				sql.append(" operatetime<='" + end + "'");
			}
		}
		return sql;
	}
	
}

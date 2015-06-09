package com.fxdigital.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.fxdigital.bean.SyncLogBean;
import com.fxdigital.db.dao.SyncLogDao;

@Component
public class SyncLogManager {
	
	@Autowired
	private SyncLogDao syncLogDao;
	
	public long getTotalCount(String startTime, String endTime, String centerid){
		return syncLogDao.query(startTime, endTime, centerid);
	}
	
	public List<SyncLogBean> getData(String startTime, String endTime,
			String centerid, int page, int rows, String sidx, String sord){
		return syncLogDao.query(startTime, endTime, centerid, page, rows, sidx, sord);
	}
	
}

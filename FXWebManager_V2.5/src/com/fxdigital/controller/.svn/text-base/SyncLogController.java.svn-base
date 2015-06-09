package com.fxdigital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.fxdigital.bean.SyncLogBean;
import com.fxdigital.bean.TableData;
import com.fxdigital.manager.DbManager;
import com.fxdigital.manager.SyncLogManager;

@Controller
public class SyncLogController {
	
	@Autowired
	private SyncLogManager syncLogManager;
	@Autowired
	private DbManager dbManager;
	
	/**
	 * 获得同步日志
	 * 
	 * @param _search 是否点击了检索按钮（"true","false"）
	 * @param page 页码
	 * @param rows 每页的最大数据量
	 * @param sidx 待排序的字段
	 * @param sord 字段顺序（"asc","desc"）
	 * @param startTime 日志开始时间
	 * @param endTime 日志结束时间
	 * @return
	 */
	@RequestMapping(value="/getSyncLog",method=RequestMethod.POST)
	public @ResponseBody String getSyncLog(@RequestParam String _search,
			@RequestParam Integer page, @RequestParam Integer rows,
			@RequestParam String sidx, @RequestParam String sord,
			@RequestParam(required=false) String startTime,
			@RequestParam(required=false) String endTime){
//		if("true".equals(_search)){
//			
//		}
		String centerid = dbManager.getLocalCenter().getId();
		long totalCount = syncLogManager.getTotalCount(
				startTime, endTime, centerid);
		List<SyncLogBean> data = syncLogManager.getData(
				startTime, endTime, centerid, page, rows, sidx, sord);
		TableData tableData = new TableData();
		tableData.setPage(page);
		tableData.setTotal((int) Math.ceil(totalCount/(rows*1.0)));
		tableData.setRecords(totalCount);
		tableData.setRows(data);
		return JSONObject.toJSONString(tableData);
	}
	
}

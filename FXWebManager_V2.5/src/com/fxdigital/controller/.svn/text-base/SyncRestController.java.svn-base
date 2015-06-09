package com.fxdigital.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.fxdigital.db.dao.MqServerInfoDao;

@Controller
public class SyncRestController {
	private static final Logger log = Logger.getLogger(SyncRestController.class);
	@Autowired
	MqServerInfoDao mqServerInfoDao;
	int upcount=0;
	int downcount=0;
	//==================同步设置=====================
	//获取同步服务器指向
	@RequestMapping(value = { "/yWGetSyncInfo" }, method = RequestMethod.POST)
	@ResponseBody
	public String ywGetSyncInfo(@RequestBody String request) {
		log.info("come into yWGetSyncInfo function！");
		String bakvalue="-1";
		List<Map<String,Object>> list=mqServerInfoDao.querySyncInfo();
		if(list.size()>0){
		String syncip=String.valueOf(list.get(0).get("MqIP"));
		String syncport=String.valueOf(list.get(0).get("MqPort"));
		bakvalue=syncip+","+syncport;
		}
		log.info("yWGetSyncInfo back:"+bakvalue);
		return bakvalue;
	}
	//设置同步服务器指向
	@RequestMapping(value = { "/yWSetSyncInfo" }, method = RequestMethod.POST)
	@ResponseBody
	public String ywSetSyncInfo(@RequestBody String request) {
		log.info("come into ywSetSyncInfo function！ request:"+request);
		request=request.substring(1, request.length()-1);
		log.info("转换后的request："+request);
		String[] strs=request.split(",");
		String syncip=strs[0];
		String syncport=strs[1];
		log.info("syncip:"+syncip+","+"syncport:"+syncport);
		int bak=mqServerInfoDao.updateSyncinfo(syncip, syncport);
		String s=String.valueOf(bak);
		return s;
	}
	
	
	//==================上传=====================
	//获取本中心上传版本号和锁
	@RequestMapping(value = { "/yWGetNativeVer" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWGetNativeVer(@RequestBody String request) {
		log.info("进入yWGetNativeVer方法！");
		String s="7,0";
		return s;
	}
	//获取同步服务器上记录的版本号和上传后版本号 -1表示链接同步服务器失败
	@RequestMapping(value = { "/yWGetSyncNumber" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWGetSyncNumber(@RequestBody String request) {
		log.info("进入yWGetSyncNumber方法！");
		String s="-1";
		if(true){
			 s="8,9";
		}
		return s;
	}
	//判断是否可以上传
	@RequestMapping(value = { "/yWIsUpload" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWIsUpload(@RequestBody String request) {
		log.info("进入yWIsUpload方法！request："+request);
		request=request.substring(1, request.length()-1);
		String s="-1";
		log.info("转换后的request:"+request);
		String[] strs=request.split(",");
		log.info("nativever:"+strs[0]+",server:"+strs[1]+",nextver:"+strs[2]);
		List<String> upversion = new ArrayList<String>();
		upversion.add(strs[0]);
		upversion.add(strs[1]);
		upversion.add(strs[2]);
		if(true){
			s="1";
		}
		
		return s;
	}
	//上传
	@RequestMapping(value = { "/yWUploading" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWUploading(@RequestBody String request) {
		log.info("进入yWUploading方法！");
		String s=null;
		
		if(upcount<3){
			s="-1_"+"上传中！";
			upcount++;
		}else{
			s="0_"+"上传成功！";
			upcount=0;
		}
		return s;
	}
	//获取上传状态   暂时不用
	@RequestMapping(value = { "/yWGetupstate" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWGetupstate(@RequestBody String request) {
		log.info("进入yWGetupstate方法！");
		System.out.println("request:"+request);
		String s="1";
		return s;
	}
	//解锁
	@RequestMapping(value = { "/yWUnlock" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWUnlock(@RequestBody String request) {
		log.info("进入yWUnlock方法！");
		System.out.println("request:"+request);
		String s="1";
		return s;
	}
	//获取上传锁
	@RequestMapping(value = { "/yWGetuplock" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWGetuplock(@RequestBody String request) {
		log.info("进入yWGetuplock方法！");
		System.out.println("request:"+request);
		String s="0";
		//1 有锁
		return s;
	}
	
	//==================下载=====================
	//获取下载版本信息
	@RequestMapping(value = { "/yWGetdownserverinfo" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWGetdownserverinfo(@RequestBody String request) {
		log.info("进入yWGetdownserverinfo方法！");
		System.out.println("request:"+request);
		List<HashMap<String, String>> serverversion=new ArrayList<HashMap<String, String>>();
		HashMap<String, String> map=new HashMap<String, String>();
		map.put("centerid", "879079@001");
		map.put("centername", "中心管理服务器");
		map.put("centerip", "192.168.1.117");
		map.put("clientversion", "20");
		map.put("serverversion", "23");
		map.put("updatetime", "2015-01-15");
		map.put("isload", "可以下载");
		serverversion.add(map);
		String s=JSONObject.toJSONString(serverversion);
		return s;
	}
	//判断是否可以下载
	@RequestMapping(value = { "/yWIsDownload" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWIsDownload(@RequestBody String request) {
		log.info("进入yWIsDownload方法！");
		System.out.println("request:"+request);
		String s="2";
		return s;
	}
	//获取下载状态
	@RequestMapping(value = { "/yWGetdownstate" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWGetdownstate(@RequestBody String request) {
		log.info("进入yWGetdownstate方法！");
		// back=-1下载中，0下载成功，1下载失败
		String s="-1";
		List<HashMap<String, String>> back=new ArrayList<HashMap<String, String>>();
		for (int i = 0; i < 8; i++) {
			HashMap<String, String> map=new HashMap<String, String>();
			map.put("centerid", "8asdfas79@001");
			map.put("centername", "中心管理服务器1");
			map.put("downstartdate", "2015-1-16 10:28:23"+i);
			map.put("version", "20");
			map.put("downenddate", "2015-1-16 10:28:50"+i);
			map.put("state", "正在组装"+i);
			back.add(map);
		}
		for (int j = 0; j < 8; j++) {
			HashMap<String, String> map=new HashMap<String, String>();
			map.put("centerid", "879aad@001");
			map.put("centername", "中心管理服务器2");
			map.put("downstartdate", "2015-1-16 10:28:23"+j);
			map.put("version", "21");
			map.put("downenddate", "2015-1-16 10:28:50"+j);
			map.put("state", "正在组装"+j);
			back.add(map);
		}
		List<String> centerids=new ArrayList<String>();
		centerids.add("8asdfas79@001");
		centerids.add("879aad@001");
		List<List<HashMap<String, String>>> reslut=backtolist(back,centerids);
		String jsons=JSONObject.toJSONString(reslut);
		if(downcount<3){
			s="-1_"+jsons;
			downcount++;
		}else{
			s="0_"+jsons;
			downcount=0;
		}
		return s;
	}
	//获取下载详细状态
	@RequestMapping(value = { "/yWGetcenterdownstate" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWGetcenterdownstate(@RequestBody String request) {
		log.info("进入yWGetcenterdownstate方法！");
		List<HashMap<String, String>> back=new ArrayList<HashMap<String, String>>();
		for (int i = 0; i < 8; i++) {
			HashMap<String, String> map=new HashMap<String, String>();
			map.put("centerid", "879079@001");
			map.put("centername", "中心管理服务器");
			map.put("downstartdate", "2015-1-16 10:28:23"+i);
			map.put("version", "20");
			map.put("downstartdate", "2015-1-16 10:28:50"+i);
			map.put("state", "正在组装"+i);
			back.add(map);
		}
		List<String> centerids=new ArrayList<String>();
		centerids.add("879079@001");
		List<List<HashMap<String, String>>> reslut=backtolist(back,centerids);
		String jsons=JSONObject.toJSONString(reslut);
		return jsons;
	}
	//获取下载锁
	@RequestMapping(value = { "/yWGetDownlock" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWGetDownlock(@RequestBody String request) {
		log.info("进入yWGetDownlock方法！");
		System.out.println("request:"+request);
		String s="0";
		return s;
	}
	//解锁
	@RequestMapping(value = { "/yWUndownlock" }, method = RequestMethod.POST)
	@ResponseBody
	public String yWUndownlock(@RequestBody String request) {
		log.info("进入yWUndownlock方法！");
		System.out.println("request:"+request);
		String s="1";
		return s;
	}
	
	public List<List<HashMap<String, String>>> backtolist(
			List<HashMap<String, String>> list, List<String> centeridlist) {
		List< List<HashMap<String, String>>> listbak = new ArrayList<List<HashMap<String, String>>>();
		//HashMap<String, List<HashMap<String, String>>> map = null;
		List<HashMap<String, String>> templist = null;
		if (centeridlist.size() > 0 && null != centeridlist) {
			for (int i = 0; i < centeridlist.size(); i++) {
				//map = new HashMap<String, List<HashMap<String, String>>>();
				templist = new ArrayList<HashMap<String, String>>();
				for (int j = 0; j < list.size(); j++) {
					String outcenterid = centeridlist.get(i);
					String incenterid = list.get(j).get("centerid");
					if (outcenterid.equals(incenterid)) {
						templist.add(list.get(j));
					}
				}
				//map.put(centeridlist.get(i), templist);
				listbak.add(templist);
			}
		}
		return listbak;
	}
	
}

package com.fxdigital.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fxdigital.manager.DbManager;
import com.fxdigital.manager.LocalCenter;
import com.fxdigital.manager.RegisterCenter;
import com.fxdigital.manager.SubStatus;
import com.fxdigital.manager.SupStatus;
import com.fxdigital.manager.SyncServer;
import com.fxdigital.util.LinuxCmd;
import com.hibernate.bean.SyncUpnetworkinfo;
import com.impl.LocalServerImpl;
import com.pojo.LocalServer;





/**
 * 
 * @author fucz
 * @version 2014-7-21
 */
@Controller
public class RelationSetController {
	
	@Autowired
	private DbManager dbManager;

	private static final Logger log = Logger.getLogger(RelationSetController.class);
	
	@RequestMapping(value = "/localmqset", method = RequestMethod.POST)
	public String init(HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes attr) {
		try {
			if (System.getProperty("os.name").equals("Linux")) {
				LocalServerImpl localimpl = LocalServerImpl.newInstance();
				LocalServer server = localimpl.getLocalServer();
				
				//从数据库拿数据
				LocalCenter center=new LocalCenter();
				center=dbManager.getLocalCenter();
				server.setIp(center.getIp());
				server.setMask(center.getCenterMask());
				server.setGate(center.getCenterGate());
				
				
				request.setAttribute("localServer", server);
			}else{
				attr.addAttribute("message", "获取服务器网络参数的方式不支持Windows系统！");
				return "redirect:/error";
			}
		} catch (Exception e) {
			log.error("网络参数读取异常！", e);
			attr.addAttribute("message", "网络参数读取异常！");
			return "redirect:/error";
		}
		return "netArgsSet";
	}


	
	@RequestMapping(value = { "/localmq" }, method = RequestMethod.POST)
	public String localmq(ModelMap modelMap,HttpServletRequest request){
		LocalCenter local = dbManager.getLocalCenter();
		String autotime=dbManager.getAutoTime();
		String ip = request.getParameter("apply_ip");
		String port = request.getParameter("apply_port");
		List<SupStatus> supStatuses = dbManager.getSupStatus();
		List<SubStatus> subStatuses = dbManager.getSubStatus();
		List<RegisterCenter> centers = dbManager.getAllLocalRegisterCenter();
		modelMap.put("sups", supStatuses);
		modelMap.put("subs", subStatuses);
		modelMap.put("clients", centers);
		modelMap.put("ip", ip);
		modelMap.put("port", port);
		if(local != null){
			modelMap.put("mqIp", local.getSyncServerIP());
			modelMap.put("mqPort", local.getSyncServerPort());
		}else{
			modelMap.put("mqIp", "数据库访问失败");
			modelMap.put("mqPort", "数据库访问失败");
		}
		if(autotime==null){
			modelMap.put("autotime", "60");
		}else{
			modelMap.put("autotime", autotime);
		}
		return "/syncserverviews/localmqipset";
	}
	
	@RequestMapping(value = { "/applyupmq" }, method = RequestMethod.POST)
	public String applyupmq(ModelMap modelMap,HttpServletRequest request){
		LocalCenter local = dbManager.getLocalCenter();
		String autotime=dbManager.getAutoTime();
		String ip = request.getParameter("apply_ip");
		String port = request.getParameter("apply_port");
		List<SupStatus> supStatuses = dbManager.getSupStatus();
		List<SubStatus> subStatuses = dbManager.getSubStatus();
		List<RegisterCenter> centers = dbManager.getAllLocalRegisterCenter();
		modelMap.put("sups", supStatuses);
		modelMap.put("subs", subStatuses);
		modelMap.put("clients", centers);
		modelMap.put("ip", ip);
		modelMap.put("port", port);
		if(local != null){
			modelMap.put("mqIp", local.getSyncServerIP());
			modelMap.put("mqPort", local.getSyncServerPort());
		}else{
			modelMap.put("mqIp", "数据库访问失败");
			modelMap.put("mqPort", "数据库访问失败");
		}
		if(autotime==null){
			modelMap.put("autotime", "60");
		}else{
			modelMap.put("autotime", autotime);
		}
		return "/syncserverviews/applyupmqip";
	}
	
	@RequestMapping(value = { "/showupmq" })
	public String showupmq(ModelMap modelMap,HttpServletRequest request){
		LocalCenter local = dbManager.getLocalCenter();
		String autotime=dbManager.getAutoTime();
		String ip = request.getParameter("apply_ip");
		String port = request.getParameter("apply_port");
		List<SupStatus> supStatuses = dbManager.getSupStatus();
		List<SubStatus> subStatuses = dbManager.getSubStatus();
		List<RegisterCenter> centers = dbManager.getAllLocalRegisterCenter();
		modelMap.put("sups", supStatuses);
		modelMap.put("subs", subStatuses);
		modelMap.put("clients", centers);
		modelMap.put("ip", ip);
		modelMap.put("port", port);
		if(local != null){
			modelMap.put("mqIp", local.getSyncServerIP());
			modelMap.put("mqPort", local.getSyncServerPort());
		}else{
			modelMap.put("mqIp", "数据库访问失败");
			modelMap.put("mqPort", "数据库访问失败");
		}
		if(autotime==null){
			modelMap.put("autotime", "");
		}else{
			modelMap.put("autotime", autotime);
		}
		return "/syncserverviews/showupmqip";
	}
	
	@RequestMapping(value = { "/showlowmq" })
	public String showlowmq(ModelMap modelMap,HttpServletRequest request){
		LocalCenter local = dbManager.getLocalCenter();
		String autotime=dbManager.getAutoTime();
		String ip = request.getParameter("apply_ip");
		String port = request.getParameter("apply_port");
		List<SupStatus> supStatuses = dbManager.getSupStatus();
		List<SubStatus> subStatuses = dbManager.getSubStatus();
		List<RegisterCenter> centers = dbManager.getAllLocalRegisterCenter();
		modelMap.put("sups", supStatuses);
		modelMap.put("subs", subStatuses);
		modelMap.put("clients", centers);
		modelMap.put("ip", ip);
		modelMap.put("port", port);
		if(local != null){
			modelMap.put("mqIp", local.getSyncServerIP());
			modelMap.put("mqPort", local.getSyncServerPort());
		}else{
			modelMap.put("mqIp", "数据库访问失败");
			modelMap.put("mqPort", "数据库访问失败");
		}
		if(autotime==null){
			modelMap.put("autotime", "60");
		}else{
			modelMap.put("autotime", autotime);
		}
		return "/syncserverviews/showlowmqip";
	}
	
	@RequestMapping(value = { "/showclient" })
	public String showclient(ModelMap modelMap,HttpServletRequest request){
		LocalCenter local = dbManager.getLocalCenter();
		String autotime=dbManager.getAutoTime();
		String ip = request.getParameter("apply_ip");
		String port = request.getParameter("apply_port");
		List<SupStatus> supStatuses = dbManager.getSupStatus();
		List<SubStatus> subStatuses = dbManager.getSubStatus();
		List<RegisterCenter> centers = dbManager.getAllLocalRegisterCenter();
		modelMap.put("sups", supStatuses);
		modelMap.put("subs", subStatuses);
		modelMap.put("clients", centers);
		modelMap.put("ip", ip);
		modelMap.put("port", port);
		if(local != null){
			modelMap.put("mqIp", local.getSyncServerIP());
			modelMap.put("mqPort", local.getSyncServerPort());
		}else{
			modelMap.put("mqIp", "数据库访问失败");
			modelMap.put("mqPort", "数据库访问失败");
		}
		if(autotime==null){
			modelMap.put("autotime", "");
		}else{
			modelMap.put("autotime", autotime);
		}
		return "/syncserverviews/showlocalclient";
	}
	
	@RequestMapping(value = { "/relationSet" })
	public String entry(ModelMap modelMap,HttpServletRequest request){
		LocalCenter local = dbManager.getLocalCenter();
		String autotime=dbManager.getAutoTime();
//		String ip = request.getParameter("apply_ip");
//		String port = request.getParameter("apply_port");
		List<SupStatus> supStatuses = dbManager.getSupStatus();
		List<SubStatus> subStatuses = dbManager.getSubStatus();
		List<RegisterCenter> centers = dbManager.getAllLocalRegisterCenter();
		modelMap.put("sups", supStatuses);
		modelMap.put("subs", subStatuses);
		modelMap.put("clients", centers);
		
		SyncUpnetworkinfo sync=	dbManager.getNetUpWorkInfo();
		if(null!=sync){
			modelMap.put("ip", sync.getSupIp());
			modelMap.put("port", sync.getSupPort());
		}else{
			modelMap.put("ip", "");
			modelMap.put("port", "");
		}
		if(local != null){
			modelMap.put("mqIp", local.getSyncServerIP());
			modelMap.put("mqPort", local.getSyncServerPort());
		}else{
			modelMap.put("mqIp", "");
			modelMap.put("mqPort", "");
		}
		if(autotime==null){
			modelMap.put("autotime", "60");
		}else{
			modelMap.put("autotime", autotime);
		}
		return "/syncserverviews/relationSet";
	}
	
	@RequestMapping(value = { "/rebootserver" }, method = RequestMethod.POST)
	public void reboot(HttpServletResponse response,HttpServletRequest request){
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(LinuxCmd.SUCCESS.equals(LinuxCmd.processUseBasic("reboot"))){
				out.print("重启服务器成功！");
			}else{
				out.print("重启服务器失败！");
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = { "/setMq" }, method = RequestMethod.POST)
	public void setMq(HttpServletResponse response,HttpServletRequest request){
		String mqIp = request.getParameter("mqIp");
		int mqPort = Integer.parseInt(request.getParameter("mqPort"));
		String autotime = request.getParameter("autotime");
//		dbManager.setMqInfo(mqIp, mqPort);
//		dbManager.setAutoTime(autotime);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(dbManager.setMqInfo(mqIp, mqPort)&&dbManager.setAutoTime(autotime)>0){
				out.print("修改成功，服务器马上重启！");
				LinuxCmd.processUseBasic("reboot");
			}else{
				out.print("修改失败！");
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = { "/apply" }, method = RequestMethod.POST)
	public void apply(HttpServletResponse response,HttpServletRequest request){
		PrintWriter out = null;
		String upIp = request.getParameter("ip");
		int upPort = 0;
		int result =0;
		if(!("").equals(request.getParameter("port"))&&null!=request.getParameter("port")){
			upPort = Integer.parseInt(request.getParameter("port"));
			String centerId=dbManager.getLocalCenter().getId();
			String ip =dbManager.getLocalCenter().getSyncServerIP();
			int port =dbManager.getLocalCenter().getSyncServerPort();
			SyncUpnetworkinfo syncUpnetworkinfo =new SyncUpnetworkinfo();
			syncUpnetworkinfo.setSubId(centerId);
			syncUpnetworkinfo.setSubIp(ip);
			syncUpnetworkinfo.setSubPort(port);
			syncUpnetworkinfo.setSupIp(upIp);
			syncUpnetworkinfo.setSupPort(upPort);
			
			 result =dbManager.saveUpNetWork(syncUpnetworkinfo);
		}else if(("").equals(request.getParameter("ip"))){
			 result =dbManager.deleteUpNetWork();
		}
		try {
			out = response.getWriter();
			if(result==1){
				out.print("设置成功，服务器马上重启！");
				LinuxCmd.processUseBasic("reboot");
			}else{
				out.print("设置失败！");
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = { "/setMqRelation" }, method = RequestMethod.POST)
	public void setMqRelation(HttpServletResponse response,HttpServletRequest request){
		PrintWriter out = null;
		String upIp = request.getParameter("ip");
		String mqIp = request.getParameter("mqIp");
		int mqPort = Integer.parseInt(request.getParameter("mqPort"));
		String autotime = request.getParameter("autotime");
		int upPort = 0;
		int result =0;
		boolean portFlag=(("").equals(request.getParameter("port"))||null==request.getParameter("port"));
		boolean ipFlag=(("").equals(request.getParameter("ip"))||null==request.getParameter("ip"));
		if(portFlag||ipFlag){
			 result =dbManager.deleteUpNetWork();
		}else{
			upPort = Integer.parseInt(request.getParameter("port"));
			String centerId=dbManager.getLocalCenter().getId();
			String ip =dbManager.getLocalCenter().getSyncServerIP();
			int port =dbManager.getLocalCenter().getSyncServerPort();
			SyncUpnetworkinfo syncUpnetworkinfo =new SyncUpnetworkinfo();
			syncUpnetworkinfo.setSubId(centerId);
			syncUpnetworkinfo.setSubIp(ip);
			syncUpnetworkinfo.setSubPort(port);
			syncUpnetworkinfo.setSupIp(upIp);
			syncUpnetworkinfo.setSupPort(upPort);
			
			 result =dbManager.saveUpNetWork(syncUpnetworkinfo);
		}
		try {
			out = response.getWriter();
			if(result>=0&&dbManager.setMqInfo(mqIp, mqPort)&&dbManager.setAutoTime(autotime)>0){
				out.print("设置成功，服务器马上重启！");
				LinuxCmd.processUseBasic("reboot");
			}else{
				out.print("设置失败！");
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = { "/cancel" }, method = RequestMethod.POST)
	public void cancel(HttpServletResponse response,HttpServletRequest request){
		String ip = request.getParameter("ip");
		SupStatus supStatus = dbManager.getSupStatus(ip);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(supStatus == null){
				out.print("数据错误！");
			}else if("申请中".equals(supStatus.getStatus())
					|| "已申请".equals(supStatus.getStatus())
					){
				if(dbManager.changeSupStatus(ip, "撤销中")){
					out.print("撤销成功！");
				}else{
					out.print("撤销失败！");
				}
			}else{
				out.print(supStatus.getStatus()+"，不能撤销！");
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = { "/agree" }, method = RequestMethod.POST)
	public void agree(HttpServletResponse response,HttpServletRequest request){
		String serverID = request.getParameter("id");
		SubStatus subStatus = dbManager.getSubStatusFromID(serverID);
		SyncServer ss = dbManager.getSyncServerFromMqIP(subStatus.getMqIP());
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(ss != null){
				dbManager.changeSubStatus(
						subStatus.getServerID(),"拒绝中");
				out.print("已是本级的下级或间接上级，拒绝此申请！");
			}else if("未审核".equals(subStatus.getStatus())
					){
				if(dbManager.changeSubStatus(serverID, "通过中")){
					out.print("通过成功！");
				}else{
					out.print("通过失败！");
				}
			}else{
				out.print(subStatus.getStatus()+"，不能通过！");
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = { "/reject" }, method = RequestMethod.POST)
	public void reject(HttpServletResponse response,HttpServletRequest request){
		String serverID = request.getParameter("id");
		SubStatus subStatus = dbManager.getSubStatusFromID(serverID);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(subStatus == null){
				out.print("数据错误！");
			}else if("未审核".equals(subStatus.getStatus())
					){
				if(dbManager.changeSubStatus(serverID, "拒绝中")){
					out.print("拒绝成功！");
				}else{
					out.print("拒绝失败！");
				}
			}else{
				out.print(subStatus.getStatus()+"，不能拒绝！");
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = { "/delete" }, method = RequestMethod.POST)
	public void delete(HttpServletResponse response,HttpServletRequest request){
		String serverID = request.getParameter("id");
		SubStatus subStatus = dbManager.getSubStatusFromID(serverID);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			if(subStatus == null){
				out.print("数据错误！");
			}else if("已通过".equals(subStatus.getStatus())
					){
				if(dbManager.changeSubStatus(serverID, "删除中")){
					out.print("删除成功！");
				}else{
					out.print("删除失败！");
				}
			}else{
				out.print(subStatus.getStatus()+"，不能删除！");
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}

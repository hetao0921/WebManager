<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'upserver.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="./js/fxdigital.js"></script>
	
		<script type="text/javascript">
		$(function() {
		var curEditButtion=document.getElementById("edits");
		var curSelButtion=document.getElementById("selfver");
			jQuery("#jqGrid").jqGrid(
				{
					url : 'getUprecord',
					datatype : "json",
					mtype : "POST",
					height:"100%",
					autowidth  :true,
					colNames : [ '软件包名称', '升级前版本', '升级后版本','产品类型','升级状态','升级时间'],
					colModel : [ {
						name : 'softname',
						index : 'softname',
						align: 'center',
						width : '15%'
					}, {
						name : 'softversion',
						index : 'softversion',
						align: 'center',
						width : '15%'
					}, {
						name : 'softcurversion',
						index : 'softcurversion',
						align: 'center',
						width : '25%'
					},{
						name : 'softtype',
						index : 'softtype',
						align: 'center',
						width : '15%'
					},{
						name : 'operatetatus',
						index : 'operatetatus',
						align: 'center',
						width : '15%'
					},{
						name : 'upgradedate',
						index : 'upgradedate',
						align: 'center',
						width : '15%'
					}],
					rowNum : 40,
					rowList : [ 10, 20, 30 ],
					pager : 'plist47',
					//sortname : 'id',
					viewrecords : true,
					//sortorder : "desc",
					loadonce : true,
					//caption : "本机升级记录"
					loadComplete: function(xhr) {
					curSelButtion.readOnly=true;
						getselfver();
						 var rowNum = parseInt($(this).getGridParam("records"), 10);
						  if (rowNum <= 0) { appendMessage("没有记录!","alert");  }
							} 
				}).navGrid('#plist47', { add: false, edit: false, del: false,search: false,refresh: false });
		doResize();
		Event.onResizend(function() {
			doResize();
		});
		function doResize() {
			var mainContentHeight = $("#main-content").height();
			var mainContentWidth = $("#main-content").width();
			var buttonsHeight = $("#buttons").height();
			var tableHeadHeight = $("#jqgh_jqGrid_admin").height();
			var pagerHeight = $("#plist47").height();
			$("#jqGrid").setGridHeight(
					mainContentHeight - buttonsHeight - pagerHeight
							- tableHeadHeight - 8);
			$("#jqGrid").setGridWidth(mainContentWidth - 2);
		}
		
		function getselfver(){
			$.post("getseftVer",function(data){
				if(data=="1"){
				//alert(curEditButtion.getAttribute("style"));
				 curEditButtion.style.display="block";
				 curSelButtion.readOnly=false;
				 $("#selfver").val("V2.0.0.0");
				}else if(data=="0"){
				$("#selfver").val("V2.0.0.0");
				}else{
				$("#selfver").val(data);
				}
			});
		}
		
		$('#edits').click(function() {
		var sefver=$("#selfver").val();
			$.post("setseftVer",{"sefver":sefver},function(data){
				if(data==1){
				curEditButtion.style.display="none";
				curSelButtion.readOnly=true;
				appendMessage("设置成功！", "notice");
				jumps();
				}else{
				appendMessage("设置失败！", "close");
				}
			});
		});
		
		function jumps(){
		$.post("definedupserver", function(data) {
			jump("自定义升级", data);
		});
		}
		
		});
		
		
</script>
	</head>
	
	<body bgcolor="#989CAC">
	<div id="buttons">
		<label>服务器当前版本：</label>
		<input id="selfver" type="text" value="V2.0.0.0">
		<input id="edits" type="button" style="display:none;" value="修改版本号" >
	</div>
		<table id="jqGrid"></table>
		<div id="plist47">
		</div>
	</body>
</html>

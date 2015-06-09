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

		<title>My JSP 'left.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script src="./js/fxdigital.js"></script>
	
		<script type="text/javascript">
		$(function() {
			jQuery("#jqGrid").jqGrid(
				{
					url : 'getSyncLog',
					datatype : "json",
					mtype : "POST",
					height:"100%",
					autowidth  :true,
					colNames : [ '中心ID', '中心名称', '操作日期','操作类型','详细信息','错误类型'],
					colModel : [ {
						name : 'centerid',
						index : 'centerid',
						width : '15%',
						sorttype : "int"
					}, {
						name : 'centername',
						index : 'centername',
						width : '20%',
						sorttype : "date"
					}, {
						name : 'operatetime',
						index : 'operatetime',
						width : '20%'
					}, {
						name : 'operate',
						index : 'operate',
						width : '10%'
					}, {
						name : 'operateinfo',
						index : 'operateinfo',
						width : '25%'
					}, {
						name : 'errorinfo',
						index : 'errorinfo',
						width : '10%'
					}],
					rowNum : 20,
					rowList : [ 10, 20, 30 ],
					pager : 'plist47',
					//sortname : 'id',
					viewrecords : true,
					//sortorder : "desc",
					//loadonce : true,
					//caption : "日志记录"
				}).navGrid('#plist47', { add: false, edit: false, del: false,search:false,refresh:false });
		
			$("#mysearch").filterGrid('#jqGrid', {
				formtype : 'auto',
				autosearch : false,
				buttonclass : "searchButtonClass",
				searchButton : "检索",
				clearButton : "清空",
				enableSearch : true,
				enableClear : true,
				url : 'getSyncLog',
				formtypeDetail : [2,1],
				filterModel : [ {
					label : '开始时间：',
					name : 'startTime',
					stype : 'text',
					defval : '',
				}, {
					label : '结束时间：',
					name : 'endTime',
					stype : 'text',
					defval : '',
				} ],
			});
			
			function getToday00(){
				var curDate = new Date();
				var year = curDate.getFullYear();
				var month = curDate.getMonth()+1;
				if(month < 10)
					month = '0'+month;
				var day = curDate.getDate();
				if(day < 10)
					day = '0'+day;
				
				return year+"-"+month+"-"+day+" 00:00:00";
			}
			function getToday(){
				var curDate = new Date();
				var year = curDate.getFullYear();
				var month = curDate.getMonth()+1;
				if(month < 10)
					month = '0'+month;
				var day = curDate.getDate();
				if(day < 10)
					day = '0'+day;
				var hours = curDate.getHours();
				if(hours < 10)
					hours = '0'+hours;
				var minutes = curDate.getMinutes();
				if(minutes < 10)
					minutes = '0'+minutes;
				var seconds = curDate.getSeconds();
				if(seconds < 10)
					seconds = '0'+seconds;
				
				return year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
			}
			
			$("input[name='startTime']").datetimepicker({
				controlType : 'select',
				timeFormat : 'HH:mm:ss',
			});
			$("input[name='startTime']").attr("readonly", "readonly");
			$("input[name='endTime']").datetimepicker({
				controlType : 'select',
				timeFormat : 'HH:mm:ss',
			});
			$("input[name='endTime']").attr("readonly", "readonly");
			$(".searchButtonClass").button();
			
			$("input[name='startTime']").val(getToday00());
			$("input[name='endTime']").val(getToday());
			
			doResize();
			Event.onResizend(function() {
				doResize();
			});
			function doResize() {
				var mainContentHeight = $("#main-content").height();
				var mysearchHeight = $("#mysearch").height();
				var mainContentWidth = $("#main-content").width();
				var buttonsHeight = $("#buttons").height();
				var tableHeadHeight = $("#jqgh_jqGrid_centerid").height();
				var pagerHeight = $("#plist47").height();
				$("#jqGrid").setGridHeight(mainContentHeight - mysearchHeight - buttonsHeight-pagerHeight-tableHeadHeight-8);
				$("#jqGrid").setGridWidth(mainContentWidth-2);
			}
		});
</script>
	</head>

	<body bgcolor="#989CAC">
		<div>
			<div id="mysearch" style="border:#c6c6c6 solid 1px;padding:10px;margin-bottom: 10px"></div>
		</div>
		<table id="jqGrid"></table>
		<div id="plist47"></div>
	</body>
</html>

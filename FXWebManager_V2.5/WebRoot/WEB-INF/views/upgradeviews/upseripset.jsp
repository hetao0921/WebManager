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
		<script src="./layer/layer.min.js"></script>
		<style type="text/css">
table {
	border-collapse: collapse;
	font-family: Arial;
	font-size: 14px;
	border-spacing: 0;
	cellpadding: 0;
	cellspacing: 0;
}

.top_tab {
	width: 100%;
	border-collapse: collapse;
	height: 48px;
	min-width: 1024px;
	position: absolute;
	z-index: 1
}

.top_tab tr {
	background-repeat: repeat-x;
}

.top_tab td {
	white-space: nowrap;
}

.tab_head {
	font-size: 14px;
	font-weight: bolder;
	color: #3057A9;
	background-color: #D6DAE5
}


.tab tr {
	height: 30px;
}

.tab td {
	padding-left: 4px;
}


 .test1 {
                text-align:justify;
                text-justify:distribute-all-lines;/*ie6-8*/
                text-align-last:justify;/* ie9*/
                -moz-text-align-last:justify;/*ff*/
                -webkit-text-align-last:justify;/*chrome 20+*/
            }


#title_table {
	margin-top: 20px;
	margin-left: 2.5%
}


.topdiv {
	background-color: #EDEFF4;
	position: relative;
}


</style>
		<script type="text/javascript">
		function vaerify(){
		var syncip=document.getElementById("upserip").value;
		var syncport=document.getElementById("upserport").value;
		var pattern=/^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$/;
		var patterns="^[0-9]+$";
		var re=new RegExp(patterns);
		if(syncip == ''){
			messageDialog("升级服务器IP不能为空！");
			document.getElementById("upserip").focus();
			return false;
		}
		if(syncport == ''){
			messageDialog("升级服务器端口不能为空！");
			document.getElementById("upserport").focus();
			return false;
		}
		if(syncport.search(re) == -1){
			messageDialog("升级服务器端口应为正整数！");
			document.getElementById("upserport").focus();
			return false;
		}
		if(parseInt(syncport) >= 65536){
			messageDialog("升级服务器端口应小于65536！");
			document.getElementById("upserport").focus();
			return false;
		}
		flag_ip=pattern.test(syncip);
		if(flag_ip){
		if(syncport.search(re)!=-1&&parseInt(syncport)<65536){
		setsysncinfo();
		}else{
		messageDialog("输入端口非法！要是正整数及小于65536");
		document.getElementById("upserport").focus();
		return false;
		}
		}else{
		messageDialog("升级服务器IP格式不正确！");
		document.getElementById("upserip").focus();
		return false;
			}
		}
		
		function setsysncinfo(){
		$.ajax({
			  url:"setupserinfo",
			  type:"POST",
			  data:{"upserip":$('#upserip').val(),"upserport":$('#upserport').val(),"devicetype":$('#devicetype').val()},
			  timeout:60000,
			  dataType:"text",
			  success:function(data){
			    if (data >0) {
			     //messageDialog("设置成功！请重启服务器！");
			     layer.msg('设置成功！请重启服务器！', 1, -1);
			     getupserinfo();
			    } else{
			    messageDialog("数据库链接断开！设置失败！");
			    }
			  },
			  error:function(){
//			  messageDialog("链接超时！请退出重新登录！");
			  onloadfail();
			  }
			});
		}
		
		function onloadfail(){
				 $.get("onloadfail",function(data){
					jump("链接错误",data);
				});
			}
			
	 function getupserinfo(){
		$.ajax({
			  url:"getupserinfo",
			  type:"POST",
			  data:{"Action" : "post"},
			  timeout:60000,
			  dataType:"text",
			  success:function(data){
			  var str = new Array();
					str = data.split("_");
					//alert(str[0]+":"+str[1]);
			   if (str[0] == "1") {
					str = str[1].split(",");
					document.getElementById('upserip').value = str[0];
					document.getElementById('upserport').value =str[1];
					document.getElementById('devicetype').value =str[2];
					$("#devicetype option").remove();
			   	$("#devicetype").append("<option value='"+str[2]+"'>" + str[2] + "</option>");
			   	//$("#devicetype").append("<option value='FXS8142'>FXS8142</option>");
			    } else if(str[0]=="0"){
			   // alert(str[0]+":"+str[1]);
			    str = str[1].split(",");
			     if("null"!=str[0]){
			    	document.getElementById('upserip').value = str[0];
					document.getElementById('upserport').value =str[1];
					$("#devicetype option").remove();
					//alert("0:"+str+"str.length:"+str.length);
					var str1 = str.slice(2,99999);
					//var str2 = [1,1,5,4,5,6,9,8,9];
					str1 = unique(str1);
					for(var i=0;i<str1.length-1;i++){
					$("#devicetype").append("<option value='"+str1[i]+"'>" + str1[i] + "</option>");
					//$("#devicetype").append("<option value='FXS8142'>FXS8142</option>");
					}
					}else{
						$("#upserip").val('');
						$("#upserport").val('');
						messageDialog("未设置，请输入IP和端口！");
						$("#devicetype option").remove();
					}
			    }else{
			   	messageDialog("数据库连接失败！");
			       onloadfail();
			    }
			  },
			  error:function(){
			  messageDialog("链接超时！可能是IP设置错误,或者该升级服务器未启动！");
			  		document.getElementById('upserip').value =null;
					document.getElementById('upserport').value =null;
					document.getElementById('devicetype').value =null;
					$("#devicetype option").remove();
			  }
			});
	};
	
	function unique(str){
			var n = {},r=[]; //n为hash表，r为临时数组
			for(var i = 0; i < str.length; i++) //遍历当前数组
			{
				if (!n[str[i]]) //如果hash表中没有当前项
				{
					n[str[i]] = true; //存入hash表
					r.push(str[i]); //把当前数组的当前项push到临时数组里面
				}
			}
			return r;
		};
	
	$(function(){
		getupserinfo();
	});
	
</script>
	</head>

	<body bgcolor="#989CAC">
		<div class="topdiv">
				<table class="tab" id="title_table">
					<tr>
						<td>
							<div class="test1">
								升级服务器IP：
							</div>
							</td>
							<td>
							<input type="text" id="upserip" name="upserip" value="正在获取数据。。">
						</td>
					</tr>
					<tr>
						<td>
							<div class="test1">
								升级服务器端口：
								</div>
								</td>
								<td>
							<input type="text" id="upserport" name="upserport" value="正在获取数据。。">
						</td>

					</tr>
					<tr>
							<td>
							<div class="test1">
								本机软件类型：
							</div>
							</td>
							<td>
							<!-- <input type="text" id="devicetype" name="devicetype" value="正在获取数据。。" readonly="readonly"> -->
							<select id="devicetype" name="devicetype" style="width: 80px;">
							</select>
							</td>
					</tr>
					<tr>
					<td>
					&nbsp;
					</td>
						<td>
							<div align="right">
						<input type="button"  value="保存" onclick="vaerify()">
						</div>
						</td>
					</tr>
				</table>
				
		</div>
	</body>
</html>

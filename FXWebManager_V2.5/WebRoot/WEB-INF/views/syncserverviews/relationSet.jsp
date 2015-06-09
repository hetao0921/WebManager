<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>Relation</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="./js/fxdigital.js"></script>
<script src="./layer/layer.min.js"></script>

<script type="text/javascript">
	function checkNull() {
		var ip = document.getElementById("ip").value;
		var gate = document.getElementById("gate").value;
		var mask = document.getElementById("mask").value;
		var exp = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
		var reg = ip.match(exp);
		var gater = gate.match(exp);
		if (ip == "") {
			messageDialog("IP不能为空！", "alert");
		} else if (reg == null) {
			messageDialog("输入的IP不合法！", "alert");
		} else if (gate == "") {
			messageDialog("网关不能为空！", "alert");
		} else if (gater == null) {
			messageDialog("输入的网关不合法！", "alert");
		} else if (mask == "") {
			messageDialog("子网掩码不能为空！", "alert");
		} else {
			confirmDialog("确定修改IP,修改成功后会重启？", function(result) {
				if (result) {
					$.post("netArgsSetSubmit", {
						"ip" : $('#ip').val(),
						"gate" : $('#gate').val(),
						"mask" : $('#mask').val(),
					}, function(data) {
						if ("true" == data) {
							layer.msg('修改成功！', 1, -1);
						} else {
							messageDialog("修改失败！", "fail");
						}
					});
				}
			});
		}
	}

	function setNetArgs() {

		$.post("netArgsSet", function(data) {
			var dataObj = eval("(" + data + ")");
			var dataType = dataObj.result;
			if (dataType == "error") {
				messageDialog("获取服务器网络参数的方式不支持Windows系统！", "fail");
			} else {
				var ipFront = dataObj.ip;
				var maskFront = dataObj.mask;
				var gateFront = dataObj.gate;
				document.getElementById("ip").value = ipFront;
				document.getElementById("gate").value = gateFront;
				document.getElementById("mask").value = maskFront;
			}
		});

	}

	$(function() {
		$('#refresh').click(function() {
			refresh();
		});
		$('#reboot').click(function() {
			confirmDialog("确认重启？", function(result) {
				if (result) {
					$.post("reboot", function(data) {
						messageDialog(data, "notice");
					});
				}
			});
		});
	//setMq有用
		$('#setMq').click(

						function() {

							var ip = $('#mq_ip').val();
							var port = $('#mq_port').val();
							var autotime = $('#autotime').val();
							var exp = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
							if (ip == "") {
								messageDialog("IP地址不能为空！", "alert");
								return;
							}
							if (ip.match(exp) == null) {
								messageDialog("IP地址不正确！", "alert");
								return;
							}
							if (port == "") {
								messageDialog("端口号不能为空！", "alert");
								return;
							}
							if (port.match("^[0-9]*$") == null) {
								messageDialog("端口号必须为数字！", "alert");
								return;
							}
							if (autotime == "") {
								autotime = "60";
							}
							if (autotime.match("^[0-9]*$") == null
									|| parseInt(autotime) < 60) {
								messageDialog("时间必须为数字！且最小值为60s", "alert");
								return;
							}
							confirmDialog("确认修改？", function(result) {
								if (result) {
									$.post("setMq", {
										"mqIp" : ip,
										"mqPort" : port,
										"autotime" : autotime
									}, function(data) {
										layer.msg(data, 1, -1);
										refresh();
									});
								}
							});

						});
						
						
		$('#apply')
				.click(
				
						function() {

							var ip = $('#apply_ip').val();
							var port = $('#apply_port').val();
							var exp = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
							if (ip.match(exp) == null&&ip!="") {
								messageDialog("IP地址不正确！", "alert");
								return;
							}
							if (port.match("^[0-9]*$") == null&&port!="") {
								messageDialog("端口号必须为数字！", "alert");
								return;
							}
							
							var mqIp = $('#mq_ip').val();
							var mqPort = $('#mq_port').val();
							var autotime = $('#autotime').val();
							var exp = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
							if (mqIp == "") {
								messageDialog("IP地址不能为空！", "alert");
								return;
							}
							if (mqIp.match(exp) == null) {
								messageDialog("IP地址不正确！", "alert");
								return;
							}
							if (mqPort == "") {
								messageDialog("端口号不能为空！", "alert");
								return;
							}
							if (mqPort.match("^[0-9]*$") == null) {
								messageDialog("端口号必须为数字！", "alert");
								return;
							}
							if (autotime == "") {
								autotime = "60";
							}
							if (autotime.match("^[0-9]*$") == null
									|| parseInt(autotime) < 60) {
								messageDialog("时间必须为数字！且最小值为60s", "alert");
								return;
							}
							
							confirmDialog("确认修改？修改将重启服务器", function(result) {
								if (result) {
							$.post("setMqRelation", {
								"mqIp" : mqIp,
								"mqPort" : mqPort,
								"autotime" : autotime,
								"ip" : ip,
								"port" : port
							}, function(data) {
								layer.msg(data, 1, -1);
								refresh();
							});
							}
							});
							
						});

	});
	function refresh() {
		$.post("syncserver", function(data) {
			jump("集中配置", data);
		});
	}


	function cancel(mqIP) {
		confirmDialog("确认取消？", function(result) {
			if (result) {
				$.post("cancel", {
					"ip" : mqIP
				}, function(data) {
					layer.msg(data, 1, -1);
					refresh();
				});
			}
		});
	}
	function agree(serverID) {
		confirmDialog("确认通过？", function(result) {
			if (result) {
				$.post("agree", {
					"id" : serverID
				}, function(data) {
					layer.msg(data, 1, -1);
					refresh();
				});
			}
		});
	}
	function reject(serverID) {
		confirmDialog("确认拒绝？", function(result) {
			if (result) {
				$.post("reject", {
					"id" : serverID
				}, function(data) {
					layer.msg(data, 1, -1);
					refresh();
				});
			}
		});
	}
	function delete_sub(serverID) {
		confirmDialog("确认拒绝？", function(result) {
			if (result) {
				$.post("delete", {
					"id" : serverID
				}, function(data) {
					layer.msg(data, 1, -1);
					refresh();
				});
			}
		});
	}
</script>

</head>

<body style="background:#C7EDCC;" onload="setNetArgs()">

	<div align="center">
		<form id="form1" action="" dir="ltr" method="post">

			<fieldset style="text-align: left">
				<legend>
					<b>修改本级MQ服务器信息：</b>
				</legend>
				<label>IP：</label><input id="mq_ip" name="mq_ip" type="text"
					size="20px" value="${mqIp}"> &nbsp;&nbsp;&nbsp; <label>端口：</label><input
					id="mq_port" name="mq_port" type="text" size="10px"
					value="${mqPort}"> &nbsp;&nbsp;&nbsp; <label>自动同步时间：</label><input
					id="autotime" name="autotime" type="text" size="10px"
					value="${autotime}"> &nbsp;&nbsp;&nbsp;<label>（秒）</label>
			</fieldset>
			<br>
			<fieldset style="text-align: left">
				<legend>
					<b>申请上级（MQ）：</b>
				</legend>
				<label>IP：</label><input id="apply_ip" name="apply_ip" type="text"
					size="20px" value="${ip}"> &nbsp;&nbsp;&nbsp; <label>端口：</label><input
					id="apply_port" name="apply_port" type="text" size="10px"
					value="${port}"> &nbsp;&nbsp;&nbsp; <input id="apply"
					type="button" value="确定">
			</fieldset>
			<br>
		</form>
	</div>




</body>
</html>

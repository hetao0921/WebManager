<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>授权</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script src="./js/fxdigital.js"></script>
<script src="./js/ajaxfileupload.js"></script>

<script type="text/javascript">
		function ajaxFileUpload() {
		    $.ajaxFileUpload({
		        url : "importFileLicense",
		        fileElementId : 'file_upload',
		        success : function(data, status) {
		        	if(data == "true")
		        		messageDialog("授权成功！","success");
		        	else
		        		messageDialog("授权失败！","fail");
		        },
		        error : function(data, status, e) {
		        	messageDialog("上传失败！","fail");
		        }
		    });
		}
		$('#txtImport').click(function() {
			var txtLicense = $('#txtLicense').val();
			if(txtLicense == ""){
				messageDialog("授权码不能为空！","alert");
				return;
			}
			$.post("importTxtLicense",
					{"license":txtLicense},
					function(data){
				if(data == "true"){
					messageDialog("授权成功！","success");
				} else if (data == "false"){
					messageDialog("授权失败！","fail");
				} else {
					messageDialog(data,"fail");
				}
			});
		});
		$('#fileImport').click(function() {
			ajaxFileUpload();
		});
</script>

</head>

<body>
	<div style="padding: 20px;">
		<span>授权码字符串：</span>
		<input type="text" id="txtLicense" size="30" />
		<input id="txtImport" type="button" value="授权" />
	</div>
	<hr>
	<div style="padding: 20px;">
		<span>授权码文件 ：</span>
		<div style="padding: 20px;margin-top: 20px;border:#c6c6c6 solid 1px;">
			<input type="file" id="file_upload" name="file_upload" size="45">
			<input id="fileImport" type="button" value="授权" />
		</div>
	</div>
</body>
</html>

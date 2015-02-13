<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>区域选择页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/area.css">
<script type="text/javascript" src="<%=path%>/jq/jquery-2.1.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/area.js"></script>
</head>

<body>
	
	<div id="content" align="center">
	<h1 align="center">区域选择</h1>
	<form action="AreaServlet" id="areaForm" method="post">
		<input type="hidden" name="op" value="seat" /> <input type="hidden"
			name="areaName" id="areaName" value="" />
	</form>
		<div id="border-out">
			<div id="area-t1" class="area area-t f">北F</div>
			<div id="area-t2" class="area area-t e">东E</div>
			<div id="area-t3" class="area area-t d">东D2</div>
			<div id="area-t4" class="area area-t d">东D1</div>
			<div id="area-t5" class="area area-t c">东C2</div>
			<div id="area-t6" class="area area-t c">东C1</div>
			<div id="border-in">
				<div id="center">
					<div id="stage">
						<div class="stage-out"></div>
						<div id="stage-out-text">舞台</div>
						<div class="stage-out"></div>
					</div>
					<div id="area-vip">
						<div id="area-vip-up" class="area area-t vip">VIP1</div>
						<div id="area-vip-down" class="area area-t vip">VIP2</div>
					</div>
					<div id="area-a">
						<div id="area-a-up" class="area area-t a">A1</div>
						<div id="area-a-down" class="area area-t a">A2</div>
					</div>
					<div id="area-b">
						<div id="area-b-up" class="area area-t b">B1</div>
						<div id="area-b-down" class="area area-t b">B2</div>
					</div>
				</div>
			</div>
			<div id="area-out">
				<div id="area-out-text">遮挡区</div>
			</div>
			<div id="area-b2" class="area area-b e">西E</div>
			<div id="area-b3" class="area area-b d">西D2</div>
			<div id="area-b4" class="area area-b d">西D1</div>
			<div id="area-b5" class="area area-b c">西C2</div>
			<div id="area-b6" class="area area-b c">西C1</div>
		</div>
	</div>
</body>
</html>

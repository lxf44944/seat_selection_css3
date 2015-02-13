<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//防止漏洞攻击
	if (session.getAttribute("area") == null
			|| "".equals(session.getAttribute("area"))) {
		response.sendRedirect(path + "/area.jsp");
	}

%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>座位选择</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/seat.css">
<script type="text/javascript" src="<%=path%>/jq/jquery-2.1.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/seat.js"></script>
</head>

<body>

	<div id="content" align="center">
	
		<c:forEach begin="1" end="8" varStatus="col">
			<ul>
				<c:forEach begin="1" end="13" varStatus="row">
					<li><a onclick="changeSelect(this)"
						class="list-item"
						title="${area}-${price}-${row.index}-${col.index}"
						href='javascript:void(0);'> ${row.index}-${col.index}</a>
					</li>
				</c:forEach>
			</ul>
		</c:forEach>

		<div id="car-form">
		
			<div id="car">
				<div id="info" class="pbtn">
					 <b>总计</b><br>
					 区域：${area}<br>
					数量：<span id="countSp">0</span><br> 总价：<br> <span
						id="priceSp">￥0</span><br>

				</div>
			</div>
			<form action="area.jsp" method="post"
				id="seatsForm">
				<div id="sbtn" hidden="true">提交</div>
				<div id="inputForm"></div>
			</form>
		</div>
	</div>
</body>
</html>

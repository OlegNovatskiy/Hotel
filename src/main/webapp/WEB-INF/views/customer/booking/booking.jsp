<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Головна</title>
<link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/customer/css/main.css" rel="stylesheet" />
</head>
<body>
	<header>
		<%@ include file="../menu.jsp"%>
	</header>
	<div class="wrapper">
		<div class="content">
			<%@ include file="bookingForm.jsp"%>
		</div>
		<div class="cf"></div>
	</div>

	<%@ include file="../footer.jsp"%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Головна</title>
<link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/registry/css/main.css" rel="stylesheet" />
</head>
<body>
		<header> <%@ include file="../menu.jsp"%>
	</header>
	<div>
		<div class="wrapper">
		<div class="leftSideBar col-md-3 ">
				<%@ include file="leftSideBarBooking.jsp"%>
			</div>
			<div class="content col-md-9">
				<%@ include file="bookingForm.jsp" %>
			</div>
		</div>
	</div>



</body>
</html>
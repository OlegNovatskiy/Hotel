<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Довавлення номера готелю</title>
<link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/registry/css/main.css" rel="stylesheet" />
</head>
<body>
	<header> <%@ include file="../menu.jsp"%>
	</header>
	<div>
		<div class="wrapper">
			<div class="leftSideBar  col-md-3">
				<%@ include file="leftSideBarApartment.jsp"%>
			</div>
			<div class="content  col-md-9">
				<%@ include file="formAddApartment.jsp" %>
			</div>
			
		</div>
	</div>



</body>
</html>
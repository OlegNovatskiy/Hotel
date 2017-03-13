<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Головна</title>
<link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/customer/css/main.css" rel="stylesheet" />
</head>
<body>
	<header> <%@ include file="../menu.jsp"%>
	</header>
	<div class="wrapper">
		<div class="leftSideBar col-md-3 ">
			<%@ include file="../apartmentFilter.jsp"%>
		</div>
		<div class="content col-md-9">

			<div class="col-md-6 col-md-offset-3">
				<h2>Бронювання номеру №${number} виконано
					успішно</h2>
				
			</div>
		</div>
	</div>
	<div class="cf"></div>
	<%@ include file="../footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Перегляд</title>
<link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/registry/css/main.css" rel="stylesheet" />
</head>
<body>
	<header> <%@ include file="../menu.jsp"%>
	</header>
	<div>
		<div class="wrapper">
			<div class="leftSideBar col-md-3 ">
				<%@ include file="leftSideBarApartment.jsp"%>
			</div>
			<div class="content col-md-9">
			<h2>Перегляд номера №${apartment.number}</h2>
			<table class="table table-bordered">
		<tr>
			<th>Назва атрибутів</th>
			<th>Значення</th>
		</tr>
		<tbody>
			<tr>
				<td>Номер кімнати</td>
				<td>${apartment.number}</td>
			</tr>
			<tr>
				<td>Макс.кількість поселенців</td>
				<td>${apartment.peopleCount} чол.</td>
			</tr>
			<tr>
				<td>Кількість ліжок</td>
				<td>${apartment.bedCount} шт.</td>
			</tr>
			<tr>
				<td>Кількість кімнат</td>
				<td>${apartment.roomCount} шт.</td>
			</tr>
			<tr>
				<td>Ціна</td>
				<td>${apartment.price} грн.</td>
			</tr>
			<tr>
				<td>Використовується</td>
				<td>
					<c:if test="${apartment.booking==false}" >
					Ні
					</c:if>
					<c:if test="${apartment.booking==true}" >
					Так
					</c:if>
				</td>
			</tr>
			<tr>
				<td>Опис</td>
				<td>${apartment.description}</td>
			</tr>
			<tr><td colspan="2"><b>Додатково: </b>
				<c:forEach items="${apartment.attributes}" var="attribute" varStatus="itr">
					
						${attribute.title},
				</c:forEach>
						</td>
			</tr>
		</tbody>
	</table>
			</div>
		</div>
	</div>



</body>
</html>
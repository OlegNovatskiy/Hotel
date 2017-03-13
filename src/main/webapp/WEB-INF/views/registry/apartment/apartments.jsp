<%@page import="com.hotel.components.entity.Apartment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Кімнати</title>
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
				<%@ include file="formFilter.jsp" %>
			</div>
			<div class="content col-md-9">
			
			<c:if test="${apartments.size()>0}">
			
				<table class="table table-bordered">
		<tr>
			<th>Номер</th>
			<th>Ціна</th>
			<th>Стан</th>
			<th>К-сть людей</th>
			<th>Дії</th>
		</tr>
		<tbody>
						
			<c:forEach items="${apartments}" var="apartment" varStatus="itr">
				<tr>
					<td>${apartment.number}</td>
					<td>${apartment.price}</td>
					<td>
					<c:if test="${apartment.booking==false}" >
					Вільна
					</c:if>
					<c:if test="${apartment.booking==true}" >
					Використовується
					</c:if>
					</td>
					<td> ${apartment.peopleCount}</td>
					<td>
					
					<c:if test="${apartment.booking==false}" >
					<a class="edit" href="/registry/booking/${apartment.id}" title="Бронювати"><i class="glyphicon glyphicon-lock"></i></a>
					</c:if>
						<a class="edit" href="/registry/apartment/${apartment.id}" title="Переглянути"><i class="glyphicon glyphicon-list-alt"></i></a>
						<a class="edit" href="/registry/apartment/edit/${apartment.id}" title="Редагування"><i class="glyphicon glyphicon-edit"></i></a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
	</table>
	</c:if>
	<c:if test="${apartments.size()==0 }">
	<h2>Кімнат не знайдено</h2>
	</c:if>
			</div>
		</div>
	</div>



</body>
</html>
<%@page import="com.hotel.components.entity.Apartment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Головна</title>
<link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/registry/css/main.css" rel="stylesheet" />
</head>
<body>
	<header>
		<%@ include file="../menu.jsp"%>
	</header>
	<div>
		<div class="wrapper">
			<div class="leftSideBar col-md-3 ">
				<%@ include file="leftSideBarBooking.jsp"%>
			</div>
			<div class="content col-md-9">
				<table class="table table-bordered">
					<tr>
						<th>Номер</th>
						<th>ПІБ</th>
						<th>Дата поселення</th>
						<th>Дата виселення</th>
						<th>Дії</th>
					</tr>
					<tbody>
						<c:forEach items="${bookedItems}" var="bookedItem" varStatus="itr">
								<tr>								
									<td>${bookedItem.numberApartment}</td>
									<td>
										${bookedItem.firstName} 
										${bookedItem.lastName.charAt(0)}.
										${bookedItem.middleName.charAt(0)}.
									</td>
									<td>${bookedItem.beginDate}</td>
									<td>${bookedItem.finishDate}</td>
									<td>
										<a class="edit" href="/registry/booked/${apartment.id}" title="Переглянути"><i class="glyphicon glyphicon-list-alt"></i></a>
										<!-- <a class="edit" href="/registry/booked/edit/${apartment.id}" title="Редагування"><i class="glyphicon glyphicon-edit"></i></a> -->
										<a class="edit" href="/registry/booked/trush/${apartment.id}" title="Зняти бронь"><i class="glyphicon glyphicon-trash"></i></a>
									</td>
								</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>

		</div>
	</div>



</body>
</html>
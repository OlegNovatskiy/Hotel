<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Номери готелю</title>
<link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/customer/css/main.css" rel="stylesheet" />
</head>
<body>
	<header>
		<%@ include file="menu.jsp"%>
	</header>
	<div class="wrapper">
		<div class="leftSideBar col-md-3 ">
			<%@ include file="apartmentFilter.jsp"%>
		</div>

		<%
			if (request.getMethod().equals("POST")) {
		%>

		<div class="content col-md-9">

			<c:forEach items="${apartments}" var="apartment" varStatus="itr">

				<div class="item  col-xs-4 col-lg-4">
					<form action="/customer/booking" method="POST">
						<input type="hidden" name="beginDate" value="${filterApartment.beginDate}">
						<input type="hidden" name="finishDate" value="${filterApartment.finishDate}">  
						<input type="hidden" name="idApartment" value="${apartment.id}" >
						<input type="hidden" name="numberApartment" value="${apartment.number}">
						<div class="thumbnail">
							<a href="/customer/apartment/${apartment.number}"> <img
								class="group list-group-image" src="${apartment.image}"
								alt="${apartment.number}">
							</a>

							<div class="caption">
								<a href="/customer/apartment/${apartment.number}"><h4
										class="group inner list-group-item-heading">Номер готелю
										- №${apartment.number}</h4></a>
								<p class="group inner list-group-item-text">
									${apartment.description}</p>

								<p class="group inner list-group-item-text">
									<b>Включно:</b>
									${apartment.attributes}
								</p>
								<div class="row">
									<div class="col-xs-12 col-md-6">
										<p class="lead">${apartment.price}грн.</p>
									</div>
									<div class="col-xs-12 col-md-6">
										<input class="btn btn-success" type="submit" value="Бронювати">
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>

			</c:forEach>


		</div>

		<%
			}
			if (request.getMethod().equals("GET")) {
		%>
		<div class="content col-md-9">
			<h4>Введіть дані у поля зліва і натисніть пошук для відображення
				можливих кімнат для поселення.</h4>
		</div>
		<%
			}
		%>
		<div class="cf"></div>
	</div>
	<%@ include file="footer.jsp"%>


</body>
</html>
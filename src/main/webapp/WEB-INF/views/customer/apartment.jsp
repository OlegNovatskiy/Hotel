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

		<div class="content col-md-9">
				<div class="item  col-xs-12 col-lg-12">
						<div class="thumbnail">
						<div class="cf galery">
						<div class="col-xs-4 col-lg-4">
							<img class="" src="${apartment.image}" alt="${apartment.number}">
						</div>
						<div class="col-xs-8 col-lg-8">
							<div class="caption">
								<h4	class="group inner list-group-item-heading">Номер готелю - №${apartment.number}</h4>
								<p class="group inner list-group-item-text">${apartment.description}</p>
								<p class="group inner list-group-item-text">
									<b>Включно: </b>
									${apartment.attributes}
								</p>
								<div class="row">
									<div class="col-xs-12 col-md-6">
										<p class="lead">${apartment.price}грн.</p>
									</div>
									
								</div>
							</div>
						</div>
						</div>
						<div class="cf galery">
							<h2 align="center">Галерея</h2>
							<div class="col-xs-3 col-lg-3">
								<img class="galery-img" src="${apartment.image}" alt="${apartment.number}">
							</div>
							<div class="col-xs-3 col-lg-3">
								<img class="galery-img" src="${apartment.image}" alt="${apartment.number}">
							</div>
							<div class="col-xs-3 col-lg-3">
								<img class="galery-img" src="${apartment.image}" alt="${apartment.number}">
							</div>
							<div class="col-xs-3 col-lg-3">
								<img class="galery-img" src="${apartment.image}" alt="${apartment.number}">
							</div>
						</div>
						<div class="cf message">
							<h2 align="center">Відгуки</h2>
							<p>
								Відгук 1
							</p>
							<p>
								Відгук 2
							</p>
							<p>
								Відгук 3
							</p>
							<p>
								Відгук 4
							</p>
						</div>
						</div>
				</div>
		</div>

		
		<div class="cf"></div>
	</div>
	<%@ include file="footer.jsp"%>


</body>
</html>
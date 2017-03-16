<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Клієнт</title>
<link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/registry/css/main.css" rel="stylesheet" />
</head>
<body>
	<header> <%@ include file="../menu.jsp"%>
	</header>
	<div>
		<div class="wrapper">
			<div class="content">
				
				<table class="table table-bordered">
					<tr>
						<th>Атрибут</th>
						<th>Значення</th>
					</tr>
					<tbody>
							<tr>
								<td>ПІБ</td>
								<td>${customer.firstName} ${customer.lastName.charAt(0)}. ${customer.middleName.charAt(0)}.</td>
							</tr>
							<tr>
								<td>email</td>
								<td>${customer.email}</td>
							</tr>
							<tr>
								<td>Тел. номер</td>
								<td>${customer.phoneNumber}</td>
							</tr>
							<tr>
								<td>
									Дата народження
								</td>
								<td>
									${customer.birthDate}
								</td>
							</tr>
							<tr>
								<td colspan="2">Адреса</td>
							</tr>
							<tr>
								<td>Країна</td>
								<td>${customer.country}</td>
							</tr>
							<tr>
								<td>Область</td>
								<td>${customer.region}</td>
							</tr>
							<tr>
								<td>Місто/Село</td>
								<td>${customer.city}</td>
							</tr>
							<tr>
								<td>Район</td>
								<td>${customer.district}</td>
							</tr>
							<tr>
								<td>Вулиця</td>
								<td>${customer.street}</td>
							</tr>
							<tr>
								<td>Будинок</td>
								<td>${customer.buildNumber}</td>
							</tr>
							<tr>
								<td>Квартира</td>
								<td>${customer.flatNumber}</td>
							</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>



</body>
</html>
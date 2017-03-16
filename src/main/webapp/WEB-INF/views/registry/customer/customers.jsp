<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Клієнти</title>
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
						<th>ПІБ</th>
						<th>email</th>
						<th>Тел. номер</th>
						<th>Дата народження</th>
						<th>Дії</th>
					</tr>
					<tbody>
						<c:forEach items="${customers}" var="customer">
							<tr>
								<td>
									${customer.firstName} ${customer.lastName.charAt(0)}. ${customer.middleName.charAt(0)}.
								</td>
								<td>
									${customer.email}
								</td>
								<td>
									${customer.phoneNumber }
								</td>
								<td>
									${customer.birthDate }
								</td>
								<td>
									<a class="edit" href="/registry/customer/${customer.id}" title="Переглянути"><i class="glyphicon glyphicon-list-alt"></i></a>
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5" align="center">
								<a href="/registry/customers/infiles"><input type="button" value="Вивести у файл"></a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>



</body>
</html>
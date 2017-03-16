<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Інформація</title>
<link type="text/css" href="/css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="/registry/css/main.css" rel="stylesheet" />
</head>
<body>
	<header> 
		<%@ include file="../menu.jsp"%>
	</header>
	<div>
		<div class="wrapper">
			<div class="content">

				<form:form name="bookingApartments" action="/registry/information" method="PUT">
					<table class="table table-bordered">
						<tr>
							<th>Атрибути</th>
							<th>Значення</th>
						</tr>
						<tbody>
							<tr>
								<td>
									Адреса:<br>
								</td>
								<td>
									<c:forEach items="${allInformation.address}" var="item">
										<input type="text" name="address" value="${item}"><br>
									</c:forEach>
								</td>
							</tr>
							<tr>
								<td>
									Телефони
								</td>
								<script>
								var count_id = 100;
									function addPhone(){
											var div = document.getElementById('phones');
	
											div.innerHTML = div.innerHTML + '<div id="phone-'+count_id+'\">'+
											'<input type="text" name="phoneNumbers" maxlength="20" value="${phone}">'+
											'<input type="button" onclick="deleteAttributeById(\'phone-' + count_id + '\')" value="Видалити номер"><br></div>';
											count_id++;
										}
									function addEmail(){
										var div = document.getElementById('emails');

										div.innerHTML = div.innerHTML + '<div id="email-'+count_id+'">'+
										'<input type="email" name="emails" value=" ${email}" >'+
										'<input type="button" onclick="deleteAttributeById(\'email-'+count_id+'\')" value="Видалити email">'+
										'<br></div>';
										count_id++;
									}

									function deleteAttributeById(idEmail){

										 var elem = document.getElementById(idEmail);
										 elem.parentNode.removeChild(elem);
										
										}
								</script>
								<td>
									<div id="phones">
										<c:forEach items="${allInformation.phoneNumbers}" var="phone" varStatus="number_phone">
											<div id="phone-${number_phone.index}">	
												<input type="text" name="phoneNumbers" maxlength="20" value="${phone}">
												<input type="button" onclick="deleteAttributeById('phone-${number_phone.index}')" value="Видалити номеру">
												<br>
											</div>
										</c:forEach>
									</div>
									 <input type="button" onclick="addPhone()" value="Добавити номер"> 
								</td>
							</tr>
							<tr>
								<td>
									Email
								</td>
								<td>
									<div id="emails">
									
										<c:forEach items="${allInformation.emails}" var="email" varStatus="number_email">
											<div id="email-${number_email.index}">
												<input type="email" name="emails" value=" ${email}" >
												<input type="button" onclick="deleteAttributeById('email-${number_email.index}')" value="Видалити email">
												<br>
											</div>
										</c:forEach>
										
									</div>
									<input type="button" onclick="addEmail()" value="Добавити email">
								</td>
							</tr>
							<tr>
								<td>
									Текст головної сторінки
								</td>
								<td>
									
									<script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>
									<script type="text/javascript">
									    window.onload = function()
									    {
									        CKEDITOR.replace('globalInformation', {
									            toolbar: 'Full',
									        });
									    };
									</script>
										
									<textarea name="globalInformation" rows="100" cols="100">${allInformation.globalInformation}</textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="submit" value="Зберегти">
								</td>
							</tr>
						</tbody>
					</table>
					
				</form:form>
			</div>
		</div>
	</div>



</body>
</html>
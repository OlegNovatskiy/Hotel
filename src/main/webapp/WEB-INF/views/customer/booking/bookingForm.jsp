<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="col-md-6 col-md-offset-3" >
<h2>Бронювання номеру №${booking.numberApartment}</h2>
<form:form name="bookingApartments" action="/customer/booking" method="PUT">
	<input type="hidden" name="_METHOD" value="PUT"/>
	<input type="hidden" value="${booking.idApartment}" name="idApartment">
	<table class="table table-bordered">
		<tr>
			<th>Атрибути</th>
			<th>Значення</th>
		</tr>
		<tbody>
			
			<tr>
				<td>Дата заселення</td>
				<td>${booking.beginDate}
				<input type="hidden" value="${booking.numberApartment}" name = "numberApartment">
				<input type="hidden" value="${booking.beginDate}" name="beginDate"></td>
			</tr>
			<tr>
				<td>Дата виселення</td>
				<td>${booking.finishDate}
				<input type="hidden" value="${booking.finishDate}" name="finishDate"></td>
			</tr>
			<tr>
				<td>Прізвище</td>
				<td><input type="text" value ="${booking.firstName}" name="firstName" placeholder="Новацький" required="required">
			</tr>
			<tr>
				<td>Імя</td>
				<td><input type="text" value ="${booking.lastName}" name="lastName" placeholder="Олег" required="required">
			</tr>
			<tr>
				<td>По батькові</td>
				<td><input type="text" value ="${booking.middleName}" name="middleName" placeholder="Валерійович" required="required">
			</tr>
			<tr>
				<td>Тел. номер</td>
				<td><input type="text" value ="${booking.phoneNumber}" name="phoneNumber" placeholder="+380977777777" required="required">
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="email" value ="${booking.email}" name="email" required="required">
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Забронювати номер"
					class="btn btn-success">
			</tr>
		</tbody>
	</table>
</form:form>
</div>

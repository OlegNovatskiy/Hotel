<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>Бронювання номеру</h2>
<form name="bookingApartments" action="/registry/booking" method="POST">
	<table class="table table-bordered">
		<tr>
			<th>Атрибути</th>
			<th>Значення</th>
		</tr>
		<tbody>
			<tr>
				<td>Номер кімнати</td>
				<td><input type="text" maxlength=5 value ="${booking.numberApartment}" name="numberApartment" placeholder="432a" required="required">
				<span>${errorNumberApartment}</span>
				</td>
			</tr>
			<tr>
				<td>Дата заселення</td>
				<td><input type="date" value ="${booking.beginDate}" name="beginDate" required="required">
			</tr>
			<tr>
				<td>Дата вмселення</td>
				<td><input type="date" value ="${booking.finishDate}" name="finishDate" required="required"> 
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
</form>

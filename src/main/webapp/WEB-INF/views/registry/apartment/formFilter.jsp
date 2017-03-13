<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<h2>Фільтрування </h2>
<form name="addApartments" action="/registry/apartments" method="POST">
	<table class="table table-bordered">
		<tr>
			<th>Назва атрибутів</th>
		</tr>
		<tbody>
			<tr>
				<td>Номер кімнати<br>
				<input type="text" maxlength=5 value ="${apartment.number}" name="number" placeholder="432a">
			</tr>
			<tr>
				<td>Кількість поселенців<br>
				<input type="text" maxlength=2 value ="${apartment.peopleCount}" name="peopleCount">
			</tr>
			<tr>
				<td>Кількість ліжок<br>
				<input type="text" maxlength=2 value ="${apartment.bedCount}" name="bedCount">
			</tr>
			<tr>
				<td>Кількість кімнат<br>
				<input type="text" maxlength=2 value ="${apartment.roomCount}" name="roomCount">
			</tr>
			<tr>
				<td>Ціна<br>
				<span>Мінімальна - Максимальна</span><br>
				<input type="text" maxlength=5 value ="${apartment.minPrice}" name="minPrice" style="width: 75px"> -
				<input type="text" maxlength=5 value ="${apartment.maxPrice}" name="maxPrice" style="width: 75px">
			</tr>
			<tr>
				<td>
					Використовуються:<br>
					<input type="radio" name="booking" value="true">Так
					<input type="radio" name="booking" value="false">Ні
				</td>
			</tr>
			<c:forEach items="${attributes}" var="attribute" varStatus="itr">
				<tr>
					<td>
					<input type="checkbox" name="attrs" value="${attribute.id}">  
					${attribute.title}</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td><input type="submit" value="Фільтрувати"
					class="btn btn-success">
			</tr>
		</tbody>
	</table>
</form>

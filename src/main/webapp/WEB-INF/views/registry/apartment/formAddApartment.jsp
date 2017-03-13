<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>Добавлення кімнати</h2>
<form name="addApartments" action="/registry/apartment/add" method="POST" o>
	<table class="table table-bordered">
		<tr>
			<th>Назва атрибутів</th>
			<th>Вміст</th>
		</tr>
		<tbody>
			<tr>
				<td>Номер кімнати</td>
				<td><input type="text" maxlength=5 value ="${apartment.number}" name="number" placeholder="432a" required="required">
			</tr>
			<tr>
				<td>Макс.кількість поселенців</td>
				<td><input type="text" maxlength=2 value ="${apartment.peopleCount}" name="peopleCount"required="required">
			</tr>
			<tr>
				<td>Кількість ліжок</td>
				<td><input type="text" maxlength=2 value ="${apartment.bedCount}" name="bedCount"required="required">
			</tr>
			<tr>
				<td>Кількість кімнат</td>
				<td><input type="text" maxlength=2 value ="${apartment.roomCount}" name="roomCount"required="required">
			</tr>
			<tr>
				<td>Ціна</td>
				<td><input type="text" maxlength=5 value ="${apartment.price}" name="price"required="required">
			</tr>
			<tr>
				<td>Опис</td>
				<td><textarea name="description">${apartment.description}</textarea>
			</tr>
			<c:forEach items="${attributes}" var="attribute" varStatus="itr">
				<tr>
					<td>${attribute.title}</td>
					<td>
					<input type="checkbox" name="attrs" value="${attribute.id}">  
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="2"><input type="submit" value="Добавити кімнату"
					class="btn btn-success">
			</tr>
		</tbody>
	</table>
</form>

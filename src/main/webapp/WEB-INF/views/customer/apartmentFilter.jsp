<%@page import="com.hotel.components.entity.Attribute"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hotel.components.entity.CustomerFilterApartments"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<form name="addApartments" action="/customer/apartments" method="POST">
	<table class="table table-bordered">
		<tr>
			<th>Пошук</th>
		</tr>
		<tbody>
			<tr>
				<td>Дата заселення<br> <input type="date"
					value="${filterApartment.beginDate}" name="beginDate" required="required"></td>
			</tr>

			<tr>
				<td>Дата виселення<br> <input type="date"
					value="${filterApartment.finishDate}" name="finishDate" required="required"></td>
			</tr>
			<tr>
				<td>Кількість поселенців<br> <input type="text"
					maxlength=2 value="${filterApartment.peopleCount}" name="peopleCount"></td>
			</tr>
			<tr>
				<td>Кількість ліжок<br> <input type="text" maxlength=2
					value="${filterApartment.bedCount}" name="bedCount"></td>
			</tr>
			<tr>
				<td>Кількість кімнат<br> <input type="text" maxlength=2
					value="${filterApartment.roomCount}" name="roomCount"></td>
			</tr>
			<tr>
				<td>Ціна<br> <span>Мінімальна - Максимальна</span><br>
					<input type="text" maxlength=5 value="${filterApartment.minPrice}"
					name="minPrice" style="width: 75px"> - <input type="text"
					maxlength=5 value="${filterApartment.maxPrice}" name="maxPrice"
					style="width: 75px">
			</tr>

			<%
				if(request.getMethod().equals("GET")){
			%>
				<c:forEach items="${attributes}" var="attribute" varStatus="itr">
					<tr>
						<td><input type="checkbox" name="attrs"
							value="${attribute.id}"> ${attribute.title}</td>
					</tr>
				</c:forEach>

			<%}
					if(request.getMethod().equals("POST")){
						CustomerFilterApartments filterApartments = (CustomerFilterApartments) request.getAttribute("filterApartment");
						ArrayList<Attribute> attribute = (ArrayList<Attribute>)request.getAttribute("attributes");
						String[] attributeFilter = filterApartments.getAttributes();
						if(attributeFilter == null || attributeFilter.length==0){%>
							<c:forEach items="${attributes}" var="attribute" varStatus="itr">
								<tr>
									<td><input type="checkbox" name="attrs"
										value="${attribute.id}"> ${attribute.title}</td>
								</tr>
							</c:forEach>
						<%}else{
							for(Attribute attr : attribute){
								String lineAttribute = "<tr><td><input type=\"checkbox\" name=\"attrs\" value=\"%d\"> %s</td></tr>";
								for(String attrFilter : attributeFilter){
									if(attr.getId().toString().equals(attrFilter)){
										lineAttribute = "<tr><td><input type=\"checkbox\" name=\"attrs\" value=\"%d\"  checked=\"checked\"> %s</td></tr>";
										break;
									}
								}
								
								out.print(String.format(lineAttribute	, attr.getId(), attr.getTitle()));
							}
						}
					}
					
					
					%>


			<tr>
				<td><input type="submit" value="Шукати" class="btn btn-success">
					</td>
			</tr>
		</tbody>
	</table>
</form>

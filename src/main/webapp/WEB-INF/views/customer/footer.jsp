<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<footer>
	<div class="footer" id="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-2 col-sm-4 col-xs-6">
					<h3>Адреса</h3>
					<ul>
						<c:forEach items="${contactInformation.address}" var="address" varStatus="itr">
						<li>${address}</li>
						</c:forEach>
					</ul>
				</div>
				<div class="col-lg-3  col-md-2 col-sm-4 col-xs-6">
					<h3>Номери телефонів</h3>
					<ul>

						<c:forEach items="${contactInformation.phoneNumbers}" var="number"
							varStatus="itr">
							<li>${number}</li>
						</c:forEach>
					</ul>
				</div>

				<div class="col-lg-3  col-md-2 col-sm-4 col-xs-6">
					<h3>Email</h3>
					<ul>
						<c:forEach items="${contactInformation.emails}" var="email">
							<li>${email}</li>
						</c:forEach>
					</ul>
				</div>

				<div class="col-lg-3  col-md-4 col-sm-4 col-xs-6 pull-right">
					<h3>Соціальні мережі</h3>
					<ul class="social ">
						<li><a href="#"> <i class=" fa fa-facebook"> </i>
						</a></li>
						<li><a href="#"> <i class="fa fa-twitter"> </i>
						</a></li>
						<li><a href="#"> <i class="fa fa-google-plus"> </i>
						</a></li>
						<li><a href="#"> <i class="fa fa-youtube"> </i>
						</a></li>
					</ul>
				</div>
			</div>
			<!--/.row-->
		</div>
		<!--/.container-->
	</div>
	<!--/.footer-->

	<div class="footer-bottom">
		<div class="container">
			<p class="pull-left">© 2017, Готель "Керпач"</p>

		</div>
	</div>
	<!--/.footer-bottom-->
</footer>
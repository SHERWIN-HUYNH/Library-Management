<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Sách</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon"
	href="<c:url value='/assets/images/apple-touch-icon.png'/>">
<link rel="shortcut icon" type="image/ico"
	href="<c:url value='/assets/images/favicon.ico'/>">

<!-- Plugin-CSS -->
<link rel="stylesheet"
	href="<c:url value='/assets/css/bootstrap.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/owl.carousel.min.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/icofont.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/animate.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/cardslider.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/responsiveslides.css'/>">

<!-- Main-Stylesheets -->
<link rel="stylesheet" href="<c:url value='/assets/css/normalize.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/overright.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/theme.css'/>">
<link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
<link rel="stylesheet"
	href="<c:url value='/assets/css/responsive.css'/>">
<script src="<c:url value='/assets/js/vendor/modernizr-2.8.3.min.js'/>"></script>

</head>

<body data-spy="scroll" data-target="#mainmenu" data-offset="50">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->
		<div class="overlay-bg relative">
			<img src="<c:url value= "/assets/images/slide/slide1.jpg"/>"
				alt="library">
		</div>
		<!-- Mainmenu-markup-start -->
		<div class="mainmenu-area navbar-fixed-top affix-top" data-spy="affix"
			data-offset-top="10">
			<nav class="navbar">
				<div class="container">
					<div class="navbar-header">
						<div class="space-10"></div>
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#mainmenu">
							<span class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<!--Logo-->
						<!-- <a href="#sc1" class="navbar-left show"><img src="images/logo.png" alt="library"></a> -->
						<div class="space-10"></div>
					</div>
					<!--Mainmenu list-->
					<%@include file="/WEB-INF/views/shared/header.jsp"%>
			</nav>
		</div>
		<div class="space-100"></div>
		<!-- Mainmenu-markup-end -->
		<!-- Header-jumbotron -->
		<div class="space-100"></div>
		<div class="header-text">
			<div class="container fix">
				<div class="row wow fadeInUp"
					style="visibility: visible; animation-name: fadeInUp;">
					<div class="col-xs-12 col-sm-10 col-sm-offset-1 text-center">
						<div class="jumbotron">
							<h1 class="text-white">Chọn sách của bạn và tận hưởng</h1>
						</div>
						<div class="title-bar white">
							<ul class="list-inline list-unstyled">
								<li><i class="icofont icofont-square"></i></li>
								<li><i class="icofont icofont-square"></i></li>
							</ul>
						</div>
						<div class="space-40"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="space-100"></div>
		<!-- Header-jumbotron-end -->
	</header>
	<section>
		<div class="space-80"></div>
		<div class="container">
			<div class="row">
				<!-- Sidebar-Start -->
				<div class="col-xs-12 col-md-2">
					<aside>
						<div class="single-sidebar">
							<h4>
								<i class="icofont icofont-listine-dots"></i> Danh mục
							</h4>
							<hr>
							<ul class="list-unstyled menu-tip">
								<c:forEach var="category" items="${categories}">
									<li><a href="#"><c:out value="${category.name}" /></a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="space-20"></div>
					</aside>
				</div>
				<!-- Sidebar-End -->
				<div class="col-xs-12 col-md-10 pull-right">
					<h4>Tìm kiếm</h4>
					<div class="space-5"></div>
					<form:form action="${pageContext.request.contextPath}/timKiemSach"
						method="POST" modelAttribute="search">
						<div class="input-group">
							<form:input type="text" class="form-control"
								placeholder="Nhập tên sách muốn tìm" path="bookName"
								id="tenSach" />
							<div class="input-group-btn">
								<button type="submit" class="btn btn-primary">
									<i class="icofont icofont-search-alt-2"></i>
								</button>
							</div>
						</div>
					</form:form>
					<div class="space-30"></div>
					<div class="row">
						<div class="pull-left col-xs-12 col-sm-5 col-md-6">
							<p>
								<strong>${booksDto.size()}</strong> cuốn sách được tìm thấy
							</p>
						</div>
					</div>
					<hr>
					<div class="space-20"></div>
					<div class="row">
						<c:forEach var="book" items="${booksDto}">
							<div class="col-xs-12 col-md-6">
								<div class="category-item well yellow">
									<div class="media">
										<div class="media-left">
											<img
												src="<c:url value='/assets/images/book/${book.bookImage}'/>"
												class="media-object" style="width: 120px; height: 150px;"
												alt="">
										</div>
										<div class="media-body">
											<h4>${book.bookName}</h4>
											<h6>Tác giả: ${book.authorName}</h6>
											<h6>Thể loại: ${book.categoryName}</h6>
											<div class="space-10"></div>
											<p>Đọc để hiểu, thư giãn tâm hồn</p>
											<a href="<c:url value = "/bookDetail/${book.bookId}"/>"
												class="text-primary">See the Book</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<div class="space-60"></div>
						<div class="row">
							<div class="col-xs-12">
								<div class="shop-pagination pull-right">
									<ul id="pagination-demo" class="pagination-sm pagination">
										<li class="page-item first disabled"><a href="#"
											class="page-link"><i class="icofont icofont-double-left"></i></a></li>
										<li class="page-item prev disabled"><a href="#"
											class="page-link"><i class="icofont icofont-simple-left"></i></a></li>
										<li class="page-item active"><a href="#"
											class="page-link">1</a></li>
										<li class="page-item"><a href="#" class="page-link">2</a></li>
										<li class="page-item"><a href="#" class="page-link">3</a></li>
										<li class="page-item next"><a href="#" class="page-link"><i
												class="icofont icofont-simple-right"></i></a></li>
										<li class="page-item last"><a href="#" class="page-link"><i
												class="icofont icofont-double-right"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="space-80"></div>
	</section>
	<!-- Footer-Area -->
	<footer class="black-bg text-white">
		<div class="space-60"></div>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-4">
					<a href="#"><img src="<c:url value='/assets/images/logo.png'/>"
						alt="library"></a>
					<div class="space-20"></div>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut
						gravida, quam vitae est Sed non eros elementum nulla sodales
						ullamcorper.</p>
					<div class="space-10"></div>
					<ul class="list-inline list-unstyled social-list">
						<li><a href="#"><i
								class="icofont icofont-social-facebook"></i></a></li>
						<li><a href="#"><i class="icofont icofont-social-twitter"></i></a></li>
						<li><a href="#"><i class="icofont icofont-social-behance"></i></a></li>
						<li><a href="#"><i class="icofont icofont-brand-linkedin"></i></a></li>
					</ul>
					<div class="space-10"></div>
					<ul class="list-unstyled list-inline tip yellow">
						<li><i class="icofont icofont-square"></i></li>
						<li><i class="icofont icofont-square"></i></li>
						<li><i class="icofont icofont-square"></i></li>
					</ul>
				</div>
				<div class="col-xs-12 col-sm-4 col-md-3 col-md-offset-1">
					<h4 class="text-white">Liên hệ</h4>
					<div class="space-20"></div>
					<table class="table border-none addr-dt">
						<tbody>
							<tr>
								<td><i class="icofont icofont-social-google-map"></i></td>
								<td><address>3050 Universal Blvd #190 Fort
										Lauderdale, FL, 33331, Sydney New York City</address></td>
							</tr>
							<tr>
								<td><i class="icofont icofont-email"></i></td>
								<td>susislibrary@domain.com</td>
							</tr>
							<tr>
								<td><i class="icofont icofont-phone"></i></td>
								<td>+62 582 528 527 21</td>
							</tr>
							<tr>
								<td><i class="icofont icofont-globe-alt"></i></td>
								<td><a href="www.susislibrary.html" target="_blank">www.susislibrary.com</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="space-60"></div>
	</footer>
	<!-- Footer-Area-End -->

	<!-- Vandor-JS -->
	<script src="<c:url value='/assets/js/vendor/jquery-1.12.4.min.js'/>"></script>
	<script src="<c:url value='/assets/js/vendor/bootstrap.min.js'/>"></script>
	<!-- Plugin-JS -->
	<script src="<c:url value='/assets/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/assets/js/responsiveslides.min.js'/>"></script>
	<script src="<c:url value='/assets/js/jquery.cardslider.min.js'/>"></script>
	<script src="<c:url value='/assets/js/pagination.js'/>"></script>
	<script src="<c:url value='/assets/js/scrollUp.min.js'/>"></script>
	<script src="<c:url value='/assets/js/wow.min.js'/>"></script>
	<script src="<c:url value='/assets/js/plugins.js'/>"></script>
	<!-- Active-JS -->
	<script src="<c:url value='/assets/js/main.js'/>"></script>
	<a id="scrollUp" href="#top"
		style="position: fixed; z-index: 2147483647; display: none;"><i
		class="icofont icofont-long-arrow-up"></i></a>
</body>
</html>

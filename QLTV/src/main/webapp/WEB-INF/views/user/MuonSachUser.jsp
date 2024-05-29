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
							<%-- <h4>
								<i class="icofont icofont-listine-dots"></i> Danh mục
							</h4>
							<hr>
							<ul class="list-unstyled menu-tip">
								<c:forEach var="category" items="${categories}">
									<li><a href="#" onclick="filterCategory(${category.id})">${category.name}</a></li>
								</c:forEach>
							</ul> --%>
						</div>
						<div class="space-20"></div>
					</aside>
				</div>
				<!-- Sidebar-End -->
				<div class="col-xs-12 col-md-10 pull-right">
					<p>
						Bạn hãy trả sách trong vòng <strong>30</strong> ngày sau khi mượn
						nhé! Chúc bạn có những trải nghiệm thật thú vị với sách của chúng
						tôi!
					</p>
					<hr>
					<div class="space-20"></div>
					<div class="row">
						<div class="card-body card-block">
							<form:form action="muonSachUser" method="post"
								modelAttribute="insert" class="form-horizontal">
								<div class="row form-group">
									<div class="col col-md-3">
										<label path="bookId" for="book_num_input"
											class="form-control-label">Tên Sách</label>
									</div>
									<div class="col-12 col-md-9">
										<form:select path="bookId" name="selectBookId"
											id="selectBookId" class="form-control">
											<c:forEach var="book" items="${books}">
												<option value="${book.getId()}">${book.getName()}</option>
											</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="amounts_input" class="form-control-label">Số
											lượng</label>
									</div>
									<div class="col-12 col-md-9">
										<form:input type="number" name="numberSoLuong"
											class="form-control" step="1" required="required"
											pattern="[1-5]" title="" min="1" path="amount" />
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="readerId" class="form-control-label">Mã
											Người Đọc</label>
									</div>
									<div class="col-12 col-md-9">
										<form:input type="text" path="readerId" name="name"
											class="form-control"  readonly="readonly" 
											value="${sessionScope.LoginReader.id}" />
									</div>
								</div>
								<button type="submit" class="btn btn-success btn-sm">
									<i class="fa fa-check"></i> Mượn Sách
								</button>
							</form:form>
							<hr>
							<p>
								Chúng tôi sẽ giao sách đến cho bạn sau <strong>1-2</strong>
								ngày.
							</p>
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
	<script type="text/javascript">
		var message = "${message}";
		if (message && message.trim().length > 0) {
			// Display an alert with the message content
			alert(message);
		}

		function filterCategory(id) {
			var form = document.getElementById('categoryFilterForm');
			document.getElementById('selectedId').value = id;
			form.action = '${pageContext.request.contextPath}/filterCategory/'
					+ id;
			form.submit();
		}
	</script>
	<a id="scrollUp" href="#top"
		style="position: fixed; z-index: 2147483647; display: none;"><i
		class="icofont icofont-long-arrow-up"></i></a>
</body>
</html>

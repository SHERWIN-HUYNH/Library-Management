<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Thông báo</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon"
	href="<c:url value= "/assets/images/apple-touch-icon.png" />">
<link rel="shortcut icon" type="image/ico"
	href="<c:url value= "/assets/images/favicon.ico" />" />
<!-- Plugin-CSS -->
<link href="<c:url value= "/assets/css/bootstrap.min.css" />"
	rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value= "/assets/css/icofont.css"/>">
<link rel="stylesheet" href="<c:url value= "/assets/css/animate.css"/>">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/cardslider.css"/>">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/responsiveslides.css"/>">
<!-- Main-Stylesheets -->
<link rel="stylesheet"
	href="<c:url value= "/assets/css/normalize.css"/>">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/overright.css" />">
<link rel="stylesheet" href="<c:url value= "/assets/css/theme.css" />">
<link rel="stylesheet" href="<c:url value= "/assets/style.css" />">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/responsive.css" />">
<script
	src="<c:url value= "/assets/js/vendor/modernizr-2.8.3.min.js" />"></script>
</head>
</head>
<body data-spy="scroll" data-target="#mainmenu" data-offset="50">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->
		<div class="overlay-bg relative">
			<img src="<c:url value= "/assets/images/slide/slide1.jpg" />" alt="">
		</div>
		<!-- Mainmenu-markup-start -->
		<div class="mainmenu-area navbar-fixed-top" data-spy="affix"
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
					<!--Toggle-button-->
					<!--Active User-->
					<div class="nav navbar-right">
						<div class="active-user navbar-left active">
							<ul class="list-unstyled">
								<li><a href="#" class="dropdown-toggle"
									data-toggle="dropdown"> <img
										src="<c:url value= "/assets/images/active_user.png" />"
										class="img-circle img-thumbnail" alt="library" />
								</a>
									<ul class="dropdown-menu">
										<li><a href="#"> <span><i
													class="icofont icofont-user"></i></span> Thông tin cá nhân
										</a></li>
										<!-- <li>
                                            <a href="#"> <span><i class="icofont icofont-notification"></i></span> Notifications</a>
                                        </li> -->
										<li><a href="#"> <span><i
													class="icofont icofont-ui-password"></i></span> Đổi mật khẩu
										</a></li>
										<li><a href="#"> <span><i
													class="icofont icofont-read-book"></i></span> Sách của tôi
										</a></li>
										<li><a href="#"> <span><i
													class="icofont icofont-logout"></i></span> Đăng xuất
										</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
					<!--Mainmenu list-->
					<div class="navbar-right in fade" id="mainmenu">
						<ul class="nav navbar-nav nav-white text-uppercase">
							<li><a href="<c:url value = "/"/>">Trang chủ</a></li>
							<li><a href="#">Giới thiệu</a></li>
							<li class="active"><a
								href="<c:url value = "/notification"/>">Thông báo</a></li>
							<li><a href="<c:url value = "/sach"/>">Sách</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		<div class="space-100"></div>
		<!-- Mainmenu-markup-end -->
		<!-- Header-jumbotron -->
		<div class="space-100"></div>
		<div class="header-text">
			<div class="container">
				<div class="row wow fadeInUp">
					<div class="col-xs-12 col-sm-10 col-sm-offset-1 text-center">
						<div class="jumbotron">
							<h1 class="text-white">Thông báo của thư viện</h1>
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
				<div class="col-xs-12 col-md-3">
					<aside>
						<div class="space-30"></div>
						<div class="sigle-sidebar">
							<h4>
								<i class="icofont icofont-filter"></i> Bộ lọc
							</h4>
							<hr>
							<ul class="list-unstyled menu-tip">
								<li><a href="#">Tất cả</a></li>
								<li><a href="#">Tháng 1</a></li>
								<li><a href="#">Tháng 2</a></li>
								<li><a href="#">Tháng 3</a></li>
								<li><a href="#">Tháng 4</a></li>
								<li><a href="#">Tháng 5</a></li>
								<li><a href="#">Tháng 6</a></li>
								<li><a href="#">Tháng 7</a></li>
								<li><a href="#">Tháng 8</a></li>
								<li><a href="#">Tháng 9</a></li>
								<li><a href="#">Tháng 10</a></li>
								<li><a href="#">Tháng 11</a></li>
								<li><a href="#">Tháng 12</a></li>
							</ul>
						</div>
						<div class="space-20"></div>
					</aside>
				</div>
				<!-- Sidebar-End -->
				<div class="col-xs-12 col-md-9 pull-right">
					<div class="space-30"></div>
					<hr>
					<div class="space-20"></div>
					<div class="row">
						<div class="row event-list">
							<div class="col-xs-12 col-md-7 col-md-offset-1">
								<c:forEach var="notification" items="${notifications}">
									<div class="event-item wow fadeInRight">
										<h4 class="show tip-left">${notification.dayCreated}</h4>
										<div class="well">
											<div class="media">
												<div class="media-left">
													<img
														src="<c:url value= "/assets/images/evemt/${notification.image}" />"
														class="media-object" alt="library">
												</div>
												<div class="media-body">
													<div class="space-10"></div>
													<a href="books.html"><strong class="media-heading">${notification.title}</strong></a>
													<div class="space-10"></div>
													<p>${notification.content}</p>
												</div>
											</div>
										</div>
									</div>
									<div class="space-20"></div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="space-60"></div>
					<div class="row">
						<div class="col-xs-12">
							<div class="shop-pagination pull-right">
								<ul id="pagination-demo" class="pagination-sm pagination">
									<li class="page-item first"><a href="#" class="page-link">First</a></li>
									<li class="page-item prev"><a href="#" class="page-link">Previous</a></li>
									<li class="page-item"><a href="#" class="page-link">1</a></li>
									<li class="page-item"><a href="#" class="page-link">2</a></li>
									<li class="page-item active"><a href="#" class="page-link">3</a></li>
									<li class="page-item"><a href="#" class="page-link">4</a></li>
									<li class="page-item"><a href="#" class="page-link">5</a></li>
									<li class="page-item"><a href="#" class="page-link">6</a></li>
									<li class="page-item"><a href="#" class="page-link">7</a></li>
									<li class="page-item next"><a href="#" class="page-link">Next</a></li>
									<li class="page-item last"><a href="#" class="page-link">Last</a></li>
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
					<a href="#"><img
						src="<c:url value= "/assets/images/logo.png" />" alt="library"></a>
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
					</table>
				</div>
				<!-- <div class="col-xs-12 col-sm-4 col-md-3 col-md-offset-1">
                    <h4 class="text-white">Useful Link</h4>    <div class="space-20"></div>
                    <ul class="list-unstyled menu-tip">
                        <li><a href="books.html">Costumer Service</a></li>
                        <li><a href="books.html">Help Desk</a></li>
                        <li><a href="books.html">Forum</a></li>
                        <li><a href="books.html">Staff Profile</a></li>
                        <li><a href="books.html">Live Chat</a></li>
                    </ul>
                </div> -->
			</div>
		</div>
		<div class="space-60"></div>
	</footer>
	<!-- Footer-Area-End -->
	<!-- Vandor-JS -->
	<script src="<c:url value= "/assets/js/vendor/jquery-1.12.4.min.js" />"></script>
	<script src="<c:url value= "/assets/js/vendor/bootstrap.min.js" />"></script>
	<!-- Plugin-JS -->
	<script src="<c:url value= "/assets/js/owl.carousel.min.js" />"></script>
	<script src="<c:url value= "/assets/js/responsiveslides.min.js" />"></script>
	<script src="<c:url value= "/assets/js/jquery.cardslider.min.js" />"></script>
	<script src="<c:url value= "/assets/js/pagination.js" />"></script>
	<script src="<c:url value= "/assets/js/scrollUp.min.js" />"></script>
	<script src="<c:url value= "/assets/js/wow.min.js" />"></script>
	<script src="<c:url value= "/assets/js/plugins.js" />"></script>
	<!-- Active-JS -->
	<script src="<c:url value= "/assets/js/main.js" />"></script>
</body>
</html>
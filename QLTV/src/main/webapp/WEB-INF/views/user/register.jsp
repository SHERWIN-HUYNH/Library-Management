<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/user/taglib.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Đăng ký</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon"
	href="<c:url value ="/assets/images/apple-touch-icon.png"/>">
<link rel="shortcut icon" type="image/ico"
	href="<c:url value ="/assets/favicon.ico" />" />
<!-- Plugin-CSS -->
<link rel="stylesheet"
	href="<c:url value= "/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value= "/assets/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value= "/assets/css/icofont.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/animate.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/cardslider.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/responsiveslides.css"/>">
<!-- Main-Stylesheets -->
<link rel="stylesheet" href="<c:url value="/assets/css/normalize.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/overright.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/theme.css"/>">
<link rel="stylesheet" href="<c:url value="/assets/css/style.css"/>">
<link rel="stylesheet"
	href="<c:url value="/assets/css/responsive.css"/>">
<script src="<c:url value="/assets/js/vendor/modernizr-2.8.3.min.js"/>"></script>

</head>

<body data-spy="scroll" data-target="#mainmenu" data-offset="50">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->
		<div class="overlay-bg relative">
			<img src="<c:url value="assets/images/slide/slide2.jpg" />" alt="">
		</div>
		<!-- Mainmenu-markup-start -->
		<div class="mainmenu-area navbar-fixed-top" data-spy="affix"
			data-offset-top="10">
			<%-- <nav class="navbar">
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
					<div class="navbar-right in fade" id="mainmenu">
						<ul class="nav navbar-nav nav-white text-uppercase">
							<li><a href="index">Trang chủ</a></li>
							<li><a href="#">Giới thiệu</a></li>
							<li><a href="notification.html">Thông báo</a></li>
							<li><a href="books.html">Sách</a></li>
							<li class="active"><a href="<c:url value ="dang-nhap" />">Đăng
									nhập</a></li>
						</ul>
					</div>
				</div>
			</nav> --%>
			<%@include file ="/WEB-INF/views/shared/header.jsp" %>
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
							<h1 class="text-white">Đăng ký</h1>
							<h1 class="text-white">${status}</h1>
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
				<div class="row wow fadeInUp" data-wow-delay="0.5s">
					<div class="row">
						<div class="col-xs-12 col-md-8 col-md-offset-4">
							<form:form action="dang-ky" method="POST" modelAttribute="user" autocomplete="off">
								<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<form:label path="name">Họ và tên</form:label>
											<form:input type="text" class="form-control bg-none"
												placeholder="Họ và tên..." path="name" id="name" />
											<span id="name_error" style="color: red;"></span>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<form:label path="">Username</form:label>
											<form:input type="text" class="form-control bg-none"
												placeholder="Username..." path="username" id="username" />
											<span id="username_error" style="color: red;"></span>
										</div>
									</div>
								</div>

									<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<form:label path="email">Email</form:label>
											<form:input type="text" class="form-control bg-none"
												placeholder="Email..." path="email" id="mail"/>
											<span id="mail_error" style="color: red;"></span>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-xs-12 col-md-7">
										<div class="form-group">
											<form:label path="password">Password</form:label>
											<form:input type="password" class="form-control bg-none"
												placeholder="Mật khẩu..." path="password" />
											<span id="password_error" style="color: red;"></span>
										</div>
									</div>
								</div>

								<div class="space-20"></div>
								<div class="row">
									<div class="col-xs-12 col-sm-6">
										<button id="register_form" type="submit" class="btn btn-default">
											Đăng ký<i class="fa fa-long-arrow-right"></i>
										</button>
									</div>
								</div>

							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="space-100"></div>
		<!-- Header-jumbotron-end -->
	</header>

	<!-- Jquery JS-->
	<script src="<c:url value= "/assets/vendor/jquery-3.2.1.min.js"/>"></script>
	<!-- Bootstrap JS-->
	<script
		src="<c:url value= "/assets/vendor/bootstrap-4.1/popper.min.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/bootstrap-4.1/bootstrap.min.js"/>"></script>
	<!-- Vendor JS       -->
	<script src="<c:url value= "/assets/vendor/slick/slick.min.js"/>">
		
	</script>
	<script src="<c:url value= "/assets/vendor/wow/wow.min.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/animsition/animsition.min.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"/>">
		
	</script>
	<script
		src="<c:url value= "/assets/vendor/counter-up/jquery.waypoints.min.js"/>"></script>
	<script src="vendor/counter-up/jquery.counterup.min.js">
		
	</script>
	<script
		src="<c:url value= "/assets/vendor/circle-progress/circle-progress.min.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/perfect-scrollbar/perfect-scrollbar.js"/>"></script>
	<script
		src="<c:url value= "/assets/vendor/chartjs/Chart.bundle.min.js"/>"></script>
	<script src="<c:url value= "/assets/vendor/select2/select2.min.js"/>">
		
	</script>

	<!-- Main JS-->
	<script src="<c:url value= "/assets/js/main_admin.js"/>"></script>
	<script src="<c:url value= "/assets/js/validate_register.js"/>"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#nameerror").hide();
					
					$("#emailerror").hide();

					var name_error = false;
					var email_error = false;
					var phone_error = false;
					var address_error = false;

					function checkName() {
						if ($("#fullname").val().length == 0) {
							$("#nameerror").html("Vui lòng nhập vào họ tên");
							name_error = true;
							$("#nameerror").show();
						} else {
							name_error = false;
							$("#nameerror").hide();
						}

					}

				

					function checkEmail() {
						if ($("#email").val().length == 0) {
							$("#addresserror").html("Vui lòng nhập vào email");
							email_error = true;
							$("#emailerror").show();
						} else {
							email_error = false;
							$("#emailerror").hide();
						}
					}

					$("#register").click(
							function() {
								checkName();
								checkEmail();
								checkAddress();
							
								 function(result) {
										if (result == "errorEmail") {
											$("#addresserror").html(
													"Email đã được sử dụng");
											email_error = true;
											$("#emailerror").show();
										} else {
											email_error = false;
											$("#emailerror").hide();
											alert("Đăng kí thành công");
											location.reload();
										}
									});
								}
							});

				});
	</script>

</body>

</html>
<!-- end document-->

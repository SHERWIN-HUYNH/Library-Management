 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html class="no-js" lang="zxx">


<head>
<meta charset="UTF-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Thông tin cá nhân</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico in the root directory -->
<link rel="apple-touch-icon"
	href="<c:url value = "/assets/images/apple-touch-icon.png"/>">
<link rel="shortcut icon" type="image/ico"
	href="<c:url value = "/assets/images/favicon.ico"/>" />

<!-- Plugin-CSS -->
<link rel="stylesheet"
	href="<c:url value = "/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value = "/assets/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value = "/assets/css/icofont.css"/>">
<link rel="stylesheet" href="<c:url value = "/assets/css/animate.css"/>">
<link rel="stylesheet"
	href="<c:url value = "/assets/css/cardslider.css"/>">
<link rel="stylesheet"
	href="<c:url value = "/assets/css/responsiveslides.css"/>">

<!-- Main-Stylesheets -->
<link rel="stylesheet"
	href="<c:url value = "/assets/css/normalize.css"/>">
<link rel="stylesheet"
	href="<c:url value = "/assets/css/overright.css"/>">
<link rel="stylesheet" href="<c:url value = "/assets/css/theme.css"/>">
<link rel="stylesheet" href="<c:url value = "/assets/style.css"/>">
<link rel="stylesheet"
	href="<c:url value = "/assets/css/responsive.css"/>">
<script
	src="<c:url value = "/assets/js/vendor/modernizr-2.8.3.min.js"/>"></script>
</head>

<body data-spy="scroll" data-target="#mainmenu" data-offset="50">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->
		<div class="overlay-bg relative">
			<img src="<c:url value = "/assets/images/slide/slide1.jpg"/>" alt="">
		</div>
		<!-- Mainmenu-markup-start -->
		<div class="mainmenu-area navbar-fixed-top" data-spy="affix"
			data-offset-top="10">
			<!-- ============== HEADER ================= -->
			<%@include file="/WEB-INF/views/shared/header.jsp"%>
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
							<h1 class="text-white">Thông tin cá nhân</h1>
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
						<div class="sigle-sidebar">
							<h4>
								<i class="icofont icofont-listine-dots"></i> Danh mục
							</h4>
							<hr>
							<ul class="list-unstyled menu-tip">
								<li><a class="active" href="<c:url value="userInfo"/>">Thông
										tin cá nhân</a></li>
								<li><a href="<c:url value="UserChangePassword"/>">Đổi
										mật khẩu</a></li>
								<c:if test="${not empty sessionScope.LoginReader}">
									<!-- Hiển thị danh mục "Sách của tôi" chỉ khi người dùng không phải là admin -->
									<li><a href="<c:url value="userbook"/>">Sách của tôi</a></li>
								</c:if>
							</ul>
						</div>
						<div class="space-20"></div>
					</aside>
				</div>
				<!-- Sidebar-End -->
				<div class="col-xs-12 col-md-10 pull-right">
					<h4>Thông tin cá nhân</h4>
					<div class="space-20"></div>
					<div class="row">
						<div class="col-md-10 col-xs-12 col-md-offset-1">
							<form:form method="POST" action="updateUserInfo"
								modelAttribute="user">
								<div class="form-group">
									<label for="name">Họ và tên</label>
									<form:input path="name" id="nameUser" type="text"
										class="form-control" />
									<span id="nameUser_error" style="color: red;"></span>
								</div>
								<div class="form-group">
									<label for="username">Username</label>
									<form:input path="username" type="text" class="form-control"
										id="usernameUser" />
									<span id="usernameUser_error" style="color: red;"></span>
								</div>
								<div class="form-group">
									<label for="email">Email</label>
									<form:input path="email" type="email" class="form-control"
										id="emailUser" />
									<span id="emailUser_error" style="color: red;"></span>
								</div>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#staticBackdrop"
									id="userProfile_form" disabled>Chỉnh sửa</button>

								<!-- Dialog -->
								<div class="modal fade" id="staticBackdrop"
									data-backdrop="static" data-keyboard="false" tabindex="-1"
									aria-labelledby="staticBackdropLabel" aria-hidden="true"
									style="z-index: 1055 !important">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel1">Chú ý</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">
												<span class="text-danger"> Bạn có muốn chắc sửa thông
													tin cá nhân không? </span>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-warning  btn-secondary"
													data-dismiss="modal" style="margin-right: 10px;">Hủy</button>
												<button type="submit" class="btn btn-danger ">Sửa</button>
											</div>
										</div>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="space-80"></div>
	</section>
	<!-- Footer-Area -->
	<%@include file="/WEB-INF/views/shared/footer.jsp"%>
	<!-- Footer-Area-End -->

	<!-- Vandor-JS -->
	<script src="<c:url value = "/assets/js/vendor/jquery-1.12.4.min.js"/>"></script>
	<script src="<c:url value = "/assets/js/vendor/bootstrap.min.js"/>"></script>
	<!-- Plugin-JS -->
	<script src="<c:url value = "/assets/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value = "/assets/js/responsiveslides.min.js"/>"></script>
	<script src="<c:url value = "/assets/js/jquery.cardslider.min.js"/>"></script>
	<script src="<c:url value = "/assets/js/pagination.js"/>"></script>
	<script src="<c:url value = "/assets/js/scrollUp.min.js"/>"></script>
	<script src="<c:url value = "/assets/js/wow.min.js"/>"></script>
	<script src="<c:url value = "/assets/js/plugins.js"/>"></script>
	<!-- Active-JS -->
	<script src="<c:url value="assets/js/validate_userprofile.js"/>"></script>
	<script type="text/javascript">
		var message = "${messages}";
		if (message && message.trim().length > 0) {
			// Display an alert with the message content
			alert(message);
		}
	</script>
	<script src="<c:url value = "/assets/js/main.js"/>"></script>

</body>

</html>
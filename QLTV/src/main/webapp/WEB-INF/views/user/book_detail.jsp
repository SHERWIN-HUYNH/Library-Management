<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	href="<c:url value ="/assets/images/apple-touch-icon.png"/>">
<link rel="shortcut icon" type="image/ico"
	href="<c:url value ="/assets/images/favicon.ico"/>" />
<!-- Plugin-CSS -->
<link rel="stylesheet"
	href="<c:url value ="/assets/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value ="/assets/css/owl.carousel.min.css"/>">
<link rel="stylesheet" href="<c:url value ="/assets/css/icofont.css"/>">
<link rel="stylesheet" href="<c:url value ="/assets/css/animate.css"/>">
<link rel="stylesheet"
	href="<c:url value ="/assets/css/cardslider.css"/>">
<link rel="stylesheet"
	href="<c:url value ="/assets/css/responsiveslides.css"/>">
<!-- Main-Stylesheets -->
<link rel="stylesheet"
	href="<c:url value ="/assets/css/normalize.css"/>">
<link rel="stylesheet"
	href="<c:url value ="/assets/css/overright.css"/>">
<link rel="stylesheet" href="<c:url value ="/assets/css/theme.css"/>">
<link rel="stylesheet" href="<c:url value ="/assets/css/style.css"/>">
<link rel="stylesheet"
	href="<c:url value ="/assets/css/responsive.css"/>">
<script src="<c:url value ="/assets/js/vendor/modernizr-2.8.3.min.js"/>"></script>
</head>
<body data-spy="scroll" data-target="#mainmenu" data-offset="50">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->
		<div class="overlay-bg relative">
			<img src="<c:url value ="/assets/images/slide/slide1.jpg"/>" alt="">
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
										src="<c:url value ="/assets/images/active_user.png"/>"
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
							<li><a href="<c:url value = "/trang-chu"/>">Trang chủ</a></li>
							<li><a href="#">Giới thiệu</a></li>
							<li><a href="<c:url value = "/notification"/>">Thông báo</a></li>
							<!-- <li><a href="room.html">Phòng đọc</a></li>
							<li><a href="feedback.html">Phản hồi</a></li> -->
							<li class="active"><a href="<c:url value = "/sach"/>">Sách</a></li>
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
							<h1 class="text-white">Chi tiết cuốn sách</h1>
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
				<div class="col-xs-12 col-md-10 pull-right">
					<h4>Tìm kiếm</h4>
					<div class="space-5"></div>
					<form action="#">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Nhập tên sách hoặc tên tác giả">
							<div class="input-group-btn">
								<button type="submit" class="btn btn-primary">
									<i class="icofont icofont-search-alt-2"></i>
								</button>
							</div>
						</div>
					</form>
					<div class="space-30"></div>
					<div class="row">
						<!-- sắp xếp(từ từ tính) -->
						<!-- <div class="pull-right col-xs-12 col-sm-7 col-md-6">
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label class="control-label col-xs-4" for="sort">Sắp xếp theo : </label>
                                    <div class="col-xs-8">
                                        <div class="form-group">
                                            <select name="sort" id="sort" class="form-control">
                                                <option value="">Năm xuất </option>
                                                <option value="">Best Book</option>
                                                <option value="">Latest Book</option>
                                                <option value="">Old Book</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div> -->
					</div>
					<hr>
					<div class="space-20"></div>
					<div class="row">
							<div class="book-details-item">
								<h4 class="tip-left">Tiêu đề</h4>
								<div class="media-left">
									<img src="<c:url value ="/assets/images/book/${selectedId.bookImage}"/>"
										class="media-object author-photo img-thumbnail" alt="library">
								</div>

								<div class="media-body">
									<p class="lead">${selectedId.bookName}</p>
								</div>
								<div class="space-10"></div>
								<div class="row">
									<div class="col-xs-12 col-sm-8">
										<h4 class="tip-left">Tác giả</h4>
										<div class="media">
											<div class="media-left">
												<img src="<c:url value ="/assets/images/author/${selectedId.authorImage}"/>"
													class="media-object author-photo img-thumbnail"
													alt="library">
											</div>
											<div class="media-body">
												<h5>${selectedId.authorName}</h5>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-4">
										<h4>Thể loại</h4>
										<p>${selectedId.categoryName}</p>
									</div>
								</div>
								<div class="space-30"></div>
								<h4 class="tip-left">Mô tả</h4>
								<p>${selectedId.bookDescription}</p>
								<div class="space-20"></div>
								<h4 class="tip-left">Xếp hạng</h4>
								<ul class="list-inline list-unstyled rating-star">
									<li class="active"><i class="icofont icofont-star"></i></li>
									<li class="active"><i class="icofont icofont-star"></i></li>
									<li class="active"><i class="icofont icofont-star"></i></li>
									<li class=""><i class="icofont icofont-star"></i></li>
									<li><i class="icofont icofont-star"></i></li>
								</ul>
								<div class="space-20"></div>
								<a href="books.html" class="btn btn-primary hover-btn-default">Download</a>
								<div class="space-20"></div>
								<%-- <embed src="<c:url value ="/assets/pdf/ILAssemblyProg.pdf"/>"
									type="application/pdf" width="100%" height="700px"></embed> --%>
							</div>
					</div>
					<div class="space-60"></div>
				</div>
				<!-- Sidebar-Start -->
				<div class="col-xs-12 col-md-2">
					<aside>
						<div class="space-30"></div>
						<div class="sigle-sidebar">
							<h4>Danh mục</h4>
							<hr>
							<ul class="list-unstyled menu-tip">
								<c:forEach var="detail" items="${categories}">
									<li><a href="#">${detail.name}</a></li>
								</c:forEach>
							</ul>
							<a href="#" class="btn btn-primary btn-xs">Xem thêm</a>
						</div>
						<div class="space-20"></div>
					</aside>
				</div>
				<!-- Sidebar-End -->
			</div>
		</div>
		<div class="space-80"></div>
	</section>
	<!-- Footer-Area -->
	<%@include file="/WEB-INF/views/shared/footer.jsp"%>
	<!-- Footer-Area-End -->
	<!-- Vandor-JS -->
	<script src="<c:url value ="/assets/js/vendor/jquery-1.12.4.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/vendor/bootstrap.min.js"/>"></script>
	<!-- Plugin-JS -->
	<script src="<c:url value ="/assets/js/owl.carousel.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/responsiveslides.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/jquery.cardslider.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/pagination.js"/>"></script>
	<script src="<c:url value ="/assets/js/scrollUp.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/wow.min.js"/>"></script>
	<script src="<c:url value ="/assets/js/plugins.js"/>"></script>
	<!-- Active-JS -->
	<script src="<c:url value ="/assets/js/main.js"/>"></script>
</body>
</html>
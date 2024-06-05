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
	href="<c:url value='/assets/images/apple-touch-icon.png' />">
<link rel="shortcut icon" type="image/ico"
	href="<c:url value='/assets/images/favicon.ico' />" />
<!-- Plugin-CSS -->
<link href="<c:url value='/assets/css/bootstrap.min.css' />"
	rel="stylesheet">
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
<link rel="stylesheet"
	href="<c:url value='/assets/css/overright.css' />">
<link rel="stylesheet" href="<c:url value='/assets/css/theme.css' />">
<link rel="stylesheet" href="<c:url value='/assets/style.css' />">
<link rel="stylesheet"
	href="<c:url value='/assets/css/responsive.css' />">
<script src="<c:url value='/assets/js/vendor/modernizr-2.8.3.min.js' />"></script>
</head>
<body data-spy="scroll" data-target="#mainmenu" data-offset="50">
	<header class="relative" id="sc1">
		<!-- Header-background-markup -->
		<div class="overlay-bg relative">
			<img src="<c:url value='/assets/images/slide/slide1.jpg' />" alt="">
		</div>
		<!-- Mainmenu-markup-start -->
		<div class="mainmenu-area navbar-fixed-top affix-top" data-spy="affix"
			data-offset-top="10">
			<!-- ============== HEADER ================= -->
			<%@include file="/WEB-INF/views/shared/header.jsp"%>
		</div>
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
	</header>
	<section>
		<div class="space-80"></div>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-3">
					<aside>
						<div class="space-30"></div>
						<div class="sigle-sidebar">
							<h4>
								<i class="icofont icofont-filter"></i> Bộ lọc
							</h4>
							<hr>
							<ul class="list-unstyled menu-tip">
								<li><a href="#" onclick="filterNotifications(0)">Tất cả</a></li>
								<c:forEach var="month" begin="1" end="12">
									<li><a href="#" onclick="filterNotifications(${month})">Tháng
											${month}</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="space-20"></div>
					</aside>
				</div>
				<div class="col-xs-12 col-md-9 pull-right">
					<div class="space-20"></div>
					<div class="row">
						<div class="row event-list">
							<div class="col-xs-12 col-md-7 col-md-offset-1">
								<form id="notificationFilterForm"
									action="<c:url value='/notification/page' />" method="GET"
									style="display: none;">
									<input type="hidden" id="selectedMonth" name="month" value="0">
								</form>
								<c:if test="${empty pagination.content}">
									<div class="alert alert-info">${message}</div>
								</c:if>

								<c:if test="${not empty pagination.content}">
									<c:forEach var="notification" items="${pagination.content}">
										<div class="event-item wow fadeInRight">
											<h4 class="show tip-left">${notification.dayCreated}</h4>
											<div class="well">
												<div class="media">
													<div class="media-left">
														<img
															src="<c:url value="/assets/images/event/${notification.image}" />"
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
								</c:if>

							</div>
						</div>
					</div>
					<div class="space-60"></div>
					<div class="row">
						<div class="col-xs-12">
							<div class="text-center">
								<ul class="pagination pull-right">
									<li
										class="page-item ${pagination.currentPage == 1 ? 'disabled' : ''}">
										<a class="page-link"
										href="<c:url value="/notification/page?page=1&month=${selectedMonth}" />">First</a>
									</li>
									<li
										class="page-item ${pagination.currentPage == 1 ? 'disabled' : ''}">
										<a class="page-link"
										href="<c:url value='/notification/page?page=${pagination.currentPage - 1}&month=${selectedMonth}' />">Previous</a>
									</li>
									<c:forEach var="pageNumber" begin="1"
										end="${pagination.totalPages}">
										<li
											class="page-item ${pagination.currentPage == pageNumber ? 'active' : ''}">
											<a class="page-link"
											href="<c:url value='/notification/page?page=${pageNumber}&month=${selectedMonth}' />">${pageNumber}</a>
										</li>
									</c:forEach>
									<li
										class="page-item ${pagination.currentPage == pagination.totalPages ? 'disabled' : ''}">
										<a class="page-link"
										href="<c:url value='/notification/page?page=${pagination.currentPage + 1}&month=${selectedMonth}' />">Next</a>
									</li>
									<li
										class="page-item ${pagination.currentPage == pagination.totalPages ? 'disabled' : ''}">
										<a class="page-link"
										href="<c:url value='/notification/page?page=${pagination.totalPages}&month=${selectedMonth}' />">Last</a>
									</li>
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
	<%@include file="/WEB-INF/views/shared/footer.jsp"%>
	<!-- Footer-Area-End -->
	<!-- Vandor-JS -->
	<script src="<c:url value='/assets/js/vendor/jquery-1.12.4.min.js' />"></script>
	<script src="<c:url value='/assets/js/vendor/bootstrap.min.js' />"></script>
	<!-- Plugin-JS -->
	<script src="<c:url value='/assets/js/owl.carousel.min.js' />"></script>
	<script src="<c:url value='/assets/js/responsiveslides.min.js' />"></script>
	<script src="<c:url value='/assets/js/jquery.cardslider.min.js' />"></script>
	<script src="<c:url value='/assets/js/pagination.js' />"></script>
	<script src="<c:url value='/assets/js/scrollUp.min.js' />"></script>
	<script src="<c:url value='/assets/js/wow.min.js' />"></script>
	<script src="<c:url value='/assets/js/plugins.js' />"></script>
	<!-- Active-JS -->
	<script src="<c:url value='/assets/js/main.js' />"></script>
	<script>
        function filterNotifications(month) {
            document.getElementById('selectedMonth').value = month;
            document.getElementById('notificationFilterForm').submit();
        }
    </script>
</body>
</html>

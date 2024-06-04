<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="au theme template">
<meta name="keywords" content="au theme template">

<!-- Title Page-->
<title>Admin</title>

<!-- Fontfaces CSS-->
<link href="<c:url value= "/assets/css/font-face.css"/>"
	rel="stylesheet" media="all">
<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet'>
<link
	href="<c:url value= "/assets/vendor/font-awesome-4.7/css/font-awesome.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value= "/assets/vendor/font-awesome-5/css/fontawesome-all.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value= "/assets/vendor/mdi-font/css/material-design-iconic-font.min.css"/>"
	rel="stylesheet" media="all">
<!-- Bootstrap CSS-->
<link
	href="<c:url value= "/assets/vendor/bootstrap-4.1/bootstrap.min.css"/>"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link
	href="<c:url value= "/assets/vendor/animsition/animsition.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value= "/assets/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value= "/assets/vendor/wow/animate.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value= "/assets/vendor/css-hamburgers/hamburgers.min.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value= "/assets/vendor/slick/slick.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value= "/assets/vendor/select2/select2.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value= "/assets/vendor/perfect-scrollbar/perfect-scrollbar.css"/>"
	rel="stylesheet" media="all">


<!-- Main CSS-->
<link href="<c:url value= "/assets/css/theme_1.css"/>" rel="stylesheet"
	media="all">
<style type="text/css">/* Chart.js */
@
-webkit-keyframes chartjs-render-animation {
	from {opacity: 0.99
}

to {
	opacity: 1
}

}
@
keyframes chartjs-render-animation {
	from {opacity: 0.99
}

to {
	opacity: 1
}

}
.chartjs-render-monitor {
	-webkit-animation: chartjs-render-animation 0.001s;
	animation: chartjs-render-animation 0.001s;
}
</style>
</head>

<body class="animsition" style="animation-duration: 900ms; opacity: 1;">
	<div class="page-wrapper">
		<%@include file="/WEB-INF/views/shared/sidebar.jsp"%>

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="header-wrap" style="width:100%">
							<div class="navbar-right in fade" id="mainmenu" style="width:100%">
								<ul class="nav navbar-nav nav-white text-uppercase justify-content-around flex-row align-items-center" >
									<li class="active"><a href="<c:url value="trang-chu" />">Trang
											chủ</a></li>
									<li><a href="#">Giới thiệu</a></li>
									<li><a href="<c:url value="notification" />">Thông báo</a></li>
									<li><a href="<c:url value="sach" />">Sách</a></li>
									<li><a href="<c:url value="QuanLyThuVien"/>">Quản Lý
											Thư Viện</a></li>
									<li><a>${sessionScope.loginAdmin.name}</a></li>
									<li><a href="#" class="dropdown-toggle"
										data-toggle="dropdown"> <img
											src="<c:url value="/assets/images/active_user.png" />"
											class="img-circle img-thumbnail" alt="User Img">
									</a>
										<ul class="dropdown-menu">
											<li><a href="<c:url value="userInfo"/>"
												style="color: black"> <span style="color: black"><i
														class="icofont icofont-user" style="color: black"></i></span>
													Thông tin cá nhân
											</a></li>
											<li><a href="<c:url value="UserChangePassword"/>"
												style="color: black"> <span style="color: black"><i
														class="icofont icofont-ui-password" style="color: black"></i></span>
													Đổi mật khẩu
											</a></li>
											<li>

												<button type="button" class="btn btn-warning"
													style="margin-left: 20px; padding: 10px;"
													data-toggle="modal" data-target="#staticBackdrop"
													onclick="updateFormAction()">
													<span style="color: black"><i
														class="icofont icofont-logout"></i></span> Đăng xuất

												</button>

											</li>
										</ul></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</header>
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12 col-md-12">
								<div class="card">
									<div class="card-header">
										<strong>Mượn sách</strong>
									</div>
									<div class="card-body card-block">
										<form action="" method="post" enctype="multipart/form-data"
											class="form-horizontal">
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="card_num_input" class=" form-control-label">Mã
														thẻ</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" id="card_num" name="card_num_input"
														placeholder="Mã thẻ" class="form-control">
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="borrowed_day_input" class=" form-control-label">Ngày
														mượn</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="date" id="borrowed_day"
														name="borrowed_day-input" class="form-control">
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="appointment_date_input"
														class=" form-control-label">Ngày hẹn trả</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="date" id="appointment_date"
														name="appointment_date_input" class="form-control">
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="note_input" class=" form-control-label">Ghi
														chú</label>
												</div>
												<div class="col-12 col-md-9">
													<textarea name="note_input" id="note" rows="9"
														placeholder="Nội dung" class="form-control"></textarea>
												</div>
											</div>
											<div class="card-footer">
												<div class="row form-group">
													<div class="col col-md-3">
														<label for="book_num_input" class=" form-control-label">Mã
															sách</label>
													</div>
													<div class="col-12 col-md-9">
														<input type="text" id="book_num" name="book_num_input"
															class="form-control" placeholder="Mã sách">
													</div>
												</div>
												<div class="row form-group">
													<div class="col col-md-3">
														<label for="status_input" class=" form-control-label">Trạng
															thái</label>
													</div>
													<div class="col-12 col-md-9">
														<input type="text" id="status" name="status_input"
															class="form-control" placeholder="Trạng thái">
													</div>
												</div>
												<div class="row form-group">
													<div class="col col-md-3">
														<label for="amounts_input" class=" form-control-label">Số
															lượng</label>
													</div>
													<div class="col-12 col-md-9">
														<input type="text" id="amounts" name="amounts_input"
															class="form-control" placeholder="Số lượng">
													</div>
												</div>
												<button type="submit" class="btn btn-success btn-sm">
													<i class="fa fa-plus"></i> Thêm
												</button>
											</div>
										</form>
									</div>
									<div class="col-12 col-md-12">
										<div class="table-responsive table--no-card m-b-30">
											<table
												class="table table-borderless table-striped table-earning">
												<thead>
													<tr>
														<th>Mã cuốn sách</th>
														<th>Trạng thái</th>
														<th>Số lượng</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>S1</td>
														<td>Mới</td>
														<td>1</td>
													</tr>
													<tr>
														<td>S2</td>
														<td>Mới</td>
														<td>1</td>
													</tr>

												</tbody>
											</table>
										</div>
									</div>
									<div class="card-footer">
										<button type="submit" class="btn btn-primary btn-sm">
											<i class="fa fa-check"></i> Hoàn tất
										</button>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END MAIN CONTENT-->
		<!-- END PAGE CONTAINER-->
	</div>





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
	<script
		src="<c:url value= "/assets/vendor/counter-up/jquery.counterup.min.js"/>">
		
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




</body>
</html>
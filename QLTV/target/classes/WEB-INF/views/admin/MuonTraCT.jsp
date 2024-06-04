<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="au theme template">
<meta name="keywords" content="au theme template">

<!-- Title Page-->
<title>Admin</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">


<!-- Fontfaces CSS-->
<link href="<c:url value= "/assets/css/font-face.css"/>"
	rel="stylesheet" media="all">
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
<script>
	
</script>
</head>


<body class="animsition" style="animation-duration: 900ms; opacity: 1;">
	<div class="page-wrapper">

		<%@include file="/WEB-INF/views/shared/sidebar.jsp"%>
		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop" style="z-index:999;">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="header-wrap"></div>
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
										<strong>Lập phiếu mượn</strong>
									</div>
									<div class="card-body card-block">
										<form:form action="muontra" method="post"
											modelAttribute="insert" class="form-horizontal">

											<div class="row form-group">
												<div class="col col-md-3">
													<label for="borrowed_day_input" class="form-control-label">Ngày
														mượn</label>
												</div>
												<div class="col-12 col-md-9">
													<form:input type="date" class="form-control"
														path="ngayMuon" id="ngayMuon"/>
													<span id="ngayMuon_error" style="color: red;"></span>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="appointment_date_input"
														class="form-control-label">Ngày trả</label>
														
												</div>
												<div class="col-12 col-md-9">
													<form:input type="date" class="form-control" path="ngayTra" id="ngayTra"/>
													<span id="ngayTra_error" style="color: red;"></span>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="readerId" class="form-control-label">
														Người Đọc</label>
												</div>
												<div class="col-12 col-md-9">
													<form:select path="readerId" name="selectReaderId"
														id="selectReaderId" class="form-control">
														<c:forEach var="reader" items="${readers}">
															<option value="${reader.getId()}">${reader.getId()}</option>
														</c:forEach>
													</form:select>
													<span id="reader_error" style="color: red;"></span>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label path="bookId" for="book_num_input"
														class="form-control-label">Tên sách</label>
												</div>
												<div class="col-12 col-md-9">
													<form:select path="bookId" name="selectBookId"
														id="selectBookId" class="form-control">
														<c:forEach var="book" items="${books}">
															<option value="${book.getId()}" data-amount="${book.getAmount()}">${book.getName()}</option>
														</c:forEach>
													</form:select>
													<span id="book_error" style="color: red;"></span>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="amounts_input" class="form-control-label">Số
														lượng</label>
												</div>
												<div class="col-12 col-md-9">
													<form:input type="number" name="numberSoLuong" id="numberSoLuong"
														class="form-control" step="1" required="required"
														pattern="[0-9]" title="" min="1"  path="amount" />
														<span id="amount_error" style="color: red;"></span>
												</div>
											</div>
											<button type="submit" class="btn btn-success btn-sm" id="register_form" disabled>
												<i class="fa fa-check"></i> Thêm
											</button>
										</form:form>
									</div>

								<%-- 	<div class="col-12 col-md-12">
										<div class="table-responsive table--no-card m-b-30">
											<table style="width: 100%"
												class="table  table-borderless table-striped table-earning">
												<thead>
													<tr class="col-sm-12">
														<th>Mã Mượn</th>
														<th>Mã Sách</th>
														<th>Ngày Mượn</th>
														<th>Ngày Hẹn Trả</th>
														<th>Trạng Thái</th>
														<th>Mã người đọc</th>
														<th>Sửa và Xóa&nbsp;&nbsp;&nbsp;&nbsp;</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="ctmt" items="${ctmts}">
														<tr>
															<td><c:out value="${ctmt.getId()}" /></td>
															<td><c:out value="${ctmt.getBookId()}" /></td>
															<td><c:out value="${ctmt.getNgayMuon()}" /></td>
															<td><c:out value="${ctmt.getNgayTra()}" /></td>
															<td><c:out value="${ctmt.getTrangThai()}" /></td>
															<td><c:out value="${ctmt.getReaderId()}" /></td>

															<td
																style="display: flex; justify-content: space-between; margin-top: 75px;"><a
																class="btn btn-warning pull-left"
																href="/QuanLyThuVien/MuonTraSachChiTiet/edit?maMuonSach=<c:out value='${ctmt.getId()}' />&pages=<c:out value="${ngayTra}" />">Sửa</a>
																<a class="btn btn-danger"
																href="/QuanLyThuVien/MuonTraSachChiTiet/delete?maMuonSach=<c:out value='${ctmt.getId()}' />&pages=<c:out value="${ngayTra}" />">Xóa</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
										<!-- <div class="card-footer">
											<button type="submit" class="btn btn-primary btn-sm">
												<i class="fa fa-check"></i> Hoàn tất
											</button>
										</div> -->

									</div> --%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>

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
	<!-- date-range-picker -->
	<script
		src="<c:url value="/assets/vendor/plugins/daterangepicker/daterangepicker.js"/>"></script>
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
	<script src="<c:url value= "/assets/js/validate_ctmuon.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/assets/vendor/jquery-ui-1.13.3.custom"/>"></script>
	<script type="text/javascript">
		var message = "${message}";
		if (message && message.trim().length > 0) {
			alert(message);
		}
		
		 document.addEventListener("DOMContentLoaded", function() {
		        const bookSelect = document.getElementById("selectBookId");
		        const amountInput = document.getElementById("numberSoLuong");

		        bookSelect.addEventListener("change", function() {
		            const selectedOption = bookSelect.options[bookSelect.selectedIndex];
		            const maxAmount = selectedOption.getAttribute("data-amount");
		            if (maxAmount) {
		                amountInput.setAttribute("max", maxAmount);
		                console.log("Max attribute set to:", amountInput.getAttribute("max"));
		            } else {
		                console.error("Failed to retrieve max amount.");
		            }
		        });
		        const event = new Event('change');
		        bookSelect.dispatchEvent(event);
		        
		       
		    });
		 document.getElementById('ngayMuon').addEventListener('change', function() {
		        var ngayMuon = new Date(this.value);
		        var ngayTra = new Date(ngayMuon.getTime() + 30 * 24 * 60 * 60 * 1000);
		        var dd = String(ngayTra.getDate()).padStart(2, '0');
		        var mm = String(ngayTra.getMonth() + 1).padStart(2, '0'); 
		        var yyyy = ngayTra.getFullYear();
		        var formattedNgayTra = yyyy + '-' + mm + '-' + dd;
		        document.getElementById('ngayTra').value = formattedNgayTra;
		    });
		
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>Quản Lý Sách</title>

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
										<strong>Thêm sách</strong>
									</div>
									<div class="card-body card-block">
										<form:form action="dausach" method="POST"
											modelAttribute="insertBook" class="form-horizontal">
											<div class="row form-group">
												<div class="col col-md-2">
													<form:label path="bookName" class="form-control-label">Tên
														sách</form:label>
												</div>
												<div class="col-12 col-md-4">
													<form:input path="bookName" type="text"
														class="form-control" />
												</div>

												<div class="col col-md-2">
													<form:label path="categoryName">Thể Loại</form:label>
												</div>
												<div class="col-12 col-md-4">
													<form:select path="categoryName" name="txtTenTheLoai"
														id="txtTenTheLoai"
														class="selectpicker show-tick form-control">
														<c:forEach var="category" items="${categories}">
															<form:option value="${category.name }" />
														</c:forEach>
													</form:select>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-2">
													<form:label path="bookAmount" class="form-control-label">Số lượng</form:label>
												</div>
												<div class="col-12 col-md-10">
													<form:input path="bookAmount" type="text"
														class="form-control" value="1" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-2">
													<form:label path="bookDescription"
														class="form-control-label">Mô tả</form:label>
												</div>
												<div class="col-12 col-md-10">
													<form:textarea path="bookDescription" id="txtMoTa"
														name="txtMoTa" class="col-md-12 form-control"
														style="border: solid 1px gray;" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-2">
													<form:label path="authorName">Tác Giả</form:label>
												</div>

												<div class="col-12 col-md-4">
													<form:select path="authorName" name="txtTenTheLoai"
														id="txtTenTheLoai"
														class="selectpicker show-tick form-control">
														<c:forEach var="author" items="${authors}">
															<form:option path="authorName" value="${author.name }" />
														</c:forEach>
													</form:select>
												</div>

												<div class="col col-md-2">
													<form:label path="bookDayCreated">Ngày xuất bản</form:label>
												</div>
												<div class="col-12 col-md-4">
													<form:input path="bookDayCreated" type="date"
														class="form-control " required="required" />
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-2">
													<form:label path="bookImage" class="form-control-label">Ảnh sách</form:label>

												</div>
												<div class="col-12 col-md-4">
													<form:input path="bookImage" type="file"
														class="form-control" />
												</div>
											</div>
											<button type="submit" class="btn btn-success btn-sm">
												<i class="fa fa-plus"></i> Thêm
											</button>
										</form:form>
									</div>

									<div class="col-12 col-md-12">
										<div class="table-responsive table--no-card m-b-30">
											<table style="width: 100%"
												class="table  table-borderless table-striped table-earning">
												<thead>
													<tr class="col-sm-12">
														<th>Mã Sách</th>
														<th>Tên Sách&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
														<th>Số lượng</th>
														<th>Thể loại&nbsp;&nbsp;&nbsp;</th>
														<th>Mô tả&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
														<th>Tác giả</th>
														<th>Ngày xuất bản</th>
														<th>Ảnh bìa</th>
														<th>Ảnh tác giả</th>
														<th>Sửa và Xóa&nbsp;&nbsp;&nbsp;&nbsp;</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="book" items="${books}">
														<tr>
															<td><c:out value="${book.id}" /></td>
															<td><c:out value="${book.name}" /></td>
															<td><c:out value="${book.amount }"></c:out></td>
															<c:forEach var="category" items="${categories }">
																<c:if test="${category.id == book.categoryId }">
																	<td><c:out value="${category.name}" /></td>
																</c:if>
															</c:forEach>
															<td><c:out value="${book.description}" /></td>
															<c:forEach var="author" items="${authors}">
																<c:if test="${author.id == book.authorId }">
																	<td><c:out value="${author.name}" /></td>
																</c:if>
															</c:forEach>
															<td><c:out value="${book.dayCreated}" /></td>
															<td><c:out value="${book.image}" /></td>
															<c:forEach var="author" items="${authors}">
																<c:if test="${author.id == book.authorId }">
																	<td><c:out value="${author.image}" /></td>
																</c:if>
															</c:forEach>

															<td
																style="display: flex; justify-content: space-between; gap: 10px; margin-top: 75px;"><a
																class="btn btn-warning pull-left"
																href="/QuanLyThuVien/MuonTraSachChiTiet/edit?maMuonSach=<c:out value='${book.getId()}' />&pages=<c:out value="${ngayTra}" />">Sửa</a>
																<a class="btn btn-danger"
																href="/QuanLyThuVien/MuonTraSachChiTiet/delete?maMuonSach=<c:out value='${book.getId()}' />&pages=<c:out value="${ngayTra}" />">Xóa</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
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
	<script type="text/javascript">
		var message = "${message}";
		if (message && message.trim().length > 0) {
			// Display an alert with the message content
			alert(message);
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="<c:url value="./assets/images/apple-touch-icon.png"/>">
<link rel="icon" type="image/png"
	href="<c:url value="./assets/images/apple-touch-icon.png"/>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>QUẢN LÝ THỐNG KÊ</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="<c:url value="/assets/css/material-dashboard.css?v=2.1.1"/>"
	rel="stylesheet" />
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
<<<<<<< HEAD
<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	 google.charts.load("current", {packages:["corechart"]});
     google.charts.setOnLoadCallback(drawChart);
     // Lấy dữ liệu JSON từ controller
     var jsonData = '${pieChart}';
     var parsedData = JSON.parse(jsonData);
     function drawChart() {
        
        
         
         var data = new google.visualization.DataTable();
         data.addColumn('string', 'Category');
         data.addColumn('number', 'Amount');
			
         // Thêm dữ liệu vào DataTable
         for (var i = 0; i < parsedData.length; i++) {
        	
             data.addRow([parsedData[i].categoryName, parsedData[i].amount]);
         }

         var options = {
             title: 'Số lượng sách theo thể loại',
             is3D: true // Enable 3D effect
         };

         var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
         chart.draw(data, options);
         
         
       		
     }
     // TIM MIN MAX
     var maxAndMinCategories = findMaxAndMinCategory(parsedData);
     var maxCategory = maxAndMinCategories.maxCategory;
     var minCategory = maxAndMinCategories.minCategory;
     var maxAmount = maxAndMinCategories.maxAmount;
     var minAmount = maxAndMinCategories.minAmount
     
     var max = document.getElementById('thongKeMax');
     max.innerHTML = "Thể loại có số lượng sách nhiều nhất là: ";
     var min = document.getElementById('thongKeMin');
     min.innerHTML = "Thể loại có số lượng sách ít nhất là: " + minCategory + " với số lượng là " + minAmount;
     
	</script>
=======

<script src="<c:url value="/assets/js/ThongKe.js"/>"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	// Lấy dữ liệu JSON từ controller
	var jsonData = '${pieChart}';
	var parsedData = JSON.parse(jsonData);
	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Category');
		data.addColumn('number', 'Amount');

		// Thêm dữ liệu vào DataTable
		for (var i = 0; i < parsedData.length; i++) {

			data.addRow([ parsedData[i].categoryName, parsedData[i].amount ]);
		}

		var options = {
			title : 'TỈ LỆ SÁCH THEO TỪNG THỂ LOẠI',
			is3D : true
		// Enable 3D effect
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart_3d'));
		chart.draw(data, options);

	}

	google.charts.setOnLoadCallback(drawColumnChart);

	function drawColumnChart() {
		var jsonData = '${listReceipt}';
		var parsedData = JSON.parse(jsonData);

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Month');
		data.addColumn('number', 'Số lượng');

		for ( var month in parsedData) {
			data.addRow([ month, parseInt(parsedData[month]) ]);
		}

		var options = {
			title : 'THỐNG KÊ SỐ SÁCH ĐƯỢC MƯỢN THEO TỪNG THÁNG',
			vAxis : {
				title : 'Tổng số sách',
				format : '#'
			}
		};

		var chart = new google.visualization.ColumnChart(document
				.getElementById('columnchart'));
		chart.draw(data, options);
	}
</script>

>>>>>>> c459af3c72fde7cd415bb0b9e1609d004b241ab1
</head>

<body class="">
	<div class="wrapper ">
		<div class="sidebar" data-color="purple" data-background-color="white"
			data-image="<c:url value="/assets/images/sidebar-1.jpg"/>">
			<div class="logo">
				<a class="logo"> <img
					src="<c:url value="/assets/images/logo.png"/>" alt="CoolAdmin" />
				</a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item active  "><a class="nav-link"
						href="./dashboard.html"> <i class="material-icons"></i>
							<p>Thống Kê</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="user.jsp">
							<i class="material-icons"></i>
							<p>User Profile</p>
					</a></li>

				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<a class="navbar-brand" href="#pablo">User Profile</a>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="sr-only">Toggle navigation</span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end">
						<form class="navbar-form">
							<div class="input-group no-border">
								<input type="text" value="" class="form-control"
									placeholder="Search...">
								<button type="submit"
									class="btn btn-white btn-round btn-just-icon">
									<i class="material-icons">search</i>
									<div class="ripple-container"></div>
								</button>
							</div>
						</form>
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="#pablo">
									<i class="material-icons">dashboard</i>
									<p class="d-lg-none d-md-block">Stats</p>
							</a></li>
							<li class="nav-item dropdown"><a class="nav-link"
								href="http://example.com" id="navbarDropdownMenuLink"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> <i class="material-icons">notifications</i>
									<span class="notification">5</span>
									<p class="d-lg-none d-md-block">Some Actions</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Mike John responded to
										your email</a> <a class="dropdown-item" href="#">You have 5
										new tasks</a> <a class="dropdown-item" href="#">You're now
										friend with Andrew</a> <a class="dropdown-item" href="#">Another
										Notification</a> <a class="dropdown-item" href="#">Another One</a>
								</div></li>
							<li class="nav-item dropdown"><a class="nav-link"
								href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
									class="material-icons">person</i>
									<p class="d-lg-none d-md-block">Account</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownProfile">
									<a class="dropdown-item" href="#">Profile</a> <a
										class="dropdown-item" href="#">Settings</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Log out</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header card-header-warning card-header-icon">
									<div class="card-icon">
										<i class="material-icons">content_copy</i>
									</div>
									<p class="card-category">Tổng số lượng sách</p>
									<h3 class="card-title">
										${bookAmount } <small></small>
									</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons text-danger"></i> <a href="#pablo">Get
											More Space...</a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header card-header-success card-header-icon">
									<div class="card-icon">
										<i class="material-icons">store</i>
									</div>
									<p class="card-category">Số sách đang được mượn</p>
									<h3 class="card-title">${borrowedBooksAmount }</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">date_range</i> Trong tháng này
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header card-header-danger card-header-icon">
									<div class="card-icon">
										<i class="material-icons">info_outline</i>
									</div>
									<p class="card-category">Mức độ mượn sách</p>
									<h3 class="card-title">${borrowedRate }</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">local_offer</i> Tracked from Github
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-header card-header-info card-header-icon">
									<div class="card-icon">
										<i class="fa fa-twitter"></i>
									</div>
									<p class="card-category">Followers</p>
									<h3 class="card-title">+${readersAmount }</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">update</i> Just Updated
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">

<<<<<<< HEAD
=======
						<!-- PIE CHART -->

>>>>>>> c459af3c72fde7cd415bb0b9e1609d004b241ab1
						<div class="col-md-6">
							<div class="card card-chart">
								<div class="card-header card-header-warning">
									<!-- <div class="ct-chart" id="websiteViewsChart"></div> -->
									<!-- TEST CHART -->
									<div id="piechart_3d" style="min-height: 500px"></div>

								</div>
								<div class="card-body">
<<<<<<< HEAD
									<h4 class="card-title">Thống kê số sách theo thể loại</h4>
									<p class="card-category" id="thongKeMax"></p>
									<p class="card-category" id="thongKeMin"></p>
=======

									<h4 class="card-title">Thống kê tỉ lệ sách theo từng thể
										loại</h4>
									<p class="card-category" id="thongKeMax">
										Thể loại sách có số lương sách nhiều nhất là <b>${categoryMaxName}</b>
										với số lượng là <b>${categoryMaxAmount}</b>
									</p>
									<p class="card-category" id="thongKeMin">
										Thể loại sách có số lương sách nhiều nhất là <b>${categoryMinName}</b>
										với số lượng là <b>${categoryMinAmount}</b>
									</p>


									<h4 class="card-title">Thống kê số sách theo thể loại</h4>
									<p class="card-category" id="thongKeMax"></p>
									<p class="card-category" id="thongKeMin"></p>

>>>>>>> c459af3c72fde7cd415bb0b9e1609d004b241ab1
								</div>
								<div class="card-footer">
									<div class="stats"></div>
								</div>
							</div>
						</div>
<<<<<<< HEAD
=======

						<!-- COLUMN CHART  -->

>>>>>>> c459af3c72fde7cd415bb0b9e1609d004b241ab1
						<div class="col-md-6">
							<div class="card card-chart">
								<div class="card-header card-header-success">

									<div id="columnchart" style="min-height: 500px"></div>
								</div>
								<div class="card-body">
									<p>
										Thể loại sách được quan tâm nhất <b>${mostFavoriteCategoryName}</b>
										với <b>${mostFavoriteCategoryAmount}</b> lượt mượn
									</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> updated 4 minutes
										ago
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 col-md-12">
						<div class="card">
							<div class="card-header card-header-tabs card-header-primary">
								<div class="nav-tabs-navigation">
									<div class="nav-tabs-wrapper">
										<span class="nav-tabs-title">Độc giả mới</span>
										<ul class="nav nav-tabs" data-tabs="tabs">
											<li class="nav-item"><a class="nav-link active"
												href="#profile" data-toggle="tab"> <i
													class="material-icons">bug_report</i> Bugs
													<div class="ripple-container"></div>
											</a></li>
											<li class="nav-item"><a class="nav-link"
												href="#messages" data-toggle="tab"> <i
													class="material-icons">code</i> Website
													<div class="ripple-container"></div>
											</a></li>
											<li class="nav-item"><a class="nav-link"
												href="#settings" data-toggle="tab"> <i
													class="material-icons">cloud</i> Server
													<div class="ripple-container"></div>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="tab-content">
									<div class="tab-pane active" id="profile">
										<table class="table">
											<tbody>
												<tr>
													<td>1</td>
													<td>Dakota Rice</td>
													<td>$36,738</td>
													<td>Niger</td>
												</tr>
												<tr>
													<td>2</td>
													<td>Minerva Hooper</td>
													<td>$23,789</td>
													<td>Curaçao</td>
												</tr>
												<tr>
													<td>3</td>
													<td>Sage Rodriguez</td>
													<td>$56,142</td>
													<td>Netherlands</td>
												</tr>
												<tr>
													<td>4</td>
													<td>Philip Chaney</td>
													<td>$38,735</td>
													<td>Korea, South</td>
												</tr>
											</tbody>
										</table>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-12">
					<div class="card">
						<div class="card-header card-header-warning">
							<h4 class="card-title">Employees Stats</h4>
							<p class="card-category">New employees on 15th September,
								2016</p>
						</div>
						<div class="card-body table-responsive">
							<table class="table table-hover">
								<thead class="text-warning">
									<th>ID</th>
									<th>Name</th>
									<th>Salary</th>
									<th>Country</th>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>Dakota Rice</td>
										<td>$36,738</td>
										<td>Niger</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Minerva Hooper</td>
										<td>$23,789</td>
										<td>Curaçao</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Sage Rodriguez</td>
										<td>$56,142</td>
										<td>Netherlands</td>
									</tr>
									<tr>
										<td>4</td>
										<td>Philip Chaney</td>
										<td>$38,735</td>
										<td>Korea, South</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--  Google Maps Plugin    -->

	<script src="<c:url value="/assets/js/plugins/chartist.min.js"/>"></script>
	<!--  Notifications Plugin    -->
	<script src="<c:url value="/assets/js/plugins/bootstrap-notify.js"/>"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="<c:url value="/assets/js/material-dashboard.js?v=2.1.1"/>"
		type="text/javascript"></script>
	<script src="<c:url value="/assets/js/ThongKe.js"/>"></script>



	
</body>

</html>

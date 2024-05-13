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
	href="<c:url value="/assets/img/apple-touch-icon.png"/>">
<link rel="icon" type="image/png"
	href="<c:url value="/assets/img/apple-touch-icon.png"/>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>QUẢN LÝ THỐNG KÊ</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons"/>" />
<link rel="stylesheet"
	href="<c:url value="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"/>">
<!-- CSS Files -->
<link href="<c:url value="/assets/css/material-dashboard.css?v=2.1.1"/>"
	rel="stylesheet" />
<!-- Fontfaces CSS-->
<link href="<c:url value="/assets/css/font-face.css"/>" rel="stylesheet"
	media="all">
<link
	href="<c:url value="/assets/vendor/font-awesome-4.7/css/font-awesome.min.css" />"
	rel="stylesheet" media="all">
<link
	href="<c:url value="/assets/vendor/font-awesome-5/css/fontawesome-all.min.css" />"
	rel="stylesheet" media="all">
<link
	href="<c:url value="/assets/vendor/mdi-font/css/material-design-iconic-font.min.css" />"
	rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link
	href="<c:url value="/assets/vendor/bootstrap-4.1/bootstrap.min.css"/>"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link
	href="<c:url value="/assets/vendor/animsition/animsition.min.css" />"
	rel="stylesheet" media="all">
<link
	href="<c:url value="/assets/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" />"
	rel="stylesheet" media="all">
<link href="<c:url value="/assets/vendor/wow/animate.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value="/assets/vendor/css-hamburgers/hamburgers.min.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value="/assets/vendor/slick/slick.css"/>"
	rel="stylesheet" media="all">
<link href="<c:url value="/assets/vendor/select2/select2.min.css"/>"
	rel="stylesheet" media="all">
<link
	href="<c:url value="/assets/vendor/perfect-scrollbar/perfect-scrollbar.css"/>"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="<c:url value="/assets/css/theme_1.css" />" rel="stylesheet"
	media="all">

  <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
</head>

<body class="">
	<div class="wrapper ">
		<div class="sidebar" data-color="purple" data-background-color="white"
			data-image="<c:url value="/assets/images/sidebar-1.jpg"/>">
			<!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
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
		<!-- BIEU DO  -->
		  <!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
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
									<p class="card-category">Mức độ sử dụng</p>
									<h3 class="card-title">
										49/50 <small></small>
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
									<p class="card-category">Mức độ download sách</p>
									<h3 class="card-title">34,245</h3>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">date_range</i> Last 24 Hours
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
									<h3 class="card-title">75</h3>
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
									<h3 class="card-title">+245</h3>
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

						<div class="col-md-4">
							<div class="card card-chart">
								<div class="card-header card-header-warning">
									<div class="ct-chart" id="websiteViewsChart"></div>
								</div>
								<div class="card-body">
									<h4 class="card-title">Email Subscriptions</h4>
									<p class="card-category">Last Campaign Performance</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> campaign sent 2 days
										ago
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card card-chart">
								<div class="card-header card-header-success">
									<div class="ct-chart" id="dailySalesChart"></div>
								</div>
								<div class="card-body">
									<h4 class="card-title">Daily Sales</h4>
									<p class="card-category">
										<span class="text-success"><i
											class="fa fa-long-arrow-up"></i> 55% </span> increase in today
										sales.
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
						<div class="col-md-4">
							<div class="card card-chart">
								<div class="card-header card-header-danger">
									<div class="ct-chart" id="completedTasksChart"></div>
								</div>
								<div class="card-body">
									<h4 class="card-title">Completed Tasks</h4>
									<p class="card-category">Last Campaign Performance</p>
								</div>
								<div class="card-footer">
									<div class="stats">
										<i class="material-icons">access_time</i> campaign sent 2 days
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

	<!--   Core JS Files   -->
	<script src="<c:url value="/assets/js/core/jquery.min.js"/>"></script>
	<script src="<c:url value="/assets/js/core/popper.min.js"/>"></script>
	<script
		src="<c:url value="/assets/js/core/bootstrap-material-design.min.js"/>"></script>
	<script
		src="<c:url value="/assets/js/plugins/perfect-scrollbar.jquery.min.js"/>"></script>
	<!-- Plugin for the momentJs  -->
	<script src="<c:url value="/assets/js/plugins/moment.min.js"/>"></script>
	<!--  Plugin for Sweet Alert -->
	<script src="<c:url value="/assets/js/plugins/sweetalert2.js"/>"></script>
	<!-- Forms Validations Plugin -->
	<script
		src="<c:url value="/assets/js/plugins/jquery.validate.min.js"/>"></script>
	<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
	<script
		src="<c:url value="/assets/js/plugins/jquery.bootstrap-wizard.js"/>"></script>
	<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
	<script
		src="<c:url value="/assets/js/plugins/bootstrap-selectpicker.js"/>"></script>
	<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script
		src="<c:url value="/assets/js/plugins/bootstrap-datetimepicker.min.js"/>"></script>
	<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
	<script
		src="<c:url value="/assets/js/plugins/jquery.dataTables.min.js"/>"></script>
	<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
	<script
		src="<c:url value="/assets/js/plugins/bootstrap-tagsinput.js"/>"></script>
	<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
	<script
		src="<c:url value="/assets/js/plugins/jasny-bootstrap.min.js"/>"></script>
	<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
	<script src="<c:url value="/assets/js/plugins/fullcalendar.min.js"/>"></script>
	<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
	<script src="<c:url value="/assets/js/plugins/jquery-jvectormap.js"/>"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="<c:url value="/assets/js/plugins/nouislider.min.js"/>" />
	</script>
	<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
	<!-- Library for adding dinamically elements -->
	<script src="<c:url value="/assets/js/plugins/arrive.min.js"/>" />
	</script>
	<!--  Google Maps Plugin    -->

	<script src="<c:url value="/assets/js/plugins/chartist.min.js"/>"></script>
	<!--  Notifications Plugin    -->
	<script src="<c:url value="/assets/js/plugins/bootstrap-notify.js"/>"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="<c:url value="/assets/js/material-dashboard.js?v=2.1.1"/>"
		type="text/javascript"></script>
	<script src="<c:url value="/assets/js/core/ThongKe.js"/>"></script>
</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Serial Manager</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="/app/resources/template/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/app/resources/template/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="/app/resources/template/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="/app/resources/template/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="/app/resources/template/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/part/menuBar.jsp"%>



		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">


			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Dashboard <small>Version 2.0</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Dashboard</li>
				</ol>
			</section>




			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-aqua"><i
								class="ion ion-ios-gear-outline"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">CPU Traffic</span> <span
									class="info-box-number">90<small>%</small></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-red"><i
								class="fa fa-google-plus"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Likes</span> <span
									class="info-box-number">41,410</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->

					<!-- fix for small devices only -->
					<div class="clearfix visible-sm-block"></div>

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-green"><i
								class="ion ion-ios-cart-outline"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Sales</span> <span
									class="info-box-number">760</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-yellow"><i
								class="ion ion-ios-people-outline"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">New Members</span> <span
									class="info-box-number">2,000</span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-md-12">
						<div class="box">
							<div class="box-header with-border">
								<h3 class="box-title">Monthly Recap Report</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<div class="btn-group">
										<button type="button" class="btn btn-box-tool dropdown-toggle"
											data-toggle="dropdown">
											<i class="fa fa-wrench"></i>
										</button>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Action</a></li>
											<li><a href="#">Another action</a></li>
											<li><a href="#">Something else here</a></li>
											<li class="divider"></li>
											<li><a href="#">Separated link</a></li>
										</ul>
									</div>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="row">
									<div class="col-md-8">
										<p class="text-center">
											<strong>Sales: 1 Jan, 2014 - 30 Jul, 2014</strong>
										</p>

										<div class="chart">
											<!-- Sales Chart Canvas -->
											<canvas id="salesChart" style="height: 180px;"></canvas>
										</div>
										<!-- /.chart-responsive -->
									</div>
									<!-- /.col -->
									<div class="col-md-4">
										<p class="text-center">
											<strong>Goal Completion</strong>
										</p>

										<div class="progress-group">
											<span class="progress-text">Add Products to Cart</span> <span
												class="progress-number"><b>160</b>/200</span>

											<div class="progress sm">
												<div class="progress-bar progress-bar-aqua"
													style="width: 80%"></div>
											</div>
										</div>
										<!-- /.progress-group -->
										<div class="progress-group">
											<span class="progress-text">Complete Purchase</span> <span
												class="progress-number"><b>310</b>/400</span>

											<div class="progress sm">
												<div class="progress-bar progress-bar-red"
													style="width: 80%"></div>
											</div>
										</div>
										<!-- /.progress-group -->
										<div class="progress-group">
											<span class="progress-text">Visit Premium Page</span> <span
												class="progress-number"><b>480</b>/800</span>

											<div class="progress sm">
												<div class="progress-bar progress-bar-green"
													style="width: 80%"></div>
											</div>
										</div>
										<!-- /.progress-group -->
										<div class="progress-group">
											<span class="progress-text">Send Inquiries</span> <span
												class="progress-number"><b>250</b>/500</span>

											<div class="progress sm">
												<div class="progress-bar progress-bar-yellow"
													style="width: 80%"></div>
											</div>
										</div>
										<!-- /.progress-group -->
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</div>
							<!-- ./box-body -->
							<div class="box-footer">
								<div class="row">
									<div class="col-sm-3 col-xs-6">
										<div class="description-block border-right">
											<span class="description-percentage text-green"><i
												class="fa fa-caret-up"></i> 17%</span>
											<h5 class="description-header">$35,210.43</h5>
											<span class="description-text">TOTAL REVENUE</span>
										</div>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->
									<div class="col-sm-3 col-xs-6">
										<div class="description-block border-right">
											<span class="description-percentage text-yellow"><i
												class="fa fa-caret-left"></i> 0%</span>
											<h5 class="description-header">$10,390.90</h5>
											<span class="description-text">TOTAL COST</span>
										</div>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->
									<div class="col-sm-3 col-xs-6">
										<div class="description-block border-right">
											<span class="description-percentage text-green"><i
												class="fa fa-caret-up"></i> 20%</span>
											<h5 class="description-header">$24,813.53</h5>
											<span class="description-text">TOTAL PROFIT</span>
										</div>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->
									<div class="col-sm-3 col-xs-6">
										<div class="description-block">
											<span class="description-percentage text-red"><i
												class="fa fa-caret-down"></i> 18%</span>
											<h5 class="description-header">1200</h5>
											<span class="description-text">GOAL COMPLETIONS</span>
										</div>
										<!-- /.description-block -->
									</div>
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<div class="col-md-8">
						<!-- MAP & BOX PANE -->

						<!-- TABLE: LATEST ORDERS -->
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">최근 등록 제품</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin">
										<thead>
											<tr>
												<th>Order ID</th>
												<th>Item</th>
												<th>Status</th>
												<th>Popularity</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><a href="pages/examples/invoice.html">OR9842</a></td>
												<td>Call of Duty IV</td>
												<td><span class="label label-success">Shipped</span></td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">90,80,90,-70,61,-83,63</div>
												</td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR1848</a></td>
												<td>Samsung Smart TV</td>
												<td><span class="label label-warning">Pending</span></td>
												<td>
													<div class="sparkbar" data-color="#f39c12" data-height="20">90,80,-90,70,61,-83,68</div>
												</td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR7429</a></td>
												<td>iPhone 6 Plus</td>
												<td><span class="label label-danger">Delivered</span></td>
												<td>
													<div class="sparkbar" data-color="#f56954" data-height="20">90,-80,90,70,-61,83,63</div>
												</td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR7429</a></td>
												<td>Samsung Smart TV</td>
												<td><span class="label label-info">Processing</span></td>
												<td>
													<div class="sparkbar" data-color="#00c0ef" data-height="20">90,80,-90,70,-61,83,63</div>
												</td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR1848</a></td>
												<td>Samsung Smart TV</td>
												<td><span class="label label-warning">Pending</span></td>
												<td>
													<div class="sparkbar" data-color="#f39c12" data-height="20">90,80,-90,70,61,-83,68</div>
												</td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR7429</a></td>
												<td>iPhone 6 Plus</td>
												<td><span class="label label-danger">Delivered</span></td>
												<td>
													<div class="sparkbar" data-color="#f56954" data-height="20">90,-80,90,70,-61,83,63</div>
												</td>
											</tr>
											<tr>
												<td><a href="pages/examples/invoice.html">OR9842</a></td>
												<td>Call of Duty IV</td>
												<td><span class="label label-success">Shipped</span></td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">90,80,90,-70,61,-83,63</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<a href="javascript:void(0)"
									class="btn btn-sm btn-info btn-flat pull-left">Place New
									Order</a> <a href="javascript:void(0)"
									class="btn btn-sm btn-default btn-flat pull-right">View All
									Orders</a>
							</div>
							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->

					<div class="col-md-4">
						<!-- Info Boxes Style 2 -->
						<div class="box box-default">
							<div class="box-header with-border">
								<h3 class="box-title">Browser Usage</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="row">
									<div class="col-md-8">
										<div class="chart-responsive">
											<canvas id="pieChart" height="150"></canvas>
										</div>
										<!-- ./chart-responsive -->
									</div>
									<!-- /.col -->
									<div class="col-md-4">
										<ul class="chart-legend clearfix">
											<li><i class="fa fa-circle-o text-red"></i> Chrome</li>
											<li><i class="fa fa-circle-o text-green"></i> IE</li>
											<li><i class="fa fa-circle-o text-yellow"></i> FireFox</li>
											<li><i class="fa fa-circle-o text-aqua"></i> Safari</li>
											<li><i class="fa fa-circle-o text-light-blue"></i> Opera</li>
											<li><i class="fa fa-circle-o text-gray"></i> Navigator</li>
										</ul>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer no-padding">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#">United States of America <span
											class="pull-right text-red"><i
												class="fa fa-angle-down"></i> 12%</span></a></li>
									<li><a href="#">India <span
											class="pull-right text-green"><i
												class="fa fa-angle-up"></i> 4%</span></a></li>
									<li><a href="#">China <span
											class="pull-right text-yellow"><i
												class="fa fa-angle-left"></i> 0%</span></a></li>
								</ul>
							</div>
							<!-- /.footer -->
						</div>
						<!-- /.box -->

					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->



		</div>
		<!-- /.content-wrapper -->

		<%@ include file="/WEB-INF/views/part/footer.jsp"%>

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script
		src="/app/resources/template/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="/app/resources/template/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="/app/resources/template/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="/app/resources/template/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="/app/resources/template/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="/app/resources/template/dist/js/demo.js"></script>
</body>
</html>

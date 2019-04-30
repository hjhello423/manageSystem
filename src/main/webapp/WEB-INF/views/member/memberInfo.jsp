<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


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
<!-- DataTables -->
<link rel="stylesheet"
	href="/app/resources/template/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
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
				<h1>내 정보</h1>
				<ol class="breadcrumb">
					<li><a href="/app"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">내 정보</li>
				</ol>
			</section>



			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<div class="row">
					<!-- left column -->
					<div class="col-md-12">
						<!-- general form elements -->
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">프로필</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form class="form-horizontal" action="/app/member/profile">
								<div class="box-body col-md-6">

									<div class="form-group">
										<label for="memId" class="col-sm-2 control-label text-center">ID</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="memId"
												value=${member.memId } readonly>
										</div>
									</div>
									<div class="form-group">
										<label for="memMail"
											class="col-sm-2 control-label text-center">mail</label>
										<div class="col-sm-10">
											<input type="email" class="form-control" id="memMail"
												value=${member.memMail } readonly>
										</div>
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-body col-md-6">
									<div class="form-group">
										<label for="memName"
											class="col-sm-2 control-label text-center">이름</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="memName"
												value=${member.memName } readonly>
										</div>
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer text-left">
									<button type="submit" class="btn btn-primary pull-right">수정</button>
								</div>
							</form>
						</div>
						<!-- /.box -->
					</div>
					<!--/.col (left) -->
				</div>
				<!-- /.row -->




				<!-- Info boxes -->
				<div class="row">
					<!-- left column -->
					<div class="col-md-12">
						<!-- general form elements -->
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">발급 이력</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<div class="box-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Serial</th>
											<th>License</th>
											<th>등록일</th>
											<th>MAC</th>
											<th>제품 시리즈</th>
										</tr>
									</thead>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!--/.col (left) -->
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
	<script
		src="/app/resources/template/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="/app/resources/template/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

	<script>
		function format(d){
			var date = Date(d.regDate);
			console.log( date);

			return date;
		};
		
		$(function() {
			$('#example1').DataTable({
				"ajax": "/app/product/myProduct",
				"columns": [
					{ "data": "serial" },
					{ "data": "license" },
					{ "data": "regDate" },
					{ "data": "mac" },
					{ "data": "modelLine" }
				],
				columnDefs:[{targets:2, render:function(data){
					var d = new Date(data);
					var time =  
				    	d.getFullYear() + "-" +
						("00" + (d.getMonth() + 1)).slice(-2) + "-" + 
				    	("00" + d.getDate()).slice(-2) + " " + 
				    	("00" + d.getHours()).slice(-2) + ":" + 
				    	("00" + d.getMinutes()).slice(-2) + ":" + 
				    	("00" + d.getSeconds()).slice(-2)
				    	
					return time;
				}}],
			});
		});
	</script>

</body>
</html>

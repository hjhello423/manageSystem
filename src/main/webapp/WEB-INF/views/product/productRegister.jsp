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
				<h1>시리얼 등록</h1>
				<ol class="breadcrumb">
					<li><a href="/app"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">시리얼 등록</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<!-- general form elements -->
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">시리얼 등록</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form role="form" id="registerForm">
								<div class="col-md-6">
									<div class="box-body">
										<div class="form-group">
											<label for="memId">국가</label> 
											<select
												class="form-control m-b" id="nation" name="nation"
												onchange="changeModelLine()">
												<option value='KR' selected>한국 (KR)</option>
												<option value='JP'>일본 (JP)</option>
												<option value='CN'>중국 (CN)</option>
												<option value='TW'>대만 (TW)</option>
												<option value='TH'>태국 (TH)</option>
												<option value='SG'>싱가포르 (SG)</option>
												<option value='US'>미국 (US)</option>
												<option value='MY'>말레이시아 (MY)</option>
												<option value='NZ'>뉴질랜드 (NZ)</option>
											</select>
										</div>
										<div class="form-group">
											<label for="memMail">비밀번호</label> <input type="password"
												class="form-control" name="memPw">
										</div>
										<div class="form-group">
											<label for="memMail">mail</label> <input type="email"
												class="form-control" name="memMail">
										</div>
										<div class="form-group">
											<label for="memName">이름</label> <input type="text"
												class="form-control" name="memName">
										</div>
									</div>
									<!-- /.box-body -->
								</div>
								<div class="col-md-6">
									<div class="box-body">
										<div class="form-group">
											<label for="memId">제품 시리즈</label> 
											<select
												class="form-control m-b" id="nation" name="model"
												onchange="changeModelLine()">
												<option value='A' selected>A 시리즈</option>
												<option value='B'>B 시리즈</option>
												<option value='S'>S 시리즈</option>
											</select>
										</div>
										<div class="form-group">
											<label for="memMail">비밀번호</label> <input type="password"
												class="form-control" name="memPw">
										</div>
										<div class="form-group">
											<label for="memMail">mail</label> <input type="email"
												class="form-control" name="memMail">
										</div>
										<div class="form-group">
											<label for="memName">이름</label> <input type="text"
												class="form-control" name="memName">
										</div>
									</div>
									<!-- /.box-body -->
								</div>

								<div class="box-footer text-left">
									<button type="button" class="btn btn-primary" id="registerBtn">등록</button>
								</div>
							</form>
						</div>
					</div>
					<div class="col-md-1"></div>
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

	<script>
		$("#registerBtn").click(function() {
			checkData();
		});

		function checkData() {
			if ($("input[name=memName]").val().trim() == "") {
				alert("이름을 입력 하세요");
				$("input[name=memName]").focus();
				return;
			}
			if ($("input[name=memPw]").val().trim() == "") {
				alert("비밀번호를 입력 하세요");
				$("input[name=memName]").focus();
				return;
			}
			if ($("input[name=memMail]").val().trim() == "") {
				alert("이름을 입력 하세요");
				$("input[name=memName]").focus();
				return;
			}

			var formArray = $("#registerForm").serializeArray();
			var returnArray = {};
			for (var i = 0; i < formArray.length; i++) {
				returnArray[formArray[i]['name']] = formArray[i]['value'];
			}
			var _data = JSON.stringify(returnArray);
			addMember(_data);
		}

		function addMember(_data) {

			$.ajax({
				url : "/app/product/registration",
				type : "POST",
				data : _data,
				contentType : "application/json; charset=UTF-8",
				// dataType:'json',
				error : function(x) {
					if (x.status == 500) {
						alert("서버상에서 오류가 발생했습니다.\n" + x.responseText);
					}
					enter_flag = 0;
				},
				success : function(data) {
					alert("정보 수정 완료");
					window.location.replace("/app/member/myInfo");
				}
			});
		}
	</script>

</body>
</html>

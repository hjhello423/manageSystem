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
<link rel="stylesheet" href="/app/resources/template/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="/app/resources/template/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="/app/resources/template/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/app/resources/template/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="/app/resources/template/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="/app/resources/template/bower_components/jquery-ui/themes/base/jquery-ui.css">

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
											<label for="nation">국가</label> <select
												class="form-control m-b" id="nation" name="nation">
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
											<label for="mac">MAC</label> <input type="text"
												class="form-control" id="mac" name="mac">
										</div>
										<div class="form-group">
											<label for="memMail">OS</label> <select
												class="form-control m-b" id="os" name="os">
												<option value='Winsows' selected>Windows (W)</option>
												<option value='Centos'>CentOS (C)</option>
												<option value='Ubuntu'>Ubuntu (U)</option>
											</select>
										</div>
									</div>
									<!-- /.box-body -->
								</div>
								<div class="col-md-6">
									<div class="box-body">
										<div class="form-group">
											<label for="modelLine">제품 시리즈</label> <select
												class="form-control m-b" id="modelLine" name="modelLine"
												onchange="changeModelLine()">
												<option value="non" selected>----------</option>
												<option value="A">A 시리즈</option>
												<option value="B">B 시리즈</option>
												<option value="S">S 시리즈</option>
											</select>
										</div>
										<div class="form-group">
											<label for="model">제품 종류</label> <select
												class="form-control m-b" id="model" name="model">
												<option value="non" selected>----------</option>
											</select>
										</div>
										<div class="form-group">
											<label for="sale">발급 유형</label> <select
												class="form-control m-b" id="sale" name="sale">
												<option value='S' selected>납품 (S)</option>
												<option value='D'>데모 (D)</option>
												<option value='T'>시험 (T)</option>
											</select>
										</div>
									</div>
									<!-- /.box-body -->
								</div>

								<div class="box-footer text-left">
									<button type="button" class="btn btn-primary pull-right" id="registerBtn">등록</button>
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
    <script src="/app/resources/template/bower_components/jquery-ui/jquery-ui.js"></script>

	<script>
		// $(function() {
		// 	$("#endDate").datepicker();
		// });

		$("#registerBtn").click(function() {
			checkData();
		});

		function checkData() {
			var chkInput = /[\{\}\[\]\?\;\:\|\*\~\`\!\^\\\@\$\%\=\'\"]/gi;

			if ($("input[name=mac]").val().trim() == "") {
				alert("MAC값을 입력 하세요");
				$("input[name=mac]").focus();
				return;
            }

			if ($("input[name=mac]").val().trim().length < 5) {
				alert("MAC값이 너무 짧습니다");
				$("input[name=mac]").focus();
				return;
			}

			if ($("select[name=modelLine]").val() == "non") {
				alert("제품시리즈를 선택 하세요");
				return;
			}

			if ($("select[name=model]").val() == "non") {
				alert("제품종류를 선택 하세요");
				return;
			}

			var formArray = $("#registerForm").serializeArray();
			var returnArray = {};
			for (var i = 0; i < formArray.length; i++) {
				returnArray[formArray[i]['name']] = formArray[i]['value'];
			}
            var _data = JSON.stringify(returnArray);
            console.log(_data);
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

		function changeModelLine() {
			$("select[name=model]").find("option").remove();

			if ($("select[name=modelLine] option:selected").val() == 'A') {
				$("select[name=model]")
						.append(
								"<option value='10' selected='selected'>A시리즈 10</option>");
				$("select[name=model]").append(
						"<option value='20'>A시리즈 20</option>");
				$("select[name=model]").append(
						"<option value='30'>A시리즈 30</option>");
				$("select[name=model]").append(
						"<option value='40'>A시리즈 40</option>");
			} else if ($("select[name=modelLine] option:selected").val() == 'B') {
				$("select[name=model]")
						.append(
								"<option value='10' selected='selected'>B시리즈 10</option>");
				$("select[name=model]").append(
						"<option value='20'>B시리즈 20</option>");
				$("select[name=model]").append(
						"<option value='30'>B시리즈 30</option>");
				$("select[name=model]").append(
						"<option value='40'>B시리즈 40</option>");
			} else if ($("select[name=modelLine] option:selected").val() == 'S') {
				$("select[name=model]")
						.append(
								"<option value='10'selected='selected'>S시리즈 10</option>");
				$("select[name=model]").append(
						"<option value='20'>S시리즈 20</option>");
				$("select[name=model]").append(
						"<option value='30'>S시리즈 30</option>");
				$("select[name=model]").append(
						"<option value='40'>S시리즈 40</option>");
			}
		}
	</script>

</body>
</html>

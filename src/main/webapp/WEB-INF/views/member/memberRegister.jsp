<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Serial Manager</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="/app/resources/template/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/app/resources/template/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="/app/resources/template/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/app/resources/template/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/app/resources/template/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <b>Serial Manager</b>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">회원 등록</p>

    <form id=registerMemberForm>
      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="ID" name="memId">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="비밀번호" name="memPw">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="이름" name=memName>
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="e-mail" name="memMail">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      
      
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck"></div>
        </div>
        <div class="col-xs-4">
          <button type="button" class="btn btn-primary btn-block btn-flat" id="registerBtn">Register</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <a href="/app" class="text-center">로그인 화면으로 돌아가기</a>
  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
<script src="/app/resources/template/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/app/resources/template/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/app/resources/template/plugins/iCheck/icheck.min.js"></script>

<script>
  
//   $(function () {
//     $('input').iCheck({
//       checkboxClass: 'icheckbox_square-blue',
//       radioClass: 'iradio_square-blue',
//       increaseArea: '20%' /* optional */
//     });
//   });


  $("#registerBtn").click(function(){
    // checkData();
  });


  function checkData() {
      console.log( $("input[name=memId]").val() );

      if($("input[name=memId]").val().trim() == ""){
          alert("ID을 입력 하세요");
          $("input[name=memId]").focus();
          return ;
      }
      
    console.log("in ajax function");
    console.log($("#registerMemberForm").serialize());
    console.log($("#registerMemberForm").serializeArray());
    console.log(JSON.stringify($("#registerMemberForm")));
    
    var formArray = $("#registerMemberForm").serializeArray();
    var returnArray = {};

    for (var i = 0; i < formArray.length; i++){

      returnArray[formArray[i]['name']] = formArray[i]['value'];
    }
    

    returnArray.stringify;
    var _data = JSON.stringify(returnArray);

    addMember(_data);
  }

  function addMember(_data){

	$.ajax({
      url : "/app/member/api/register",
      type : "POST",
      data : _data,
      // data : JSON.stringify($("#registerMemberForm")),
      contentType : "application/json; charset=UTF-8",
      // dataType:'json',
      error : function(x){
          if(x.status == 500){
              alert("서버상에서 오류가 발생했습니다.\n" + x.responseText);
          }
          enter_flag = 0;
      },
      success : function(data){
        alert("회원 가입 완료");
      }
  });
  }


</script>
</body>
</html>

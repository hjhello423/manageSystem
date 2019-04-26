<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Registration Page</title>
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
          <button type="txt" class="btn btn-primary btn-block btn-flat" id="registerBtn">Register</button>
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
	  console.log("======");
	  console.log("======");
	  console.log("======");
	  sleep(5000);
      //checkData();
  });


  function checkData() {
      console.log( $("#input[name=memMail]").val() );
  }

  function addMember(){

    function addSerial(){
		$.ajax({
            url : "/app/member/api/register",
            type : "POST",
            data : $("#registerMemberForm").serialize(),
            dataType:'json',
            // timeout : _timeout,
            error : function(x){
                if(x.status == 500){
                    alert("서버상에서 오류가 발생했습니다.\n" + x.responseText);
                }
                enter_flag = 0;
            },
            success : function(data){
                if(data.redirect){
                    window.location.href = data.redirect;
                    return;
                }
                if(data.errMsg){
                    alert("서버상에서 오류가 발생했습니다.\n" + data.errMsg.SLmsg);
                    return;
                }else if(data.info == 'badMac'){
                    alert('MAC을 확인해 주세요');
                    return;
                }else if(data.ser){
                    if(confirm(data.ser + '이 등록 되었습니다\n정보페이지로 이동하시겠습니까?'))
                        window.location.href = '/infoSerial/'+data.ser;
                }else if(data.info == 'readFail'){
                    alert('등록된 정보를 가져오는데 실패했습니다.');
                    return;
                }else if(data.resultSer){
                    $("#result_ser").text(data.resultSer[0].ser);
                    $("#result_lic").text(data.resultSer[0].lic);
                    $("#result_note2").text(data.resultSer[0].note);
                    $("#btnGoSerialInfo").attr('onclick', "location.href='/infoSerial/" + data.resultSer[0].ser + "'");
                    $("#btnModal").trigger("click");
                }else
                    alert('알수 없는 오류가 발생했습니다');
            },
            beforeSend: function(){
                $('.wrap-loading').removeClass('display-none');
            },              
            complete: function(){
                $('.wrap-loading').addClass('display-none');
                enter_flag = 0;
            }
        });
	}
  }

//   functoin checkData(){

//     // console.log( $("#input[name=memMail]").val() );

//     // if($("#input[name=memMail]").val() == "non"){
//     //     alert("제품종류를 선택 하세요");
//     //     $("#model_line").focus();
//     //     enter_flag = 0;
//     //     return ;
//     // }
//   };


</script>
</body>
</html>

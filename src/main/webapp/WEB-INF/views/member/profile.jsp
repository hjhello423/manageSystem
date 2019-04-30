<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


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


            <!-- Main content -->
            <section class="content">
                <!-- Info boxes -->
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <!-- general form elements -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title">프로필 수정</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form role="form" id="registerMemberForm">
                                <div class="box-body">
                                    <div class="form-group">
                                        <label for="memId" >ID</label>
                                        <input type="text" class="form-control" name="memId" value=${member.memId} readonly>
                                    </div>
                                    <div class="form-group">
                                        <label for="memMail">비밀번호</label>
                                        <input type="password" class="form-control" name="memPw">
                                    </div>
                                    <div class="form-group">
                                        <label for="memMail">mail</label>
                                        <input type="email" class="form-control" name="memMail">
                                    </div>
                                    <div class="form-group">
                                        <label for="memName" >이름</label>
                                        <input type="text" class="form-control" name="memName">
                                    </div>
                                </div>
                                <!-- /.box-body -->

                                <div class="box-footer text-left">
                                    <button type="button" class="btn btn-primary" id="registerBtn">수정</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
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
                  $("#registerBtn").click(function(){
                    checkData();
                  });
                
                
                  function checkData() {
                    if($("input[name=memName]").val().trim() == ""){
                      alert("이름을 입력 하세요");
                      $("input[name=memName]").focus();
                      return ;
                    }
                    if($("input[name=memPw]").val().trim() == ""){
                      alert("비밀번호를 입력 하세요");
                      $("input[name=memName]").focus();
                      return ;
                    }
                    if($("input[name=memMail]").val().trim() == ""){
                      alert("이름을 입력 하세요");
                      $("input[name=memName]").focus();
                      return ;
                    }

                    var formArray = $("#registerMemberForm").serializeArray();
                    var returnArray = {};
                    for (var i = 0; i < formArray.length; i++){
                      returnArray[formArray[i]['name']] = formArray[i]['value'];
                    }
                    var _data = JSON.stringify(returnArray);
                    addMember(_data);
                  }
                  
                
                  function addMember(_data){
                
                  $.ajax({
                      url : "/app/member/profile",
                      type : "PUT",
                      data : _data,
                      contentType : "application/json; charset=UTF-8",
                      // dataType:'json',
                      error : function(x){
                          if(x.status == 500){
                              alert("서버상에서 오류가 발생했습니다.\n" + x.responseText);
                          }
                          enter_flag = 0;
                      },
                      success : function(data){
                        alert("정보 수정 완료");
                        window.location.replace("/app/member/myInfo");
                      }
                  });
                  }
                </script>

</body>
</html>

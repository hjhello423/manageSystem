<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 메인 메뉴 바 -->
<header class="main-header">
    <nav class="navbar navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <a href="/app" class="navbar-brand"><b>Serial Manager</b></a>
                <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#navbar-collapse">
                    <i class="fa fa-bars"></i>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse pull-left"
                id="navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                    	<a href="#" class="dropdown-toggle" data-toggle="dropdown">시리얼 관리 <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">전체 제품</a></li>
                            <li class="divider"></li>
                            <li><a href="#">A시리즈</a></li>
                            <li class="divider"></li>
                            <li><a href="#">B시리즈</a></li>
                            <li class="divider"></li>
                            <li><a href="#">S시리즈</a></li>
                        </ul>
                    </li>
                    <li class="active">
                    	<a href="/app/product/registration">시리얼 등록<span class="sr-only"></span></a>
                    </li>
                    <li class="dropdown"><a href="#" class="dropdown-toggle"
                        data-toggle="dropdown">회원관리 <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">회원 리스트</a></li>
                            <li class="divider"></li>
                            <li><a href="#">회원 등록</a></li>
                        </ul></li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">

                    <!-- Notifications Menu -->
                    <li class="dropdown notifications-menu">
                        <!-- Menu toggle button --> <a href="#" class="dropdown-toggle"
                        data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <span
                            class="label label-warning">10</span>
                    </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 10 notifications</li>
                            <li>
                                <!-- Inner Menu: contains the notifications -->
                                <ul class="menu">
                                    <li>
                                        <!-- start notification --> <a href="#"> <i
                                            class="fa fa-users text-aqua"></i> 5 new members joined
                                            today
                                    </a>
                                    </li>
                                    <!-- end notification -->
                                </ul>
                            </li>
                            <li class="footer"><a href="#">View all</a></li>
                        </ul>
                    </li>


                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
                        data-toggle="dropdown"> <span class="hidden-xs">'${member.memId}'님이
                                로그인 중</span>
                    </a>
                        <ul class="dropdown-menu">
                            <!-- Menu Body -->
                            <li class="user-body">
                                <div class="row">
                                    <div class="col-xs-6 text-center">
                                        <a href="#">내가 발급한 시리얼</a>
                                    </div>
                                    <div class="col-xs-6 text-center">
                                        <a href="#">내가 수정한 시리얼</a>
                                    </div>
                                </div> <!-- /.row -->
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="/app/member/myInfo" class="btn btn-default btn-flat">내
                                        정보</a>
                                </div>
                                <div class="pull-right">
                                    <a href="/app/logout" class="btn btn-default btn-flat">로그아웃</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-custom-menu -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</header>
<!-- Full Width Column -->
<!-- 메인 메뉴 바 end-->
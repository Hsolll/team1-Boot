<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!doctype html>
<html lang="ko">
 
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
    <link href="/resources/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/libs/css/style.css">
    <link rel="stylesheet" href="/resources/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <!-- <link rel="stylesheet" href="/resources/vendor/charts/chartist-bundle/chartist.css"> -->
    <!-- <link rel="stylesheet" href="/resources/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css"> -->
    <!-- <link rel="stylesheet" href="/resources/vendor/charts/c3charts/c3.css"> -->
    <link rel="stylesheet" href="/resources/vendor/fonts/flag-icon-css/flag-icon.min.css">
    <link rel="stylesheet" href="/resources/css/admincustom.css">
    <link rel="stylesheet" href="/resources/css/admincommon.css">
    <title>관리자 페이지</title>
</head>

<body>
    <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="/admin/main">OhMyBaby</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="/resources/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name">ohmybaby 관리자 </h5>
                                    <span class="status"></span><span class="ml-2">manager</span>
                                </div>
                                <a class="dropdown-item" href="#"><i class="fas fa-user mr-2"></i>내정보</a>
                                <a class="dropdown-item" href="#"><i class="fas fa-cog mr-2"></i>설정</a>
                                <a class="dropdown-item" href="/admin/logout"><i class="fas fa-power-off mr-2"></i>로그아웃</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!-- ============================================================== -->
        <!-- end navbar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            <li class="nav-divider">
                                관리자 메뉴
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link active" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1">
	                                <i class="fa fa-fw fa-user-circle"></i>
	                                회원관리
                                </a>
                                <div id="submenu-1" class="collapse submenu">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/memberList" aria-expanded="false" data-target="#submenu-1-2" aria-controls="submenu-1-2">일반회원</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/nmemberList">탈퇴회원</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fas fa-fw fa-file"></i>공지관리</a>
                                <div id="submenu-2" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/noticeList">공지사항</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/eventList">이벤트 공지</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fas fa-fw fa-inbox"></i>고객센터관리</a>
                                <div id="submenu-3" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/faq/faqList">FAQ</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/serviceCenterList">문의내역</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fab fa-fw fa-wpforms"></i>커뮤니티관리</a>
                                <div id="submenu-4" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/admCommunityList?c_category=A">유아용품후기</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/admCommunityList?c_category=B">레시피후기</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/admCommunityList?c_category=C">자유게시판</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5" aria-controls="submenu-5"><i class="fas fa-fw fa-table"></i>상품관리</a>
                                <div id="submenu-5" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/product/queuedList">승인관리</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/product/productList">중고상품</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/product/depositList">결제관리</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-7" aria-controls="submenu-7"><i class="fas fa-fw fa-chart-pie"></i>통계관리 <span class="badge badge-secondary">New</span></a>
                                <div id="submenu-7" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/statistics/productList">상품별</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/statistics/categoryList">카테고리별</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/statistics/localList">지역별</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- end left sidebar -->
        <!-- ============================================================== -->
        
        
        <!-- ============================================================== -->
        <!-- wrapper  -->
        <!-- ============================================================== -->
        
        <div class="dashboard-wrapper" style="top:10px;">
        	<div class="page-header">
				<h1 style="margin-bottom: 0;"><tiles:getAsString name="title" /></h1>
			</div>
        <!-- 내용 삽입 부분 -->
	        <tiles:insertAttribute name="main" /> 
         
        
           
            <!-- footer -->
            <!-- ============================================================== -->
            <div class="footer" style="position:fixed; bottom: 0;">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                             Copyright © 2018 Concept. All rights reserved. Dashboard by <a href="https://colorlib.com/wp/">Colorlib</a>.
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="text-md-right footer-links d-none d-sm-block">
                                <a href="javascript: void(0);">About</a>
                                <a href="javascript: void(0);">Support</a>
                                <a href="javascript: void(0);">Contact Us</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- end footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- end wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- end main wrapper  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <!-- bootstap bundle js -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="/resources/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="/resources/libs/js/main-js.js"></script>
    <!-- chart chartist js 
    <script src="/resources/vendor/charts/chartist-bundle/chartist.min.js"></script> -->
    <!-- sparkline js -->
    <!-- chart chartist js -->
    <!-- <script src="/resources/vendor/charts/chartist-bundle/chartist.min.js"></script>
    sparkline js
    <script src="/resources/vendor/charts/sparkline/jquery.sparkline.js"></script>
    <!-- morris js 
    morris js
    <script src="/resources/vendor/charts/morris-bundle/raphael.min.js"></script>
    <script src="/resources/vendor/charts/morris-bundle/morris.js"></script> -->
    <!-- chart c3 js 
    <script src="/resources/vendor/charts/morris-bundle/morris.js"></script>
    chart c3 js
    <script src="/resources/vendor/charts/c3charts/c3.min.js"></script>
    <script src="/resources/vendor/charts/c3charts/d3-5.4.0.min.js"></script>
    <script src="/resources/vendor/charts/c3charts/C3chartjs.js"></script>
    <script src="/resources/libs/js/dashboard-ecommerce.js"></script> -->
</body>
 
</html>
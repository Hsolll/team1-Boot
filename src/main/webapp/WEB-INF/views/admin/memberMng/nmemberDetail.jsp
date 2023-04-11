<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="/resources/include/js/common.js"></script>
		<script src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
		<title>nmemberDetail</title>
		
		<script type="text/javascript">
			$(function(){
				$(".dashboard-wrapper .page-header h1").html("탈퇴회원 상세정보");
				$("#listBtn").click(function(){
					location.href="/admin/nmemberList";
				});
			});
		</script>
	</head>

<body>

						<div style="width: 100%;">
                            <!-- ============================================================== -->
                            <!-- card profile -->
                            <!-- ============================================================== -->
                            <div class="card" style="flex-direction: row;">
                                <div class="card-body">
                                    <div class="user-avatar text-center d-block">
                                        <div>회원번호 : ${detail.u_no}</div>
                                    </div>
                                    <div class="text-center">
                                        <h2 class="font-24">${detail.u_name}</h2>
                                        <p>아이디 : ${detail.u_id}</p>
                                        <p>닉네임 : ${detail.u_nick}</p>
                                        <p>회원가입일 : ${detail.u_created_at}</p>
                                    </div>
                                </div>
                                <div class="card-body border-top">
                                    <h3 class="font-16">Contact Information</h3>
                                    <div>
                                        <ul class="list-unstyled mb-5">
	                                        <li class="mb-2"><i class="fas fa-fw fa-envelope mr-2"></i>${detail.u_email}</li>
	                                        <li class="mb-2"><i class="fas fa-fw fa-phone mr-2"></i>${detail.u_phone}</li>
	                                        <li class="mb-2"><i class="fas fa-address-book"></i> ${detailaddress.address}</li>
	                                        <li class="mb-2"><i class="fas fa-address-book"></i>${detailadd.address}</li>
	                                        <li class="mb-2"><i class="fas fa-star"></i> ${detail.u_grade}</li>
 	                                        <li class="mb-2"><i class="fas fa-user"></i> ${detail.u_status}</li>
 	                                        <li class="mb-2"><i class="fas fa-building"></i> ${bank.bank}</li>
 	                                        <li><i class="fas fa-money-bill-alt"></i> ${bank.account}</li>
                                    	</ul> 
                                    </div>
                                </div>
                                <div class="card-body border-top">
                                    <h3 class="font-16">Rating</h3>
                                    <h1 class="mb-0">2.2</h1>
                                    <div class="rating-star">
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <i class="fa fa-fw fa-star"></i>
                                        <p class="d-inline-block text-dark">14 Reviews </p>
                                    </div>
                                </div>
                                <div class="card-body border-top">
                                    <h3 class="font-16">Social Channels</h3>
                                    <div>
                                        <ul class="mb-0 list-unstyled">
	                                        <li class="mb-1"><a href="#"><i class="fab fa-fw fa-facebook-square mr-1 facebook-color"></i>fb.me/michaelchristy</a></li>
	                                        <li class="mb-1"><a href="#"><i class="fab fa-fw fa-twitter-square mr-1 twitter-color"></i>twitter.com/michaelchristy</a></li>
	                                        <li class="mb-1"><a href="#"><i class="fab fa-fw fa-instagram mr-1 instagram-color"></i>instagram.com/michaelchristy</a></li>
	                                        <li class="mb-1"><a href="#"><i class="fas fa-fw fa-rss-square mr-1 rss-color"></i>michaelchristy.com/blog</a></li>
	                                        <li class="mb-1"><a href="#"><i class="fab fa-fw fa-pinterest-square mr-1 pinterest-color"></i>pinterest.com/michaelchristy</a></li>
	                                        <li class="mb-1"><a href="#"><i class="fab fa-fw fa-youtube mr-1 youtube-color"></i>youtube/michaelchristy</a></li>
	                                    </ul>
                                    </div>
                                </div>
                                <div class="card-body border-top">
                                    <h3 class="font-16">Category</h3>
                                    <div>
                                        <a href="#" class="badge badge-light mr-1">Fitness</a>
                                        <a href="#" class="badge badge-light mr-1">Life Style</a>
                                        <a href="#" class="badge badge-light mr-1">Gym</a>
                                    </div>
                                </div>
                            </div>
                            <!-- ============================================================== -->
                            <!-- end card profile -->
                            <!-- ============================================================== -->
                        </div>
					<%-- ============== container 시작 ====================  --%>
					
						<div class="btnArea">
							<button id="listBtn" type="button" class="btn btn-dark">목록으로</button>
						</div>
					<%-- ============== container 종료 ====================  --%>
</body>
</html>
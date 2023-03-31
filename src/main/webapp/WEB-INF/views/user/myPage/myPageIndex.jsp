<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />	
		<title>Insert title here</title>
	
		<link rel="shortcut icon" href="/resources/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
		<link type="text/css" rel="stylesheet" href="/resources/include/css/myPageSub.css" />
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.css" />
		
		<script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
	<div id="layBodyWrap" class="mytmall_bodywrap">
            <div id="layBody">
                <!--BODY 내용:S-->
    
                <!-- 마이페이지 랩 -->
                <div class="mytmall_wrap_v2">
    
                    <!-- 마이페이지 탭 -->
      
       
                    <!-- 마이페이지 서브메뉴 영역 -->
                    <div class="mytmall_subArea_v2"> 
    <!-- 나의정보 -->
    <div class="myinfo_wrap_v4" id="leftMemberGradeInfoArea">
    
    <div class="mytmall_menu">
        
        <div class="mytmall_sub_menu" style="border-top: 0px;">
            <h3>나의 쇼핑 관리</h3>
            <ul>
                
                <li><a>좋아요(찜) 내역</a></li>
                <li><a>구매 내역</a></li>
                <li><a href="/member/sellList">판매 내역</a></li>
                
                
            </ul>
        </div>
        
        <div class="mytmall_sub_menu">
            <h3>커뮤니티 목록</h3>
            <ul>
                <li><a>작성글 확인</a></li>
                <li><a>신고 내역</a></li>
                <li><a>이벤트</a></li>       
            </ul>
        </div>
        <div class="mytmall_sub_menu">
            <h3>회원 관리</h3>
            <ul data-log-actionid-area="my_shopping_knowledge" data-log-actionid-label="menu" data-is-ab-send="1">
                <li><a href="/member/pwdChkForm">회원수정</a></li>
                <li><a href="/member/pwdChkForm2">비밀번호 수정</a></li>
                <li><a>주소 관리</a></li>
                <li><a href="/member/pwdChkForm3">회원탈퇴</a></li>
                
            </ul>
        </div>
     
        
    </div> 
    <!-- //서브메뉴 -->
    
    
    <!-- //Left영역 -->
    
                    </div>
                    <!-- //마이페이지 서브메뉴 영역 -->
    
    
                    <!-- 마이페이지 컨텐츠 영역 -->
                    <div class="mytmall_contArea">
                        <!-- //마이페이지 탭 -->
        <!-- 최근 주문 정보 -->
        <div class="mytmall_title" id="deliveryInfo">
            <h3 class="member"><strong>좋아요(찜) 목록</strong><a style="float:right;">더보기</a></h3>
        </div>
    
        <!-- 최근 주문정보  -->
        <div id="objOrderInfo">
    <div class="mytmall_tbl1" id="mytmall_tbl1_area" role="tabpanel" aria-label="리스트보기">
            <!-- //주문상품상세보기 레이어 --> <!--이 주석이 있을시 ie6에서 테이블위bg가 안나옵니다.개발시 빼주셔요 -->
            <table width="100%">
                <thead>
                <tr>
                    <th class="first" scope="col">카테고리</th>
                    <th scope="col">주문 상품 정보</th>
                    <th scope="col">상품금액(수량)</th>
                    <th scope="col">배송비(판매자)</th>
                    <th scope="col">주문상태       
                    </th>
                    <th scope="col">확인/취소/리뷰</th>
                </tr>
                </thead>
                <tbody>
    
                <tr class="first"> 
                    <td class="first" rowspan="1">
                        주문일자
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                            <img src="https://cdn.011st.com/11dims/resize/80/11src/product/4908371110/L300.jpg?607000000" alt="" onerror="javascript:this.src='//s.011st.com/img/product/no_image_80.gif';">        
                                    </span>
                            <div class="cont ">
                                <p><a href="#" id="a_layer_orderDetail_20221006533547059_0" role="button" aria-expanded="false">제목 누르면 이동</a></p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>330,280원</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2">무료</p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">구매확정</span>                        
    				</td>
				    <td>
				   아무거나
				    </td>
                </tr>
                <tr class="first"> 
                    <td class="first" rowspan="1">
                        주문일자
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                            <img src="https://cdn.011st.com/11dims/resize/80/11src/product/4908371110/L300.jpg?607000000" alt="" onerror="javascript:this.src='//s.011st.com/img/product/no_image_80.gif';">        
                                    </span>
                            <div class="cont ">
                                <p><a href="#" id="a_layer_orderDetail_20221006533547059_0" role="button" aria-expanded="false">제목 누르면 이동</a></p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>330,280원</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2">무료</p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">구매확정</span>                        
    				</td>
				    <td>
				   아무거나
				    </td>
                </tr>
                <tr class="first"> 
                    <td class="first" rowspan="1">
                        주문일자
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                            <img src="https://cdn.011st.com/11dims/resize/80/11src/product/4908371110/L300.jpg?607000000" alt="" onerror="javascript:this.src='//s.011st.com/img/product/no_image_80.gif';">        
                                    </span>
                            <div class="cont ">
                                <p><a href="#" id="a_layer_orderDetail_20221006533547059_0" role="button" aria-expanded="false">제목 누르면 이동</a></p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>330,280원</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2">무료</p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">구매확정</span>                        
    				</td>
				    <td>
				   아무거나
				    </td>
                </tr>
                
                
			       </tbody>
			    </table>
			</div>
			</div>
			
			<div class="mytmall_title" id="deliveryInfo">
            <h3 class="member"><strong>구매 목록</strong><a style="float:right;">더보기</a></h3>
        </div>
    
        <!-- 최근 주문정보  -->
        <div id="objOrderInfo">
    <div class="mytmall_tbl1" id="mytmall_tbl1_area" role="tabpanel" aria-label="리스트보기">
            <!-- //주문상품상세보기 레이어 --> <!--이 주석이 있을시 ie6에서 테이블위bg가 안나옵니다.개발시 빼주셔요 -->
            <table width="100%">
                <thead>
                <tr>
                    <th class="first" scope="col">카테고리</th>
                    <th scope="col">주문 상품 정보</th>
                    <th scope="col">상품금액(수량)</th>
                    <th scope="col">배송비(판매자)</th>
                    <th scope="col">주문상태       
                    </th>
                    <th scope="col">확인/취소/리뷰</th>
                </tr>
                </thead>
                <tbody>
    
                <tr class="first"> 
                    <td class="first" rowspan="1">
                        주문일자
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                            <img src="https://cdn.011st.com/11dims/resize/80/11src/product/4908371110/L300.jpg?607000000" alt="" onerror="javascript:this.src='//s.011st.com/img/product/no_image_80.gif';">        
                                    </span>
                            <div class="cont ">
                                <p><a href="#" id="a_layer_orderDetail_20221006533547059_0" role="button" aria-expanded="false">제목 누르면 이동</a></p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>330,280원</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2">무료</p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">구매확정</span>                        
    				</td>
				    <td>
				   아무거나
				    </td>
                </tr>
                <tr class="first"> 
                    <td class="first" rowspan="1">
                        주문일자
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                            <img src="https://cdn.011st.com/11dims/resize/80/11src/product/4908371110/L300.jpg?607000000" alt="" onerror="javascript:this.src='//s.011st.com/img/product/no_image_80.gif';">        
                                    </span>
                            <div class="cont ">
                                <p><a href="#" id="a_layer_orderDetail_20221006533547059_0" role="button" aria-expanded="false">제목 누르면 이동</a></p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>330,280원</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2">무료</p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">구매확정</span>                        
    				</td>
				    <td>
				   아무거나
				    </td>
                </tr><tr class="first"> 
                    <td class="first" rowspan="1">
                        주문일자
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                            <img src="https://cdn.011st.com/11dims/resize/80/11src/product/4908371110/L300.jpg?607000000" alt="" onerror="javascript:this.src='//s.011st.com/img/product/no_image_80.gif';">        
                                    </span>
                            <div class="cont ">
                                <p><a href="#" id="a_layer_orderDetail_20221006533547059_0" role="button" aria-expanded="false">제목 누르면 이동</a></p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>330,280원</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2">무료</p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">구매확정</span>                        
    				</td>
				    <td>
				   아무거나
				    </td>
                </tr>
                
                
			       </tbody>
			    </table>
			</div>
			</div>
			<div class="mytmall_title" id="deliveryInfo">
            <h3 class="member"><strong>판매 목록</strong><a style="float:right;">더보기</a></h3>
        </div>
    
        <!-- 최근 주문정보  -->
        <div id="objOrderInfo">
    <div class="mytmall_tbl1" id="mytmall_tbl1_area" role="tabpanel" aria-label="리스트보기">
            <!-- //주문상품상세보기 레이어 --> <!--이 주석이 있을시 ie6에서 테이블위bg가 안나옵니다.개발시 빼주셔요 -->
            <table width="100%">
                <thead>
                <tr>
                    <th class="first" scope="col">카테고리</th>
                    <th scope="col">주문 상품 정보</th>
                    <th scope="col">상품금액(수량)</th>
                    <th scope="col">배송비(판매자)</th>
                    <th scope="col">주문상태       
                    </th>
                    <th scope="col">확인/취소/리뷰</th>
                </tr>
                </thead>
                <tbody>
    
                <tr class="first"> 
                    <td class="first" rowspan="1">
                        주문일자
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                            <img src="https://cdn.011st.com/11dims/resize/80/11src/product/4908371110/L300.jpg?607000000" alt="" onerror="javascript:this.src='//s.011st.com/img/product/no_image_80.gif';">        
                                    </span>
                            <div class="cont ">
                                <p><a href="#" id="a_layer_orderDetail_20221006533547059_0" role="button" aria-expanded="false">제목 누르면 이동</a></p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>330,280원</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2">무료</p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">구매확정</span>                        
    				</td>
				    <td>
				   아무거나
				    </td>
                </tr>
                <tr class="first"> 
                    <td class="first" rowspan="1">
                        주문일자
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                            <img src="https://cdn.011st.com/11dims/resize/80/11src/product/4908371110/L300.jpg?607000000" alt="" onerror="javascript:this.src='//s.011st.com/img/product/no_image_80.gif';">        
                                    </span>
                            <div class="cont ">
                                <p><a href="#" id="a_layer_orderDetail_20221006533547059_0" role="button" aria-expanded="false">제목 누르면 이동</a></p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>330,280원</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2">무료</p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">구매확정</span>                        
    				</td>
				    <td>
				   아무거나
				    </td>
                </tr><tr class="first"> 
                    <td class="first" rowspan="1">
                        주문일자
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                            <img src="https://cdn.011st.com/11dims/resize/80/11src/product/4908371110/L300.jpg?607000000" alt="" onerror="javascript:this.src='//s.011st.com/img/product/no_image_80.gif';">        
                                    </span>
                            <div class="cont ">
                                <p><a href="#" id="a_layer_orderDetail_20221006533547059_0" role="button" aria-expanded="false">제목 누르면 이동</a></p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>330,280원</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2">무료</p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">구매확정</span>                        
    				</td>
				    <td>
				   아무거나
				    </td>
                </tr>
                
                
			       </tbody>
			    </table>
			</div>
			</div>
			</div>
			
   </div>
   </div>
   </div>
    </div>
	</body>
</html>
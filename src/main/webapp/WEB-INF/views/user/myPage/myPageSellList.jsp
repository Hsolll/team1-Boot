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
		<script type="text/javascript" src="/resources/include/js/paging.js"></script>
		<script type="text/javascript" src="/resources/include/js/heart.js"></script>
		
		<script type="text/javascript">
		$(function(){
		$(".p_no").click(function(){
			let p_no = $(this).attr("id")
			console.log(p_no)
			location.href = "/product/productDetail?p_no="+p_no
		})
		})
		var dateUtil = function() {
		    this.startObject = null;
		    this.endObject = null;
		    this.args = null;
		}

		dateUtil.prototype.formatLen = function(str) {
		    return str = (""+str).length<2 ? "0"+str : str;
		}

		dateUtil.prototype.formatDate = function(dateObject, delimiter) {
		    delimiter = delimiter || "-";
		    return dateObject.getFullYear() + delimiter + this.formatLen(dateObject.getMonth() + 1) + delimiter + this.formatLen(dateObject.getDate());
		}

		dateUtil.prototype.toDay = function(delimiter) {
		    return this.formatDate(new Date(), "-");
		}

		dateUtil.prototype.calDate = function() {
		    var year = this.args.year == null ? 0 : Number(this.args.year);
		    var month = this.args.month == null ? 0 : Number(this.args.month);
		    var day = this.args.day == null ? 0 : Number(this.args.day);
		    var result = new Date();

		    result.setYear(result.getFullYear() + year);
		    result.setMonth(result.getMonth() + month);
		    result.setDate(result.getDate() + day);
		    return this.formatDate(result, "-");
		}

		dateUtil.prototype.setDate = function(startObject, endObject, args) {
		    this.startObject = startObject;
		    this.endObject = endObject;
		    this.args = args;

		    document.getElementById(this.startObject).value = this.calDate()
		    document.getElementById(this.endObject).value = this.toDay();
		}

		var dateUtilObj = new dateUtil();
		</script>
		
	</head>
	<body>
	<input type="hidden" name="u_no" id="u_no" value="${memberLogin.u_no }" />
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
            <h3 class="member"><strong>판매 목록</strong></h3>
        </div>
    
        <!-- 최근 주문정보  -->
        <div id="objOrderInfo">
    <div class="mytmall_tbl1" id="mytmall_tbl1_area" role="tabpanel" aria-label="리스트보기">
            <!-- //주문상품상세보기 레이어 --> <!--이 주석이 있을시 ie6에서 테이블위bg가 안나옵니다.개발시 빼주셔요 -->
            <table width="100%">
                <thead>
                <tr>
                    <th class="first" scope="col">카테고리</th>
                    <th scope="col">상품 정보</th>
                    <th scope="col">상품 제목</th>
                    <th scope="col">상품 가격</th>
                    <th scope="col">상품 상태</th>
                    <th scope="col">확인/취소/리뷰</th>
                </tr>
                </thead>
                <tbody>
                
                
    
                
                <c:choose>
				<c:when test="${not empty productList}">
					<c:forEach var="product" items="${productList}">
                 <tr class="first"> 
                    <td class="first" rowspan="1">
                        ${product.p_cate}
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                      <c:if test="${not empty product.p_thumb}">
								<img class="thumb_c p_no" id="${product.p_no}" src="/uploadStorage/product/thumbnail/${product.p_thumb}"/>
							</c:if>
							<c:if test="${empty product.p_thumb}">
								<img class="p_no" id="${product.p_no}" src="/resources/images/common/noimage.png"/>
							</c:if>              
                                    </span>
                            <div class="cont ">
                                <p class="p_no" id="${product.p_no}">${product.p_name}</p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>${product.p_title}</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2"> <c:if test="${product.p_price == 0}">무료나눔</c:if>
						  <c:if test="${product.p_price != 0}">${product.p_price}</c:if></p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">${product.p_status}</span>                        
    				</td>
				    <td>
				   아무거나
				    </td>
                </tr>
                 </c:forEach>
			       </c:when>
			       <c:otherwise>
			       	<p>상품이 존재하지 않습니다</p>
			       	</c:otherwise>
			       	</c:choose>
			       </tbody>
			       
			      
			    </table>
			</div>
			</div>
			</div>
			<input type="date" name="start_date" id="start_date" placeholder="시작일자" class="form-control">
					<input type="date" name="end_date" id="end_date" placeholder="종료일자" class="form-control">
			<input type="text" id="startDate" name="startDate" />~
<input type="text" id="endDate" name="endDate" />
<input type="button" value="오늘" onclick="dateUtilObj.setDate('startDate', 'endDate', {})" />
<input type="button" value="7일" onclick="dateUtilObj.setDate('startDate', 'endDate', {day: -7})" />
<input type="button" value="1달" onclick="dateUtilObj.setDate('startDate', 'endDate', {month: -1})" />
<input type="button" value="1년" onclick="dateUtilObj.setDate('startDate', 'endDate', {year: -1})" />


	<%-- =================== 페이징 출력 시작 (클라이언트 페이징 소스 그대로 가져오기) ============== --%>
	<div class="text-center">
		<ul class="pagination">
			<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous">
					<a href="${pageMaker.startPage - 1}">Previous</a>
				</li>
			</c:if>
					
			<!-- 바로가기 번호 출력 -->
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
					<a href="#">${num}</a>
				</li>
			</c:forEach>
	
			<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
			<c:if test="${pageMaker.next}">
				<li class="paginate_button next">
					<a href="${pageMaker.endPage + 1 }">Next</a>
				</li>
			</c:if> 
		</ul>
	</div>
			
   </div>
   </div>
   </div>
    </div>
	</body>
</html>
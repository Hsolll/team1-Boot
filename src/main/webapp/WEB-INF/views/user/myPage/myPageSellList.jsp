<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/myPageSub.css" />
<script type="text/javascript" src="/resources/include/js/heart.js"></script>
<!-- <script type="text/javascript" src="/resources/include/js/paging.js"></script>  -->
		<script type="text/javascript">
		$(function(){
			 $(".buyid").click(function(e){
				alert("판매완료 되었습니다.");
				$("#p_status").attr('value','판매완료');
				$("#p_no").attr('value',$(this).data('id'));
				$("#p_buyid").attr('value',$(this).prev('#input_buyid').val());
				$("#sellList").attr({
					"method" :"post",
					"action" : "/member/productStatus"
				})
				$("#sellList").submit();
			})
			
			$(".p_no").click(function(){
				let p_no = $(this).attr("id")
				console.log(p_no)
				location.href = "/product/productDetail?p_no="+p_no
				})
			
				$(".paginate_button a").click(function(e) {
		 			 e.preventDefault();
		 			 $("#sellList").find("input[name='pageNum']").val($(this).attr("href"));
		 			 goPage();
		 			});
			}); 
		

	 	function goPage(){
	 		if($("#search").val()=="all"){
	 			$("#keyword").val("");
	 		}
	 		$("#f_search").attr({
	 			"method" : "get" ,
	 			"action" : "/member/sellList"
	 		})
	 		$("#f_search").submit();
	 	}
		
		</script>
	</head>
	<body>
	
	
	
	
	
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin:0;">
	
	<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum }">
					<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount }">
					<div class="form-group" style="float:right;">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="sc_title">제목</option>
							<option value="u_name">작성자</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control">
						<button type='button' id="searchData" class="btn btn_success">검색</button>
					</div>
				</form>
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
                <tbody id="list">
                
                
    
                
                <c:choose>
				<c:when test="${not empty productSellList}">
				<form id="sellList">
				<input type="hidden" id="p_status" name="p_status" />
					<input type="hidden" id="p_no" name="p_no"/>
					<input type="hidden" id="p_buyid" name="p_buyid" />
					<c:forEach var="productSellList" items="${productSellList}">
					
                 <tr class="first"> 
                    <td class="first" rowspan="1">
                        ${productSellList.p_cate}
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="thumb" class="chk"></label>
                            <span class="img">                     
                                      <c:if test="${not empty productSellList.p_thumb}">
								<img class="thumb_c p_no" id="${productSellList.p_no}" src="/uploadStorage/product/thumbnail/${productSellList.p_thumb}"/>
							</c:if>
							<c:if test="${empty productSellList.p_thumb}">
								<img class="p_no" id="${productSellList.p_no}" src="/resources/images/common/noimage.png"/>
							</c:if>              
                                    </span>
                            <div class="cont ">
                                <p class="p_no" id="${productSellList.p_no}">${productSellList.p_name}</p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>${productSellList.p_title}</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2"> <c:if test="${productSellList.p_price == 0}">무료나눔</c:if>
						  <c:if test="${productSellList.p_price != 0}">${productSellList.p_price}</c:if></p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">${productSellList.p_status}</span>                     
    				</td>
				    <td>
				    <c:choose>
				    	<c:when test="${not empty productSellList.p_buyid}">
				    		${productSellList.p_buyid}
				    	</c:when>
				    	<c:otherwise>
				    		<input type="text" id="input_buyid" name="input_buyid" /> 
							<button type="button" id="buyid" name="buyid" class="buyid" data-id="${productSellList.p_no}">판매확정</button>
				    	</c:otherwise>
					    	</c:choose>
							    </td>    
                					</tr> 
					                 </c:forEach>
					                 	</form>
								      </c:when>
			       					<c:otherwise>
									       <td>상품이 존재하지 않습니다</td>
									       <td></td>
									       <td></td>
									       <td></td>
									       <td></td>
									       <td></td>
			       					</c:otherwise>
			       				</c:choose>
			       			</tbody>
			    		</table>
					</div>
				</div>
			</div>
		</div>
		
		
			
		<%-- =================== 페이징 출력 시작 (클라이언트 페이징 소스 그대로 가져오기) ============== --%>
	<div class="text-center">
				<ul class="pagination">
					<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1 }">Previous</a>
						</li>
					</c:if>
					
					<!-- 바로가기 번호 출력 -->
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
							<a href='${num }'>${num }</a>
						</li>
					</c:forEach>
					
					<!--  다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
					<c:if test="${pageMaker.next }">
						<li class="paginate_button next">
							<a href="${pageMaker.endPage+1 }">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
			
   
   
   
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<link type="text/css" rel="stylesheet" href="/resources/include/css/myPageSub.css" />
		
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
		
		</script>
	</head>
	<body>
		<input type="hidden" name="u_no" id="u_no" value="${memberLogin.u_no }">
	<input type="hidden" name="u_no" id="u_no" value="${member.u_no }">

     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin:0;">
         <div class="mytmall_contArea">
                        <!-- //마이페이지 탭 -->
        <!-- 최근 주문 정보 -->
        <div class="mytmall_title" id="deliveryInfo">
            <h3 class="member"><strong>좋아요(찜) 목록</strong><a href="/member/likeList" style="float:right;">더보기</a></h3>
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
				<c:when test="${not empty productLikeList}">
					<c:forEach var="productLike" items="${productLikeList}">
                 <tr class="first"> 
                    <td class="first" rowspan="1">
                        ${productLike.p_cate}
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                      <c:if test="${not empty productLike.p_thumb}">
								<img class="thumb_c p_no" id="${productLike.p_no}" src="/uploadStorage/product/thumbnail/${productLike.p_thumb}"/>
							</c:if>
							<c:if test="${empty product.p_thumb}">
								<img class="p_no" id="${productLike.p_no}" src="/resources/images/common/noimage.png"/>
							</c:if>              
                                    </span>
                            <div class="cont ">
                                <p class="p_no" id="${productLike.p_no}">${productLike.p_name}</p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>${productLike.p_title}</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2"> <c:if test="${productLike.p_price == 0}">무료나눔</c:if>
						  <c:if test="${productLike.p_price != 0}">${productLike.p_price}</c:if></p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">${productLike.p_status}</span>                        
    				</td>
				    <td>
				   <c:if test="${not empty productLike.p_buyid}">
								${productLike.p_buyid}
							</c:if>
							<c:if test="${empty productLike.p_buyid}">
								${productLike.p_buyid}
							</c:if>    
							<!-- <button type="button" id="buyid">판매확정</button> -->
				    </td>
                </tr>
                 </c:forEach>
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
			
			<div class="mytmall_title" id="deliveryInfo">
            <h3 class="member"><strong>구매 목록</strong><a href="/member/buyList" style="float:right;">더보기</a></h3>
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
				<c:when test="${not empty productBuyList}">
					<c:forEach var="productBuy" items="${productBuyList}">
                 <tr class="first"> 
                    <td class="first" rowspan="1">
                        ${productBuy.p_cate}
                    </td>  
                    <td>    
                        <div class="orderProdInfo_v2">
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
                            <span class="img">                     
                                      <c:if test="${not empty productBuy.p_thumb}">
								<img class="thumb_c p_no" id="${productBuy.p_no}" src="/uploadStorage/product/thumbnail/${productBuy.p_thumb}"/>
							</c:if>
							<c:if test="${empty product.p_thumb}">
								<img class="p_no" id="${productBuy.p_no}" src="/resources/images/common/noimage.png"/>
							</c:if>              
                                    </span>
                            <div class="cont ">
                                <p class="p_no" id="${productBuy.p_no}">${productBuy.p_name}</p>
							</div>
                            <div id="layer_orderDetail_20221006533547059_0" class="layer_relative"></div>
                        </div>
                    </td>     
                    <td>
                        <p class="fnt_1">                     
                            <strong>${productBuy.p_title}</strong>    
                        </p>
                    </td>
                    <td rowspan="1">      
                        <p class="fnt_2"> <c:if test="${productBuy.p_price == 0}">무료나눔</c:if>
						  <c:if test="${productBuy.p_price != 0}">${productBuy.p_price}</c:if></p>
                    </td>
                    <td class="td-center">           
                        <span class="fc_blue">${productBuy.p_status}</span>                        
    				</td>
				    <td>
				   <c:if test="${not empty productBuy.p_buyid}">
								${productBuy.p_buyid}
							</c:if>
							<c:if test="${empty productBuy.p_buyid}">
								${productBuy.p_buyid}
								<input type="text" id="p_buyid" name="p_buyid" />
								<button type="button" id="buyid" name="buyid" class="buyid">판매확정</button>
							</c:if>    
							<!-- <button type="button" id="buyid">판매확정</button> -->
				    </td>
                </tr>
                 </c:forEach>
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
			<div class="mytmall_title" id="deliveryInfo">
            <h3 class="member"><strong>판매 목록</strong><a href="/member/sellList" style="float:right;">더보기</a></h3>
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
                <tbody>
                
                
    
                
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
                            <label for="ck20221006533547059_1" class="chk"><input type="hidden" name="ck20221006533547059" id="ck20221006533547059_1" value="1"></label>
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
   
    

 
    
	</body>
</html>
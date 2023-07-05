<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link type="text/css" rel="stylesheet" href="/resources/include/css/myPageSub.css" />
	<link type="text/css" rel="stylesheet" href="/resources/include/css/myPageInfo.css" />
	<script type="text/javascript" src="/resources/include/js/heart.js"></script>
    <script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("마이페이지");
			$(".buyid").click(function(){
	            var pbuyid = prompt("구매자 아이디를 입력해주세요.");
	            alert("거래완료 되었습니다.");
	            $("#p_no").attr('value',$(this).data('buyid'));
	            $("#p_buyid.pbuyid").attr('value',pbuyid);
	            $("#p_status").attr('value','거래완료');
	            console.log(pbuyid,$("#p_buyid"));
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
	        <div class="omb_contArea">
	            <div id="bannerSec" style="width: 420px; margin-bottom: -121px;"><img width="420" height="120" src='/resources/images/loginmain.png' alt="banner"></div>
	            <div id="mc-dashboard" class="status" style="float:right;">
	                <ul class="statusul">
	                    <li class="kiFKDs my-lnb-cs__item">
	                        <strong class="statusstrong">판매중</strong>
	                        <div class="statusdiv my__stat__num">
	                            <a>
	                                <span>
	                                    <span class="my__stat__num-font">${productMyPageSellSale }</span>
	                                    <span class="my__stat__unit">건</span>
	                                </span>
	                            </a>
	                        </div>
	                    </li>
	                    <li class="kiFKDs my-lnb-cs__item">
	                        <strong class="statusstrong">거래완료</strong>
	                        <div class="statusdiv">
	                            <a>
	                                <span>
	                                    <span class="my__stat__num-font">${ productMyPageSellSoldOut}</span>
	                                    <span class="my__stat__unit">건</span>
	                                </span>
	                            </a>
	                        </div>
	                    </li>
	                    <li class=" kiFKDs my-lnb-cs__item">
	                        <strong class="statusstrong">구매완료</strong>
	                        <div class="statusdiv my__stat__num">
	                            <a>
	                                <span>
	                                    <span class="my__stat__num-font">${productMyPageBuyListCnt }</span>
	                                    <span class="my__stat__unit">건</span>
	                                </span>
	                            </a>
	                        </div>
	                    </li>
	                </ul>
	            </div>
	            <div class="omb_title" id="deliveryInfo">
	                <h3 class="member"><strong>구매 목록</strong><a href="/member/buyList" style="float:right;">더보기</a></h3>
	            </div>
	            <div id="objOrderInfo">
	                <div class="omb_tbl1" id="omb_tbl1_area" role="tabpanel" aria-label="리스트보기">
	                    <table width="100%">
	                        <thead>
	                            <tr>
	                                <th class="first" scope="col">카테고리</th>
	                                <th scope="col">상품 제목</th>
	                                <th scope="col">상품명</th>
	                                <th scope="col">가격</th>
	                                <th scope="col">상품 상태</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <c:choose>
	                                <c:when test="${not empty productBuyList}">
	                                    <c:forEach var="productBuyList" items="${productBuyList}">
	                                        <tr class="first"> 
	                                            <td class="first" rowspan="1">
	                                                ${productBuyList.p_cate}
	                                            </td>  
	                                            <td class="ptitle">    
	                                                <div class="orderProdInfo_v2">
	                                                    <label for="1" class="chk"></label>
	                                                    <span class="img">                     
	                                                        <c:if test="${not empty productBuyList.p_thumb}">
	                                                            <img class="thumb_c p_no" id="${productBuyList.p_no}" src="/uploadStorage/product/thumbnail/${productBuyList.p_thumb}"/>
	                                                        </c:if>
	                                                        <c:if test="${empty productBuyList.p_thumb}">
	                                                            <img class="p_no" id="${productBuyList.p_no}" src="/resources/images/common/noimage.png"/>
	                                                        </c:if>              
	                                                    </span>
	                                                    <div class="cont ">
	                                                        <p class="p_no" id="${productBuyList.p_no}">${productBuyList.p_title}</p>
	                                                    </div>
	                                                    <div class="layer_relative"></div>
	                                                </div>
	                                            </td>     
	                                            <td class="pname">
	                                                <p class="fnt_1">                     
	                                                    <strong>${productBuyList.p_name}</strong>    
	                                                </p>
	                                            </td>
	                                            <td rowspan="1">      
	                                                <p class="fnt_2">
	                                                     <c:if test="${productBuyList.p_price == 0}">무료나눔</c:if>
	                                                     <c:if test="${productBuyList.p_price != 0}">${productBuyList.p_price}</c:if>
	                                                </p>
	                                            </td>
	                                            <td class="td-center">           
	                                                <span class="fc_blue">${productBuyList.p_status}</span>                        
	                                            </td>
	                                            <%--  <td>
	                                                <c:if test="${not empty productBuy.p_buyid}">
	                                                    ${productBuy.p_buyid}
	                                                </c:if>
	                                                <c:if test="${empty productBuy.p_buyid}">
	                                                    ${productBuy.p_buyid}
	                                                    <input type="text" id="p_buyid" name="p_buyid" />
	                                                    <button type="button" id="buyid" name="buyid" class="buyid">판매확정</button>
	                                                </c:if>    
	                                            </td> --%>
	                                        </tr>
	                                    </c:forEach>
	                                </c:when>
	                                <c:otherwise>
	                                    <td colspan="6">상품이 존재하지 않습니다</td>
	                                </c:otherwise>
	                            </c:choose>
	                        </tbody>
	                    </table>
	                </div>
	            </div>
	            <div class="omb_title" id="deliveryInfo">
	                <h3 class="member"><strong>판매 목록</strong><a href="/member/sellList" style="float:right;">더보기</a></h3>
	            </div>
	            <div id="objOrderInfo">
	                <div class="omb_tbl1" id="omb_tbl1_area" role="tabpanel" aria-label="리스트보기">
	                    <table width="100%">
	                        <thead>
	                            <tr>
	                                <th class="first" scope="col">카테고리</th>
	                                <th scope="col">상품제목</th>
	                                <th scope="col">상품명</th>
	                                <th scope="col">상품 가격</th>
	                                <th scope="col">상품 상태</th>
	                                <th scope="col">판매 관리</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <c:choose>
	                                <c:when test="${not empty productSellList}">
	                                    <form id="sellList">
	                                        <input type="hidden" id="p_status" name="p_status" />
	                                        <input type="hidden" id="p_no" name="p_no" />
	                                        <input type="hidden" id="p_buyid" name="p_buyid" class="pbuyid" />
	                                        <c:forEach var="productSellList" items="${productSellList}" varStatus="status">
	                                            <tr class="first"> 
	                                                <td class="first" rowspan="1" data-num="${productSellList.p_cate }">
	                                                    ${productSellList.p_cate}
	                                                </td>  
	                                                <td class="ptitle">    
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
	                                                            <p class="p_no" id="${productSellList.p_no}">${productSellList.p_title}</p>
	                                                        </div>
	                                                        <div class="layer_relative"></div>
	                                                    </div>
	                                                </td>     
	                                                <td class="pname">
	                                                    <p class="fnt_1">                     
	                                                        <strong>${productSellList.p_name}</strong>    
	                                                    </p>
	                                                </td>
	                                                <td rowspan="1">      
	                                                    <p class="fnt_2"> <c:if test="${productSellList.p_price == 0}">무료나눔</c:if>
	                                                        <c:if test="${productSellList.p_price != 0}">${productSellList.p_price}</c:if>
	                                                    </p>
	                                                </td>
	                                                <td class="td-center">           
	                                                    <span class="fc_blue">${productSellList.p_status}</span>                     
	                                                </td>
	                                                <td class="buy_id">
	                                                    <c:choose>
	                                                        <c:when test="${not empty productSellList.p_buyid}">
	                                                            ${productSellList.p_buyid}
	                                                        </c:when>
	                                                        <c:otherwise>
	                                                            <button type="button" id="buyid" name="buyid" class="buyid" style="border: 1px solid #dadada;" data-buyid="${productSellList.p_no}">판매확정</button>
	                                                        </c:otherwise>
	                                                    </c:choose>
	                                                </td>    
	                                            </tr> 
	                                        </c:forEach>
	                                    </form>
	                                </c:when>
	                                <c:otherwise>
	                                    <td colspan="6">상품이 존재하지 않습니다</td>
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
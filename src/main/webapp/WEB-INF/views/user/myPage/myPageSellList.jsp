<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/myPageSub.css" />
<script type="text/javascript" src="/resources/include/js/heart.js"></script>
<!-- <script type="text/javascript" src="/resources/include/js/paging.js"></script>  -->
<link rel="stylesheet" href="/resources/include/css/myPageSearch.css">
      <script type="text/javascript">
            $(function(){
               $(".buyid").click(function(){
                  
                   var pbuyid = prompt("구매자 아이디를 입력해주세요.");
                       
                  alert("판매완료 되었습니다.");
                  
                  $("#p_no").attr('value',$(this).data('buyid'));
                  $("#p_buyid.pbuyid").attr('value',pbuyid);
                  $("#p_status").attr('value','판매완료');
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
               
                  
            $("input[type='checkbox']").click(function(){
               if(this.checked) {
                    const checkboxes = $("input[type='checkbox']");
                    for(let ind = 0; ind < checkboxes.length; ind++){
                        checkboxes[ind].checked = false;
                    }
                    this.checked = true;
                } else {
                    this.checked = false;
                }
            });
      
      
            /* 검색 후 검색 대상과 검색 단어 출력 */
            let word="<c:out value='${ProductVO.keyword}' />";
            let value="";
            
            if(word!=""){
               $("#keyword").val("<c:out value='${ProductVO.keyword}' />");
               $("#search").val("<c:out value='${ProductVO.search}' />");
            
              
                  //:contains()는 특정 텍스트를 포함한 요소반환    
                  if($("#search").val()=='p_buyid') value = "#list tr td.buy_id";
                  else if($("#search").val()=='p_title') value="#list tr td.ptitle";
                  else if($("#search").val()=='p_name') value="#list tr td.pname";
                  console.log($(value + ":contains('" + word + "')").html());
                  //$("#list tr td.goDetail:contains('노력')").html() => <span class='required'>노력</span>에 대한 명언
                   $(value + ":contains('" + word + "')").each(function () {
                     let regex = new RegExp(word,'gi');
                     $(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
                   });
              
            }
            
            /* 입력 양식 enter 제거 */
            $("#keyword").bind("keydown", function(event){
                if (event.keyCode == 13) {
                       event.preventDefault();
                   }
            });
            
            /* 검색 대상이 변경될 때마다 처리 이벤트 */
            $("input[type='checkbox']").change(function() {
               
               let search = $("input[type='checkbox'][name='key']:checked").val()
               $("input[name='search']").val(search);
               //console.log($("input[name='search']").val());
               
               if($("input[id='all']").is(":checked")){
                  $("#keyword").val("전체 데이터를 조회합니다.");
               }else if($("#search").val()!="all"){
                  $("#keyword").val("");
                  $("#keyword").focus();
               }
            });
            
            
            /* 검색 버튼 클릭 시 처리 이벤트 */
            $("#searchData").click(function(e){
            	e.preventDefault();
               if($("input[type='checkbox'][name='key']:checked").val() != "all"){ // 제목/내용/작성자 선택시 검색어 유효성 체크
                  if(!chkData("#keyword","검색어를")) return;
               }
               goPage();
            });
            
            /* 페이징 처리 함수 */
            $(".paginate_button a").click(function(e){
               e.preventDefault();
               $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));  
               goPage();
            });
            
            
         }); // $ 함수 종료
         
         /* 검색을 위한 실질적인 처리 함수 */
         function goPage(){
            if($("#search").val()=="all"){
               $("#keyword").val("");
            }
      
            $("#f_search").attr({
               "method":"get",
               "action":"/member/sellList"
            });
            $("#f_search").submit();
         }
         
         
      
      </script>
   </head>
   <body>
   
   <input type="hidden" name="u_no" value="${memberLogin.u_no }" />
   <input type="hidden" name="u_id" value="${update.u_id }" />
   
   <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin:0;">
   
   <%-- ===================== 검색 기능 시작 ===================== --%>
         <div class="searchbox">
            <form id="f_search" name="f_search">
               <input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
                  <input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
                   <input type="hidden" id="search" name="search" value="all" />
                   <div class="keywordbox">
                       <span class="keyword">
                           <input type="checkbox" name="key" id="all" class="m0" value="all" ${search eq "" or search eq null ? "checked" : "" } />
                           <label for="all">통합검색</label>
                           <input type="checkbox" name="key" id="p_buyid" value="p_buyid" class="m0" ${search eq "p_buyid" ? "checked" : ""} />
                           <label for="u_id">구매자ID</label>
                           <input type="checkbox" name="key" id="p_title" value="p_title" class="m0" ${search eq "p_title" ? "checked" : ""}/>
                           <label for="p_title">제목</label>
                           <input type="checkbox" name="key" id="p_name" value="p_name" class="m0" ${search eq "p_name" ? "checked" : ""}/>
                           <label for="p_name">상품명</label>
                       </span>
                   </div>
                   <div class="searchbox_right block">
                       <span>
                           <input type="text" class="w280 pl10" name="keyword" id="keyword" placeholder="검색어를 입력하세요" maxlength="30" value="${keyword}"/>
                       </span>
                       <a href="#" id="searchData" class="btn_gray fr"><span class="icon"></span>검 색</a>
                   </div>
                </form>
            </div>
         <%-- ===================== 검색 기능 종료 ===================== --%>

           <div class="mytmall_contArea">
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
	                    <th scope="col">상품제목</th>
	                    <th scope="col">상품명</th>
	                    <th scope="col">상품 가격</th>
	                    <th scope="col">상품 상태</th>
	                    <th scope="col">판매 관리</th>
                	</tr>
                </thead>
                	<tbody id="list">
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
                    <c:if test="${productSellList.p_price != 0}">${productSellList.p_price}</c:if></p>
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
                   <%-- ===================== 페이징 출력 시작 ===================== --%>
         <div class="text-center">
            <ul class="pagination">
               <c:if test="${ pageMaker.prev }">
                  <li class="paginate_button previous">
                     <a href="${ pageMaker.startPage - 1 }">Previous</a>
                  </li>
               </c:if>
               <!-- 바로가기 번호 출력 -->
               <c:forEach var="num" begin="${ pageMaker.startPage }"
                               end="${ pageMaker.endPage }">
                  <li class="paginate_button ${ pageMaker.cvo.pageNum == num ? 'active':'' }">
                     <a href="${num}" > ${num}</a>
                  </li>
               </c:forEach>
               <!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
               <c:if test="${ pageMaker.next }">
                     <li class="paginate_button next">
                        <a href="${ pageMaker.endPage + 1 }">Next</a>
                     </li>
               </c:if>
            </ul>
         </div>
         <%-- ===================== 페이징 출력 종료 ===================== --%>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>
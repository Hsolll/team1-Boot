<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
<script type="text/javascript" >
	$(document).ready(function(){
		
		$(".p_cate_all").click()
		console.log("로딩완료")
	})
</script>
<style type="text/css">
	 table,th,td{
				border:1px solid black;
				border-collapse: collapse;	
				overflow :hidden;			
			}
			table{
			
			}
 			th,td{ 
 				width : 100px; 
				heigth : 500px; 
			} 
			td.thumb{
				width : 100px; 
				heigth : 500px; 
			}
			#full,#empty{
				width: 100px;
				height: 100px;
			}
			.heart {
			  position: relative;
 			  width: 50px; 
 			  height: 50px; 
			}
			
			#full {
			  position: absolute;
			  top: 0;
			  left: 0;
			  z-index: 1;
			  width:50px;
			  height:50px;
			}
			
			#empty {
			  position: absolute;
			  top: 0;
			  left: 0;
			  z-index: 2;
		      width:50px;
			  height:50px;
			}
  			.he{
  				display:none;
  			}
  			.clist{
/*   				display:none; */
  			}
  			.active a{
  				font-weight : bold;
  				color : green
  			}
  		
			
</style>

	</head>
	<body>
		<h1><a href="/">OH MY BABY</a></h1>
<!-- 		중고마켓 페이지로 돌아가기 -->
		<h2><a href="/product/productList">중고마켓페이지</a></h2>
		<p>${member.u_name}님 안녕하세요</p>
		<!-- 카테고리선택 -->
		<div id="selCategory">
			<!-- 카테고리선택(전체) -->
			<input class="p_cate_all" type="button" value="전체"/>
			<!-- 세부분류 -->
			<input class="p_cate" type="button" value="유아의류"/>
			<input class="p_cate" type="button" value="유모차"/>
			<input class="p_cate" type="button" value="카시트"/>
			<input class="p_cate" type="button" value="장난감"/>
			<input class="p_cate" type="button" value="도서,교육"/>
			<input class="p_cate" type="button" value="아기신발"/>
			<input class="p_cate" type="button" value="승용완구"/>
			<input class="p_cate" type="button" value="아기침대"/>
			<input class="p_cate" type="button" value="기타"/>
		</div>
		
		<!-- 지역별로 검색 -->
		<div id="local">
			<select id="sido_code">
				<option>선택</option>
			</select>
			<select id="sigoon_code">
				<option>선택</option>
			</select>
			<select id="dong_code">
				<option>선택</option>
			</select>
			<div><span>지역</span></div>
			<form id="pForm">
				시<input  type="text" id="p_local" name="p_local" readonly/><br>
				구<input  type="text" id="p_local2" name="p_local" readonly/><br>
				동<input  type="text" id="p_local3" name="p_local" readonly/><br>
			</form>
				<input type="button" id="pConfirm" value="지역 선택완료"/>
		</div>
		
		<!-- 카테고리로 검색 -->
		<div id="category"></div>
		
		<!-- 상품 등록하기 -->
		<div id="NewConfrim"> 
			<input type="button" id="insert" value="등록하기">
		</div>
	</body>
	
</html>
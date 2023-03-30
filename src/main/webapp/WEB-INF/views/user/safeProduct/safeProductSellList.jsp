<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
        <link rel="stylesheet" href="/resources/include/css/sellList.css" />
		<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("판매목록");
			

		});
		</script>
	</head>
	<body>
		<div class="container">
			
			<%-- ================= 판매목록 보여주기 시작 ================= --%>
            <div class="sell_list">
	            <table class="tb_sell">
	                <colgroup>
	                    <col style="width: 10%">
	                    <col>
	                    <col style="width: 18%">
	                    <col style="width: 15%">
	                    <col style="width: 13%">
	                    <col style="width: 14%">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col">등록일자</th>
	                        <th scope="col">제목</th>
	                        <th scope="col">상품명</th>
	                        <th scope="col">가격</th>
	                        <th scope="col">현재상태</th>
	                        <th scope="col">수정/삭제</th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>2023.03.21</td>
	                        <td class="tl"><a href=""> 제목</a></td>
	                        <td>상품명</td>
	                        <td>100,000원</td>
	                        <td>판매중</td>
	                        <td>
	                            <a href="" class="btn_swh">수정</a>
	                            <a href="" class="btn_swh">삭제</a>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
			<%-- ================= 판매목록 보여주기 끝 ================= --%>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<style>
            .title_area {
                width: 600px;
                height: 55px;
                margin: 0 auto;
            }
            .title_area > h3 {
                padding: 16px 0px 15px;
                font-size: 18px;
                color: #000;
                line-height: 25px;
                text-align: center;
                font-weight: bold;
            }
            .addressList {
                margin: 0 20px;
            }
            .addressInfo {
                padding: 20px 0;
                border-bottom: 1px solid #e8e8e8;
                width: 600px;
                margin: 0 auto;
            }
            .address_name_box {
                position: relative;
                margin-bottom: 6px;
                padding: 4px 106px 4px 0;
            }
            .address_name_box > strong {
                font-size: 16px;
                line-height: 22px;
                word-break: break-all;
                color: #000;
            }
            .deleteBtn_area {
                position: absolute;
                top: 0;
                right: 0;
            }
            .deleteBtn_area > button {
                outline: none;
                appearance: none;
                background-color: transparent;
                cursor: pointer;
                width: 44px;
                border: 1px solid #dcdee0;
                border-radius: 6px;
                font-weight: 500;
                line-height: 28px;
                color: #1e1e23;
                font-size: 14px;
            }
            .total_address {
                line-height: 22px;
                word-break: break-all;
                color: #404048;
                margin-top: 10px;
                font-size: 14px;
            }
            .add_name_default {
            	position: absolute;
			    right: 10px;
			    font-size: 12px;
			    color: #6d6d6d;
            }
        </style>
        
        <script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("마이페이지");
				
				$(".addDeleteBtn").click(function(){
					let add_no = $(this).parents("li").attr("data-no");
					console.log("add_no = " + add_no);
					$("#add_no").val(add_no);
					
					$("#form_data").attr({
						"method":"get",
						"action":"/address/deleteAddress"
					});
					$("#form_data").submit();
				});
			
				
			});
		</script>
	</head>
	<body>
		<c:if test="${!empty msg}">
			<script>
				alert("${msg}");
				<c:remove var="msg"/>
			</script>
		</c:if>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin:0;">
			<div class="title_area">
			    <h3>배송지 목록</h3>
			</div>
			
			<div>
				<form id="form_data">
					<input type="hidden" name="add_no" id="add_no" />
				</form>
			    <ul class="addressList">
			    	<c:choose>
						<c:when test="${ not empty addressList }">
							<c:forEach var="address" items="${ addressList }" varStatus="status">
								<li class="addressInfo" data-no="${address.add_no}">
									<div class="address_name_box">
						                <strong>${ address.add_name }</strong>
						                <c:if test="${address.add_name eq '기본배송지' }">
							                <span class="add_name_default">기본배송지는 회원수정 메뉴에서 변경할 수 있습니다.</span>
						                </c:if>
						                <c:if test="${address.add_name ne '기본배송지' }">
							                <div class="deleteBtn_area">
							                    <button class="addDeleteBtn">삭제</button>
							                </div>
						                </c:if>
						            </div>
						            <p class="total_address">${ address.full_address }</p>
					            </li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li>배송지 정보가 존재하지 않습니다.</li>
						</c:otherwise>
					</c:choose>
			    </ul>
			</div>
		</div>
	</body>
</html>
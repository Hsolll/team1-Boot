<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page trimDirectiveWhitespaces="true" %>
	<c:set var="uri" value='${requestScope["javax.servlet.forward.request_uri"] }' />
	
		<c:if test="${memberLogin.u_type == 'U'}">
          <ul class="nav nav-sidebar">
            <li class="active"><a>나의 쇼핑 관리</a></li>
            <li><a href="/member/likeList">좋아요(찜) 내역</a></li>
            <li><a href="/member/buyList">구매 내역</a></li>
            <li><a href="/member/sellList">판매 내역</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a>나의 작성글 확인</a></li>
            <li><a href="/member/myPageCommunityList?c_category=A">유아용품후기</a></li>
            <li><a href="/member/myPageCommunityList?c_category=B">이유식레시피</a></li>
            <li><a href="/member/myPageCommunityList?c_category=C">자유게시판</a></li>
            <li><a href="/member/myPageServiceList">문의 내역</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a>회원 관리</a></li>
             <li><a href="/member/pwdChkForm">회원수정</a></li>
             <li><a href="/member/pwdChkForm2">비밀번호 수정</a></li>
             <li><a>계좌 관리</a></li>
             <li><a href="/member/addressCheck">주소 관리</a></li>
             <li><a href="/member/pwdChkForm3">회원탈퇴</a></li>
          </ul>
          </c:if>
          
          <c:if test="${memberLogin.u_type == 'N'}">
          <ul class="nav nav-sidebar">
            <li class="active"><a>나의 쇼핑 관리</a></li>
            <li><a href="/member/likeList">좋아요(찜) 내역</a></li>
            <li><a href="/member/buyList">구매 내역</a></li>
            <li><a href="/member/sellList">판매 내역</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a>나의 작성글 확인</a></li>
            <li><a href="/member/myPageCommunityList?c_category=A">유아용품후기</a></li>
            <li><a href="/member/myPageCommunityList?c_category=B">이유식레시피</a></li>
            <li><a href="/member/myPageCommunityList?c_category=C">자유게시판</a></li>
            <li><a href="/member/myPageServiceList">문의 내역</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a>회원 관리</a></li>
             <li><a href="/member/socialUpdateForm?u_no=${memberLogin.u_no }">회원수정</a></li>
             <li><a>계좌 관리</a></li>
             <li><a href="/member/addressCheck">주소 관리</a></li>
          </ul>
          </c:if>
          
          <c:if test="${memberLogin.u_type == 'K'}">
          <ul class="nav nav-sidebar">
            <li class="active"><a>나의 쇼핑 관리</a></li>
            <li><a href="/member/likeList">좋아요(찜) 내역</a></li>
            <li><a href="/member/buyList">구매 내역</a></li>
            <li><a href="/member/sellList">판매 내역</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a>나의 작성글 확인</a></li>
            <li><a href="/member/myPageCommunityList?c_category=A">유아용품후기</a></li>
            <li><a href="/member/myPageCommunityList?c_category=B">이유식레시피</a></li>
            <li><a href="/member/myPageCommunityList?c_category=C">자유게시판</a></li>
            <li><a href="/member/myPageServiceList">문의 내역</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a>회원 관리</a></li>
             <li><a href="/member/socialUpdateForm?u_no=${memberLogin.u_no }">회원수정</a></li>
             <li><a>계좌 관리</a></li>
             <li><a href="/member/addressCheck">주소 관리</a></li>
          </ul>
          </c:if>
      
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!-- 최초요청을 반복해야 다른곳을 가더라도 오류없이 갈수 있다. -->

<!-- 상단 메뉴 부분 -->
<header>
	<a href="${root }main"><img  style="width: 200px;" src="../image/jonggak_un_full_logo_green.png" /></a>
	<div>
		<c:choose>
			<c:when test="${loginUserBean.userLogin == true }">
				<!-- 로그인시 -->
				<a href="${root }user/logout">로그아웃</a>
			</c:when>
			<c:otherwise>
				<!-- 로그아웃시  -->
				<a href="${root }user/login">로그인</a>
			</c:otherwise>
		</c:choose>
	</div>
</header>
<nav>
	<%-- <a href="${root }">학생 정보수정</a>  --%>
	<%-- <a href="${root }admin/studentInsert">학생 정보등록</a>  --%>
	<%-- <a href="${root }">교수 정보수정</a>  --%>
	<%-- <a href="${root }admin/professorInsert">교수 정보등록</a> --%> 
	<a href="${root }admin/studentInfo">학생 리스트</a> 
	<a href="${root }admin/professorInfo">교수 리스트</a> 
	<a href="${root }board/main">공지사항 리스트</a> 
	<%-- <a href="${root }board/write">공지사항 작성</a> --%>
</nav>
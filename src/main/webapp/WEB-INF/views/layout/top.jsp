<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!-- 최초요청을 반복해야 다른곳을 가더라도 오류없이 갈수 있다. -->

<header class="header" style="height: 100px;">
	<div style="display: flex">
		<a class="navbar-brand" href="${root }main"> <img
			src="../image/jonggak_un_full_logo_green.png"
			style="width: 170px; height: 60px;" />
		</a>
		<c:choose>
			<c:when test="${loginUserBean.userLogin == true }">
				<c:choose>
					<c:when test="${loginUserBean.user_idx != 3 }">
						<div
							style="margin-left: 15px; display: flex; flex-direction: column; border: 1px solid gray; border-radius: 5px; justify-content: center;">
							<span
								style="padding: 3px; font-size: 14px; font-weight: 600; color: gray; margin-right: 10px;">이름
								: ${loginUserBean.user_name }</span><span
								style="padding: 3px; font-size: 14px; font-weight: 600; color: gray; margin-right: 10px;">교번
								: ${loginUserBean.user_id }</span>
						</div>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
	</div>
	<div>
		<%-- <a href="${root }user/modify" class="nav-link">정보수정</a> --%>
		<c:choose>
			<c:when test="${loginUserBean.userLogin == true }">
				<a href="${root }user/logout">로그아웃</a>
			</c:when>
			<c:otherwise>
				<a href="${root }user/login">로그인</a>
			</c:otherwise>
		</c:choose>
	</div>
</header>
<c:choose>
	<c:when test="${loginUserBean.user_idx == 3 }">
		<nav>
			<%-- <a href="${root }">학생 정보수정</a>  --%>
			<%-- <a href="${root }admin/studentInsert">학생 정보등록</a>  --%>
			<%-- <a href="${root }">교수 정보수정</a>  --%>
			<%-- <a href="${root }admin/professorInsert">교수 정보등록</a> --%>
			<a href="${root }admin/studentInfo">학생 리스트</a> <a
				href="${root }admin/professorInfo">교수 리스트</a> <a
				href="${root }board/main">공지사항 리스트</a> 
				<%-- <a href="${root }board/write">공지사항
				작성</a> --%>
		</nav>
	</c:when>
</c:choose>

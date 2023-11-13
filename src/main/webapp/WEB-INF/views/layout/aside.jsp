<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<c:set var="URL" value="${pageContext.request.requestURL}" />
<aside class="aside">
	<c:choose>
		<c:when test="${loginUserBean.user_idx == 1 }">
			<div>
				<a href="${root }board/main">공지사항</a>
			</div>
			<div>
				<a href="${root }student/stu_tt">강의 시간표</a>
			</div>
			<div>
				<a href="${root }student/nowGradeInquiry">금학기 성적 조회</a>
			</div>
			<div>
				<a href="${root }student/allGradeInquiry">전체성적조회</a>
			</div>
			<div>
				<a href="${root }student/lectureInquiry">강의평가</a>
			</div>
		</c:when>
		<c:when test="${loginUserBean.user_idx == 2 }">
			<div>
				<a href="${root }board/main">공지사항</a>
			</div>
			<div>
				<a href="${root }professor/pro_tt">강의 시간표</a>
			</div>
			<div>
				<a href="${root }professor/lectureCheck?year=2023">교수 강의 평가 확인</a>
			</div>
			<div>
				<a href="${root }professor/gradeInsert">교수성적입력</a>
			</div>
			<div>
				<a href="${root }professor/grade">교수입력확인</a>
			</div>
		</c:when>
		<c:when test="${loginUserBean.user_idx == 3 }">
			<div>
				<a href="${root }student/lectureInquiry" class="nav-link">학생 강의
					평가 조회</a>
			</div>
			<div>
				<a href="${root }professor/lectureCheck/?year=2023" class="nav-link">교수 강의
					평가 확인</a>
			</div>
			<div>
				<a href="${root }student/stu_tt" class="nav-link">강의 시간표</a>
			</div>
			<div>
				<a href="${root }professor/pro_tt" class="nav-link">교수 시간표</a>
			</div>
			<div>
				<a href="${root }professor/gradeInsert" class="nav-link">교수성적입력</a>
			</div>
			<div>
				<a href="${root }professor/grade" class="nav-link">교수입력확인</a>
			</div>
			<div>
				<a href="${root }student/allGradeInquiry" class="nav-link">전체성적조회</a>
			</div>
			<div>
				<a href="${root }student/nowGradeInquiry" class="nav-link">금학기
					성적 조회</a>
			</div>
		</c:when>
	</c:choose>



</aside>

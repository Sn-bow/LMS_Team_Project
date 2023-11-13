<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<title>grade check</title>
<style>
body {
	margin: 0;
	padding: 0;
}

.header {
	width: 100%;
	height: 100px;
	background: linear-gradient(155deg, rgba(0, 128, 0, 0.2),
		rgba(0, 128, 0, 0.5) 60%);
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid rgb(130, 130, 130);
}

.header>img {
	width: 180px;
	height: 65px;
	margin-left: 15px;
}

.header>div {
	margin-right: 15px;
}

.header>div>a {
	font-size: 20px;
	font-weight: 600;
	margin: 10px;
	text-decoration: none;
	color: rgba(0, 0, 0, 0.6);
}

.header>div>a:hover {
	color: rgba(0, 0, 0, 1);
}

.gradeCheck-main {
	width: 100%;
	display: flex;
}

.aside {
	width: 150px;
	height: 100vh;
	border-right: 1px solid black;
	padding: 15px;
	background: rgba(0, 0, 0, 0.9);
	border-right: 1px solid rgb(130, 130, 130);
}

.aside>div {
	border-bottom: 1px solid rgb(130, 130, 130);
	height: 50px;
	margin-bottom: 10px;
}

.aside>div:nth-child(1) {
	margin-top: 25px;
}

.aside>div>a {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	text-decoration: none;
	color: rgba(240, 240, 240);
	transition: all 0.3s ease-in-out;
}

.aside>div>a:hover {
	color: rgba(0, 0, 0, 0.9);
	background-color: rgba(240, 240, 240);
	transition: all 0.3s ease-in-out;
}

.inquiry-contain {
	width: 100%;
	height: 100%;
	padding: 35px;
}

.student-big-box {
	width: 100%;
	height: 100%;
	border-bottom: 1px solid rgb(200, 200, 200);
	padding-bottom: 20px;
}

h3 {
	font-size: 22px;
}

.student-info-box {
	width: 100%;
	display: flex;
}

.student-info-box {
	font-size: 18px;
	font-weight: 600;
}

.student-info-box>div:nth-child(2) {
	margin-left: 15px;
}

.student-info-box>div>span {
	padding: 6px;
	border: 2px solid gray;
	border-radius: 5px;
}

.class-box {
	width: 100%;
	height: 100%;
}

.class-box>table {
	width: 100%;
	border: 1px solid black;
	border-collapse: collapse;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 2px solid rgb(220, 220, 220);
	padding: 10px;
}

th {
	border-top: 3px solid rgba(0, 128, 0, 0.7);
	background-color: rgba(0, 128, 0, 0.3);
}

td {
	text-align: center;
}

td>a {
	text-decoration: none;
	color: blue;
	font-weight: 700;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<main class="gradeCheck-main">
		<c:import url="/WEB-INF/views/layout/aside.jsp"/>
		<section class="inquiry-contain">
			<div class="student-big-box">
				<h3>학생정보</h3>
				<div class="student-info-box">
					<div>
						이름 : <span>${loginUserBean.user_id }</span>
					</div>
					<div>
						학번 : <span>${loginUserBean.user_name }</span>
					</div>
				</div>
			</div>
			<div class="class-box">
				<h3>수강과목</h3>
				<table class="classTable">
					<tr>
						<th>강의평가</th>
						<th>강의번호</th>
						<th>교과목명</th>
						<th>담당교수</th>
						<th>학점</th>
					</tr>
					<c:forEach var="lecture" items="${lectureList}">
						<tr>
							<c:if test="${empty lecture.confirm_id}">
								<td><a href="${root }student/lectureInsert/${lecture.mycla_id}">강의평가</a></td>
							</c:if>
							<c:if test="${not empty lecture.confirm_id}">
								<td>완료</td>
							</c:if>
							<td>${lecture.cla_id}</td>
							<td>${lecture.cla_name}</td>
							<td>${lecture.pro_name}</td>
							<td>${lecture.cla_grade}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</section>
	</main>
</body>
</html>

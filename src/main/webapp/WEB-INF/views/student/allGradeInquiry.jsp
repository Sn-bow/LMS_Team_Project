<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="kr.co.jonggak.dto.SelectYearGradeDto" %>
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

.gradeBigBox {
	width: 100%;
	margin-top: 15px;
	padding: 10px;
}
</style>
</head>
<body>

	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<main class="gradeCheck-main">
		<c:import url="/WEB-INF/views/layout/aside.jsp" />
		<section class="gradeBigBox">
			<div>
				<h3 style="margin-top: 10px; margin-bottom: 10px;">년도/학기별취득학점</h3>
				<table>
					<tr>
						<th rowspan="2">학년도</th>
						<th rowspan="2">학기</th>
						<th colspan="3">신청학점</th>
						<th colspan="3">취득학점</th>
						<th rowspan="2">평점</th>
						<th rowspan="2">상세보기</th>
					</tr>
					<tr>
						<th>전공</th>
						<th>교양</th>
						<th>총신청학점</th>
						<th>전공</th>
						<th>교양</th>
						<th>총취득학점</th>
					</tr>
					<c:forEach items="${StuApplyGrade }" var="StuApplyGrade">
						<c:set var="applyM_gradeTotal" value="${applyM_gradeTotal + StuApplyGrade.applyM_grade}" scope="page" />
						<c:set var="applyE_gradeTotal" value="${applyE_gradeTotal + StuApplyGrade.applyE_grade}" scope="page" />
						<c:set var="applyGradeTotal" value="${applyGradeTotal + StuApplyGrade.applyTotal_grade}" scope="page" />
						<c:set var="getM_gradeTotal" value="${getM_gradeTotal + StuApplyGrade.getM_grade}" scope="page" />
						<c:set var="getE_gradeTotal" value="${getE_gradeTotal + StuApplyGrade.getE_grade}" scope="page" />
						<c:set var="getGradeTotal" value="${getGradeTotal + StuApplyGrade.getTotal_gtade}" scope="page" />
						<c:set var="getGradeAvg" value="${getGradeAvg + Math.floor(StuApplyGrade.getTotal_gtade / StuApplyGrade.cla_count)}" scope="page" />
						
						<tr>						
							<td>${StuApplyGrade.choess_year}</td>
							<td>${StuApplyGrade.cla_sem}</td>
							<td>${StuApplyGrade.applyM_grade}</td>
							<td>${StuApplyGrade.applyE_grade}</td>
							<td>${StuApplyGrade.applyTotal_grade}</td>
							<td>${StuApplyGrade.getM_grade}</td>
							<td>${StuApplyGrade.getE_grade}</td>
							<td>${StuApplyGrade.getTotal_gtade}</td>
							<td>${Math.floor(StuApplyGrade.getTotal_gtade / StuApplyGrade.cla_count)}</td>
							<td>
								<button class="applyGrade" 
								value1="${StuApplyGrade.cla_sem}"
								value2="${StuApplyGrade.choess_year}"
								value3="${StuApplyGrade.stu_id}" onclick="inquiry(${StuApplyGrade.cla_sem} ,${StuApplyGrade.choess_year}, ${StuApplyGrade.stu_id})">조회</button>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<th colspan='2'>총합계</th>
						<th>${applyM_gradeTotal}</th>
						<th>${applyE_gradeTotal}</th>
						<th>${applyGradeTotal}</th>
						<th>${getM_gradeTotal}</th>
						<th>${getE_gradeTotal}</th>
						<th>${getGradeTotal}</th>
						<th>평균평점</th>
						<th>${getGradeAvg}</th>
					</tr>
				</table>
			</div>
			<div class="semesterGrade-inquiry class">
				<h3>-년 -학기 성적조회</h3>
				<div class="allGrade-inquiry-box">
					<table class="choseTable">
						<tr>
							<th>학년도</th>
							<th>학기</th>
							<th>강의번호</th>
							<th>강의명</th>
							<th>이수구분</th>
							<th>학점</th>
							<th>성적</th>
							<th>등급</th>
						</tr>
					</table>
				</div>
			</div>
		</section>
	</main>
	<script>
	
	const inquiry = (cla_sem, choess_year, stu_id) => {	
		let nGrade = "";
	    let eGrade = "";
		
		console.log("cla_sem : ", cla_sem)
		console.log("choess_year : ", choess_year)
		console.log("stu_id : ", stu_id)
		
	    const responseData = {	    		
	        choess_year : choess_year,
	        cla_sem : cla_sem,
	        stu_id : stu_id
	    }
		
    	$.ajax({
        	url: '${pageContext.request.contextPath}/api/MinuteGrade',
        	method: 'POST',
        	contentType: 'application/json; charset=utf-8',
        	data: JSON.stringify(responseData),
        	success: (data) => {
        		console.log("javascript console.log : ", data)
        		$.each(data, (index, item) => {
        		let html = "";
	        		html += "<h3>" + choess_year + "년 " + cla_sem + "학기 성적조회" + "</h3>" 
	        		html += "<table>"
	        		html += "<tr>" 
	        		html += "<th>학년도</th>"
	        		html += "<th>학기</th>"
	        		html += "<th>강의번호</th>"
	        		html += "<th>강의명</th>"
	        		html += "<th>이수구분</th>"
	        		html += "<th>학점</th>"
	        		html += "<th>성적</th>"
	        		html += "<th>등급</th>"
	        		html += "</tr>"
	        		$.each(data, (index, item) => {
        			if (item.total_score >= 95) {
        				  nGrade = 4.5;
        				  eGrade = "A+";
        				} else if (item.total_score >= 90) {
        				   nGrade = 4.0;
        				   eGrade = "A";
        				 } else if (item.total_score >= 85) {
        				   nGrade = 3.5;
        				   eGrade = "B+";
        				 } else if (item.total_score >= 80) {
        				   nGrade = 3.0;
        				   eGrade = "B";
        				 } else if (item.total_score >= 75) {
        				   nGrade = 2.5;
        				   eGrade = "C+";
        				 } else if (item.total_score >= 70) {
        				   nGrade = 2.0;
        				   eGrade = "C";
        				 } else if (item.total_score >= 65) {
        				   nGrade = 1.5;
        				   eGrade = "D+";
        				 } else if (item.total_score >= 60) {
        				   nGrade = 1.0;
        				   eGrade = "D";
        				 } else if (item.total_score < 60){
        				   nGrade = 0.0;
        				   eGrade = "F";
        				 }
        				nGrade = nGrade.toFixed(1);
        				
		        		html +=	"<tr>"
		       			html += "<td>" + item.choess_year + "</td>"
		       			html += "<td>" + item.cla_sem + "</td>"
		       			html += "<td>" + item.cla_id + "</td>"
		       			html += "<td>" + item.cla_name + "</td>"
		       			html += "<td>" + item.cla_state + "</td>"
		       			html += "<td>" + item.cla_grade + "</td>"
		       			html += "<td>" + nGrade + "</td>"
		       			html += "<td>" + eGrade + "</td>"
		        		html += "</tr>"
		        	});
	        		
	        		html +="</table>"
	        		
	        		$(".semesterGrade-inquiry").html(html);
        		});
        	},
        	error: (xhr, status, error) => {
        		console.log("AJAX 요청 실패 : ", status, error);
        		console.log(xhr)
        	}
        });
    }
    
    
    
    	
    </script>
</body>
</html>

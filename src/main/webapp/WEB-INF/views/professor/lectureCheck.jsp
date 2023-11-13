<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.flex {
	display: flex;
	flex-direction: column;
}

.feedback-box>span {
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<main class="gradeCheck-main">
		<c:import url="/WEB-INF/views/layout/aside.jsp" />
		<section class="inquiry-contain">
			<div class="student-big-box">
				<h3>강의정보</h3>
				<form action="${root}lectureCheck" method="get">
				<p>년도 : 
					<select name = "year">
						<option>2023</option>
						<option>2022</option>
						<option>2021</option>
					</select>
					<button type="submit">조회</button>
				</p>
				</form>
				<table>
					<tr>
						<th>년도</th>
						<th>강의번호</th>
						<th>과목명</th>
						<th>이수구분</th>
						<th>학년</th>
						<th>학점</th>
						<th>강의실</th>
						<th>요일</th>
						<th>시간</th>
						<th>비고</th>
					</tr>
					<c:forEach items="${prfClassList}" var="prfClass">
						<tr>
							<td>${prfClass.clayear}</td>
							<td>${prfClass.cla_id}</td>
							<td>${prfClass.cla_name}</td>
							<td>전공</td>
							<td>${prfClass.cla_level}</td>
							<td>${prfClass.cla_grade}</td>
							<td>${prfClass.claroom_name}</td>
							<td>${prfClass.cla_week}</td>
							<td>${prfClass.cla_open}~${prfClass.cla_close}</td>
							<td><button onclick="search(this)"
									value="${prfClass.cla_id}">선택</button></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="class-box">
				<h3>수강과목</h3>
				<table class="classTable">
					<tr>
						<th rowspan="2">수강인원</th>
						<th rowspan="2">응답인원</th>
						<th colspan="4">문항별 평균점수(1번 ~ 4번)</th>
						<th rowspan="2">총점</th>
						<th rowspan="2">평점 평균</th>
					</tr>
					<tr>
						<th style="background-color: white">1</th>
						<th style="background-color: white">2</th>
						<th style="background-color: white">3</th>
						<th style="background-color: white">4</th>
					</tr>
					<tr>
						<td class="all-st"></td>
						<td class="rep-st"></td>
						<td class="item1-avg"></td>
						<td class="item2-avg"></td>
						<td class="item3-avg"></td>
						<td class="item4-avg"></td>
						<td class="avg-sum"></td>
						<td class="avg-avg"></td>
					</tr>
				</table>
			</div>
			<div>
				<h3>강의평가 항목</h3>
				<div class="question-box flex">
					<span>Q1. 나는 이 교과목에 흥미를 가지고 적극적으로 참여하였다</span> <span>Q2.
						교수님은 규정된 수업시간(결강, 휴보강 관련)을 준수하엿습니까?</span> <span>Q3. 교수님은 수업에 학생의
						관심과 참여를 유도하기 위해 노력하였습니까?</span> <span>Q4. 강의내용이 평가(이론시험, 실습, 구두평가,
						보고서 등)에 적절히 반영되었습니까?</span>
				</div>
			</div>
			<div>
				<h3>피드백 내용</h3>
				<div class="feedback-box flex">
					
				</div>
			</div>
		</section>
	</main>
	<script>
	
		const search = (event) => {
			console.log("aaa")
			let claId = event.value;
			const claIdObject = {
					claId : claId
			}
			
			$.ajax({
                url: '${pageContext.request.contextPath }/api/LectureInfo',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(claIdObject),
                success: (data) => {
                	console.log(data)
                		$(".all-st").html(data.all_student_count + "명")
                		$(".rep-st").html(data.response_student_count + "명")
                		$(".item1-avg").html(data.item1_avg + "점")
                		$(".item2-avg").html(data.item2_avg + "점")
                		$(".item3-avg").html(data.item3_avg + "점")
                		$(".item4-avg").html(data.item4_avg + "점")
                		let sum = data.item1_avg + data.item2_avg + data.item3_avg + data.item4_avg 
                		$(".avg-sum").html(sum + "점")
                		$(".avg-avg").html((sum / 4) + "점")
                },
                error: function(xhr, status, error) {
                    // AJAX 요청이 실패한 경우의 처리 코드
                    console.error('AJAX 요청 실패:', status, error)
                }
                
                });
			
			$.ajax({
                url: '${pageContext.request.contextPath }/api/lectureFeedback',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(claIdObject),
                success: (data) => {
                	console.log(data)
                	let html = "";
                		$.each(data, (index, item) => {
                			html += "<span>" + item + "</span>"
                		})
                		
                		$(".feedback-box").html(html);
                },
                error: function(xhr, status, error) {
                    // AJAX 요청이 실패한 경우의 처리 코드
                    console.error('AJAX 요청 실패:', status, error)
                }
                
                });
                
		}
		
	</script>
</body>
</html>

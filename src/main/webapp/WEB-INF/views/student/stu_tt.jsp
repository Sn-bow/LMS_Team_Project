<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var='root' value="${pageContext.request.contextPath }/" />
<!-- 절대경로 설정 : -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<title>시간표 조회</title>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif;
}

.sec {
	position: absolute;
	top: 8%;
	left: 15%;
	width: 85%;
	height: 92%;
}

.contents {
	width: 100%;
	height: 100%;
}

.left-div { /* 내부 왼쪽 */
	display: absolute;
	width: 18%;
	height: 100%;
	background-color: #f0f6f9;
	border: 1px;
}

.readonly {
	border-radius: 5px;
	border: 1px solid #168;
	background: white;
}

.row {
	display: table-row;
	border-bottom: 1px solid black;
}

.cell {
	display: table-cell;
	border-right: 1px solid black;
	border-top: 1px solid black;
	padding: 10px;
	width: 19.2%;
	height: 39px;
	border-collapse: collapse;
}

.cellheader {
	display: table-cell;
	border-right: 1px solid black;
	border-top: 1px solid black;
	padding: 10px;
	width: 50px;
}

.right-div {
	overflow: auto;
	width: 82%;
	height: 764px;
	background-color: #f5f5f5;
	border: 1px solid #ddd;
}

.main_timetable {
	width: 100%;
	height: 764px;
	float: right;
}

table {
	align-content: center;
	table-layout: fixed;
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 100%;
	height: 100%;
}

td, th {
	overflow: auto;
	width: 20%;
	height: 46px;
	border: 1px solid #ddd;
}

td .lecture-cell {
	background-color: #f0f6f9;
	display: inline-block;
	width: 95%;
	padding: 17px 4.25px 17.2px;
	color: #2e2e2e;
	border-bottom: 2px solid #168;
}

tr:first-child {
	border-top: 2px solid #444;
	background-color: #f0f6f9;
	color: #2e2e2e;
}

th {
	border: 1px solid #ddd;
}

td {
	border: 1px solid #ddd;
}

input:focus {
	outline: none;
}

#choose {
	border-radius: 5px;
	border: 1px solid #168;
	outline: none;
}
</style>
</head>
<body>
	<%--  <c:import url="/WEB-INF/views/academy/base.jsp"/> --%>
	<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<section class="sec">
	<c:import url="/WEB-INF/views/layout/aside.jsp" />
		<div class="contents" style="display: flex;">
			<hr style="border-bottom: 2px solid #168;" />

			<div class="left-div">
				<form action="" method="get">
					<table
						style="border-top: 2px solid #168; border-bottom: 2px solid #168;">
						<tr>
							<td>&nbsp;이름 :&nbsp;
								<p>${loginUserBean.user_name }</p> <%-- <form:input class="readonly" path="stu_name" readonly="true" size="15"/> --%>
							</td>
						</tr>

						<tr>
							<td>&nbsp;학번 :&nbsp;
								<p>${loginUserBean.user_id }</p> <%-- <form:input class="readonly" path="" readonly="true" size="15" /> --%>
							</td>
						</tr>

						<tr>
							<td>&nbsp;학과 :&nbsp;
								<p>${loginUserBean.major }</p> <%-- <form:input class="readonly" path="d_name" readonly="true" size="15" /> --%>
							</td>
						</tr>
					</table>
					<br />
            &nbsp;연도: &ensp; <select id="yearSelect">
						<option>2023</option>
						<option>2022</option>
						<option>2021</option>
						<option>2020</option>
						<option>2019</option>
						<option>2018</option>
						<option>2017</option>
						<option>2016</option>
						<option>2015</option>
					</select> &ensp;&ensp;학기 : <select id="semesterSelect">
						<option>1</option>
						<option>2</option>
					</select>

					<input type="submit" value="조회" id="submitBtn"
						style="border-radius: 5px; border: 1px solid #168; margin-left: 90px; color: #168; background: white;" />
				</form>
			</div>
			<div class="right-div">
				<div class="main_timetable">
                  <table>
                     <tr style="border-top: 2px solid #444; border-bottom: 2px solid #168; background-color: #f0f6f9; color:#168;">
                        <th style=" border: 1px solid #ccc;"></th>
                        <th style=" border: 1px solid #ccc;">월</th>
                        <th style=" border: 1px solid #ccc;">화</th>
                        <th style=" border: 1px solid #ccc;">수</th>
                        <th style=" border: 1px solid #ccc;">목</th>
                        <th style=" border: 1px solid #ccc;">금</th>
                     </tr>
                  <c:forEach var="time" begin="1" end="10">
                     <tr style="border: 1px solid #ccc;">
                        <td align="center" style="width: 40px; height: 40px; border: 1px solid #ccc; font-weight: bold;">${time}</td>
                        <td align="center" style="width: 75px; padding: 0; margin: 0; border: 1px solid #ccc;"></td>
                        <td align="center" style="width: 75px; padding: 0; margin: 0; border: 1px solid #ccc;"></td>
                        <td align="center" style="width: 75px; padding: 0; margin: 0; border: 1px solid #ccc;"></td>
                        <td align="center" style="width: 75px; padding: 0; margin: 0; border: 1px solid #ccc;"></td>
                  </c:forEach>
               </table>
               </div>
			</div>
		</div>
	</section>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
   $(document).ready(function() {
	   $('form').on('submit', function(event) {
		    event.preventDefault();
           var selectedYear = $('#yearSelect').val();
           var selectedSemester = $('#semesterSelect').val();
           console.log(selectedYear);
           console.log(selectedSemester);
           
           
           var requestData = {
               year: selectedYear,
               semester: selectedSemester
           };
           var timetableData = [1,2,3,4,5,6,7,8,9,10];
           var claWeekData = ['월','화','수','목','금'];

           $.ajax({
               url: '${pageContext.request.contextPath }/api/timetable',
               method: 'POST',
               contentType: 'application/json',
               data: JSON.stringify(requestData),
               success: function(data) {
                   // 서버로부터의 응답을 처리하는 코드
                   console.log('서버 응답:', data);
                   var rowHtml = "";
                   var printed;
                   var cla_id;
				   var cla_name;
				   var rowspan;
				   var skipCell;
				   var cla_openint;
				   var cla_closeint;
				   var cla_week;
                   // 시간표 데이터를 순환하며 작동시키는 코드
                	
                     	 rowHtml = '<tr	style="border-top: 2px solid #444; border-bottom: 2px solid #168; background-color: #f0f6f9; color: #168;">';
                    	 rowHtml += '<th style="border: 1px solid #ccc;"></th>';
                    	 rowHtml += '<th style="border: 1px solid #ccc;">월</th>';
                    	 rowHtml += '<th style="border: 1px solid #ccc;">화</th>';
                    	 rowHtml += '<th style="border: 1px solid #ccc;">수</th>';
                    	 rowHtml += '<th style="border: 1px solid #ccc;">목</th>';
                    	 rowHtml += '<th style="border: 1px solid #ccc;">금</th>';
                    	 rowHtml += '</tr>';
						timetableData.forEach(function(time) {
							rowHtml += '<tr style="border: 1px solid #ccc;">';
							rowHtml += '<td align="center"';
							rowHtml += 'style="width: 40px; height: 40px; border: 1px solid #ccc; font-weight: bold;">' + time + '</td>';
							claWeekData.forEach(function(week) {
								printed = false;
								data.forEach(function(myClass) {
									cla_id = myClass.cla_id;
									cla_name = myClass.cla_name;
									cla_week = myClass.cla_week;
									cla_openint = myClass.cla_openint;
									cla_closeint = myClass.cla_closeint;
									if(cla_week === week && cla_openint == time){
										rowspan = cla_closeint - cla_openint + 1;
										console.log(rowspan);
										rowHtml += '<td align="center"';
										rowHtml += 'style="width: 75px; padding: 0; margin: 0; border: 1px solid #ccc; ';
										rowHtml += 'background: #f0f6f9; border-top: 2px solid #168; border-bottom: 2px solid #168;"';
										rowHtml += 'rowspan="' + rowspan + '<span style="font-size: 13px;">';
										rowHtml += '[&nbsp;&nbsp;] <br />' + cla_name +'&nbsp;()'+ cla_id + ')';
										rowHtml += '</span></td>';
										printed = true;
									}
								});
							
								if(!printed){
									skipCell = false;
									data.forEach(function(myClass) {
									cla_week = myClass.cla_week;
									cla_openint = myClass.cla_openint;
									cla_closeint = myClass.cla_closeint;
										if((cla_week === week) && (cla_openint < time) && (cla_closeint >= time)){
											skipCell = true;
										}
									});
								
									if(!skipCell){
										rowHtml += '<td align="center"';
										rowHtml += 'style="width: 75px; padding: 0; margin: 0; border: 1px solid #ccc;"></td>';
									}
								}
							});
						});
                     	rowHtml += '</tr>';
                     	$('.main_timetable table').html(rowHtml);
               },
               error: function(xhr, status, error) {
                   // AJAX 요청이 실패한 경우의 처리 코드
                   console.error('AJAX 요청 실패:', status, error);
               }
           });
       });
   });
</script>


</body>
</html>
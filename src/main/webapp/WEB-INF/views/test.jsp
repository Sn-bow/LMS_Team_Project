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
<style type="text/css">
table,tr,td{
	border: 1px solid black;
}
</style>
</head>
<body>
	<%--  <c:import url="/WEB-INF/views/academy/base.jsp"/> --%>
	<section class="sec">
		<div class="contents" style="display: flex;">
			<hr style="border-bottom: 2px solid #168;" />
			</div>
			
			<button class="selectbtn">확인</button>
			<div>
				<div >
                  <table class="classTimeTable">
                     <%-- <tr>
                        <th></th>
                        <th>월</th>
                        <th>화</th>
                        <th>수</th>
                        <th>목</th>
                        <th>금</th>
                     </tr>
                  <c:forEach var="time" begin="1" end="10">
                     <tr>
                        <td>${time}</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                  </c:forEach> --%>
               </table>
               </div>
			</div>
			
		</div>
	</section>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
   $(document).ready(function() {
	   $(document).on('click', '.selectbtn', function() {
	   let htmlArray =  [
           ["<tr><th></th>","<th>월</th>","<th>화</th>","<th>수</th>","<th>목</th>","<th>금</th></tr>"],
           ["<tr><td>1</td>","<td></td>","<td></td>","<td></td>","<td></td>","<td></td></tr>"],
           ["<tr><td>2</td>","<td></td>","<td></td>","<td></td>","<td></td>","<td></td></tr>"],
           ["<tr><td>3</td>","<td></td>","<td></td>","<td></td>","<td></td>","<td></td></tr>"],
           ["<tr><td>4</td>","<td></td>","<td></td>","<td></td>","<td></td>","<td></td></tr>"],
           ["<tr><td>5</td>","<td></td>","<td></td>","<td></td>","<td></td>","<td></td></tr>"],
           ["<tr><td>6</td>","<td></td>","<td></td>","<td></td>","<td></td>","<td></td></tr>"],
           ["<tr><td>7</td>","<td></td>","<td></td>","<td></td>","<td></td>","<td></td></tr>"],
           ["<tr><td>8</td>","<td></td>","<td></td>","<td></td>","<td></td>","<td></td></tr>"],
           ["<tr><td>9</td>","<td></td>","<td></td>","<td></td>","<td></td>","<td></td></tr>"],
           ["<tr><td>10</td>","<td></td>","<td></td>","<td></td>","<td></td>","<td></td></tr>"],
       ]
  
     let startTimeData = "";
     let endTimeData = "";
     
     let startTime = 0;
     let endTime = 0;
     
     let dayData = "";
     let day = 0;
     
     let array = [];
     
     if(dayData === "월") {
        day = 1;
     }else if(dayData === "화") {
        day = 2;
     }else if(dayData === "수") {
        day = 3;
     }else if(dayData === "목") {
        day = 4;
     }else if(dayData === "금") {
        day = 5;
     }
     
     
     if(startTimeData === "9:00") {
        startTime = 1;
     }else if (startTimeData === "10:00") {
        startTime = 2;
     }else if (startTimeData === "11:00") {
        startTime = 3;
     }else if (startTimeData === "12:00") {
        startTime = 4;
     }else if (startTimeData === "13:00") {
        startTime = 5;
     }else if (startTimeData === "14:00") {
        startTime = 6;
     }else if (startTimeData === "15:00") {
        startTime = 7;
     }else if (startTimeData === "16:00") {
        startTime = 8;
     }else if (startTimeData === "17:00") {
        startTime = 9;
     }else if (startTimeData === "18:00") {
        startTime = 10;
     }
     
     
     if(endTimeData === "10:00") {
         endTime = 1;
     }else if (endTimeData === "11:00") {
         endTime = 2;
     }else if (endTimeData === "12:00") {
         endTime = 3;
     }else if (endTimeData === "13:00") {
         endTime = 4;
     }else if (endTimeData === "14:00") {
         endTime = 5;
     }else if (endTimeData === "15:00") {
         endTime = 6;
     }else if (endTimeData === "16:00") {
         endTime = 7;
     }else if (endTimeData === "17:00") {
         endTime = 8;
     }else if (endTimeData === "18:00") {
         endTime = 9;
     }else if (endTimeData === "19:00") {
         endTime = 10;
     }
     
     if(startTime !== endTime) {
        for(let i = startTime; i <= endTime; i++) {
           array.push(i);
        }
        
     }else {
        array.push(startTime);
     }
     
     htmlArray[array[0]][day] = "<td rowspan='"+ array.length +"'></td>"
     if(array.length > 1) {
        for(let i = 1; i < array.length; i++) {
           htmlArray[array[i],day] = "";
        }
     }
     
     $(".classTimeTable").html(htmlArray.map(row => row.join('')).join('\n'));

		   /*  event.preventDefault();
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
           }); */
       });
   });
</script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<style>
body {
        margin: 0;
        padding: 0;
      }
      .header {
        width: 100%;
        height: 100px;
        background: linear-gradient(
          155deg,
          rgba(0, 128, 0, 0.2),
          rgba(0, 128, 0, 0.5) 60%
        );
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid rgb(130, 130, 130);
      }
      .header > img {
        width: 180px;
        height: 65px;
        margin-left: 15px;
      }
      .header > div {
        margin-right: 15px;
      }

      .header > div > a {
        font-size: 20px;
        font-weight: 600;
        margin: 10px;
        text-decoration: none;
        color: rgba(0, 0, 0, 0.6);
      }

      .header > div > a:hover {
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
      .aside > div {
        border-bottom: 1px solid rgb(130, 130, 130);
        height: 50px;
        margin-bottom: 10px;
      }

      .aside > div:nth-child(1) {
        margin-top: 25px;
      }

      .aside > div > a {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        text-decoration: none;
        color: rgba(240, 240, 240);
        transition: all 0.3s ease-in-out;
      }

      .aside > div > a:hover {
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

      .student-info-box > div:nth-child(2) {
        margin-left: 15px;
      }

      .student-info-box > div > span {
        padding: 6px;
        border: 2px solid gray;
        border-radius: 5px;
      }
      .class-box {
        width: 100%;
        height: 100%;
      }
      .class-box > table {
        width: 100%;
        border: 1px solid black;
        border-collapse: collapse;
      }

      table {
        width: 100%;
        /* height: 100%; */
        border-collapse: collapse;
      }

      th,
      td {
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

      td > a {
        text-decoration: none;
        color: blue;
        font-weight: 700;
      }
      .studentInfo {
        width: 100%;
        display: flex;
        justify-content: space-between;
        font-size: 17px;
        font-weight: 600;
        border-bottom: 2px solid #a9c3b6;
        padding-bottom: 15px;
        padding-top: 15px;
      }
      .studentInfo > div > span {
        border: 1.5px solid lightgray;
        border-radius: 5px;
        background-color: #cedfdf;
        padding: 3px;
      }
      .filter {
        width: 100%;
        display: flex;
        font-size: 17px;
        font-weight: 600;
        border-bottom: 2px solid #a9c3b6;
        justify-content: right;
        padding-bottom: 15px;
        padding-top: 15px;
      }
      .filter > div {
        margin-right: 25px;
      }
      .search-class {
        width: 100%;
        display: flex;
        justify-content: right;
        font-size: 17px;
        font-weight: 600;
        border-bottom: 2px solid #a9c3b6;
        padding-bottom: 15px;
        padding-top: 15px;
      }
      section {
        padding: 50px;
        width: 100%;
      }
      .scroller-box {
        height: 350px;
        border: 1px solid lightgray;
        overflow: scroll;
      }
      .time-table {
        width: 100%;
        height: 100%;
        border-collapse: collapse;
      }
      .time-table > tr > th,
      td {
        border: 2px solid rgb(220, 220, 220);
        padding: 10px;
      }
      .time-table > tr > th {
        border-top: 3px solid rgba(0, 128, 0, 0.7);
        background-color: rgba(0, 128, 0, 0.3);
      }
      .time-table > tr > td {
        text-align: center;
      }
      .time-table > tr > td > a {
        text-decoration: none;
        color: blue;
        font-weight: 700;
      }
      .hidden{
      	display : none;
      }
</style>
</head>
<body>
<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<main class="gradeCheck-main">
		<c:import url="/WEB-INF/views/layout/aside.jsp" />
		<section>
			 <div class="studentInfo">
		         <div>이름/학번/학과</div>
		         <div>
		         <span>${loginUserBean.user_name }</span>
		         <span>${loginUserBean.user_id }</span>
		         <span>${major }</span>
	         </div>
        </div>
		<div class="filter">
          <div>
            <span>구분</span>
            <select style="width: 100px" class="part">
              <option>전공</option>
              <option>교양</option>
            </select>
          </div>
          <div>
            <span>학년</span>
            <select style="width: 100px" class="level">
              <option>1</option>
              <option>2</option>
            </select>
          </div>
        </div>
		<div class="search-class">
          <label for="classSearch" style="margin-right: 15px"
            >교과목명 :
          </label>
          <input type="text" id="classSearch" style="margin-right: 15px" />
        </div>
		<div class="scroller-box">
          <table>
            <tr class="table-header">
              <th>구분</th>
              <th>학과코드</th>
              <th>교과목명</th>
              <th>학년</th>
              <th>학점</th>
              <th>교수명</th>
              <th>요일</th>
              <th>강의 시작시간</th>
              <th>강의 종료시간</th>
              <th>강의실</th>
              <th>현재 수강인원</th>
              <th>최대 수강인원</th>
              <th>선택</th>
            </tr>
            <tbody class="class_table">
				<c:forEach items="${EnrolmentList }" var="EnrolmentItem">
					<tr>
						<td>${EnrolmentItem.classification}</td>
						<td>${EnrolmentItem.dep_name}</td>
						<td>${EnrolmentItem.cla_name}</td>
						<td>${EnrolmentItem.cla_level}</td>
						<td>${EnrolmentItem.cla_grade}</td>
						<td>${EnrolmentItem.pro_name}</td>
						<td>${EnrolmentItem.cla_week}</td>
						<td>${EnrolmentItem.cla_open}</td>
						<td>${EnrolmentItem.cla_close}</td>
						<td>${EnrolmentItem.claroom_name}</td>
						<td>${EnrolmentItem.enrolment}</td>
						<td>${EnrolmentItem.enrolmentMax}</td>
						<td><button class="selectbtn"
								data-cla-id="${EnrolmentItem.cla_id}">등록</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
          </table>
        </div>
		<div class="scroller-box">
          <table>
            <tr class="table-header">
              <th>구분</th>
              <th>학과코드</th>
              <th>교과목명</th>
              <th>학년</th>
              <th>학점</th>
              <th>교수명</th>
              <th>요일</th>
              <th>강의 시작시간</th>
              <th>강의 종료시간</th>
              <th>강의실</th>
              <th>현재 수강인원</th>
              <th>최대 수강인원</th>
              <th>선택</th>
            </tr>
            <tbody class="enrolment_table">
				<c:forEach items="${removedItems }" var="removedItem">
							<tr>
								<td >${removedItem.classification}</td>
								<td >${removedItem.dep_name}</td>
								<td >${removedItem.cla_name}</td>
								<td >${removedItem.cla_level}</td>
								<td >${removedItem.cla_grade}</td>
								<td >${removedItem.pro_name}</td>
								<td >${removedItem.cla_week}</td>
								<td >${removedItem.cla_open}</td>
								<td >${removedItem.cla_close}</td>
								<td >${removedItem.claroom_name}</td>
								<td >${removedItem.enrolment}</td>
								<td >${removedItem.enrolmentMax}</td>
								<td >
								<c:choose>
									<c:when test="${removedItem.cla_end == loginUserBean.year && removedItem.ck == 0}">
											<button class="removebtn" data-cla-id="${removedItem.cla_id}">제거</button>
									</c:when>
									<c:otherwise>
										<button class="removebtn hidden" data-cla-id="${removedItem.cla_id}">제거</button>
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
						</c:forEach>
				</tbody>
          </table>
        </div>
		</section>
		
      </main>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			/* let enrolmentData = [];
			let startTime = 0;
    		let endTime = 0;
    		let day = 0;
    		
			function updateTimetable() {
				// 시간표 업데이트를 위해 기존에 추가된 교과목 제거
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
				
				// enrolment_table의 데이터를 가져와서 enrolmentData 배열에 저장
				  $('.enrolment_table tbody tr').each(function() {
				    let classification = $(this).find('td:eq(0)').text();
				    let claWeek = $(this).find('td:eq(6)').text();
				    let claOpen = $(this).find('td:eq(7)').text();
				    let claClose = $(this).find('td:eq(8)').text();
				    let claName = $(this).find('td:eq(2)').text();
				    enrolmentData.push({
				        classification: classification,
				        claWeek: claWeek,
				        claOpen: claOpen,
				        claClose: claClose,
				        claName: claName
				      });
				    enrolmentData.forEach(function(data) {
				    	if(data.claWeek === "월") {
			    			day = 1;
			    		}else if(data.claWeek === "화") {
			    			day = 2;
			    		}else if(data.claWeek === "수") {
			    			day = 3;
			    		}else if(data.claWeek === "목") {
			    			day = 4;
			    		}else if(data.claWeek === "금") {
			    			day = 5;
			    		}
			    		
			    		
			    		if(claOpen === "09:00") {
			    			startTime = 1;
			    		}else if (claOpen === "10:00") {
			    			startTime = 2;
			    		}else if (claOpen === "11:00") {
			    			startTime = 3;
			    		}else if (claOpen === "12:00") {
			    			startTime = 4;
			    		}else if (claOpen === "13:00") {
			    			startTime = 5;
			    		}else if (claOpen === "14:00") {
			    			startTime = 6;
			    		}else if (claOpen === "15:00") {
			    			startTime = 7;
			    		}else if (claOpen === "16:00") {
			    			startTime = 8;
			    		}else if (claOpen === "17:00") {
			    			startTime = 9;
			    		}else if (claOpen === "18:00") {
			    			startTime = 10;
			    		}
			    		
			    		
			    		if(claClose === "10:00") {
			    		    endTime = 1;
			    		}else if (claClose === "11:00") {
			    		    endTime = 2;
			    		}else if (claClose === "12:00") {
			    		    endTime = 3;
			    		}else if (claClose === "13:00") {
			    		    endTime = 4;
			    		}else if (claClose === "14:00") {
			    		    endTime = 5;
			    		}else if (claClose === "15:00") {
			    		    endTime = 6;
			    		}else if (claClose === "16:00") {
			    		    endTime = 7;
			    		}else if (claClose === "17:00") {
			    		    endTime = 8;
			    		}else if (claClose === "18:00") {
			    		    endTime = 9;
			    		}else if (claClose === "19:00") {
			    		    endTime = 10;
			    		}
			    		
			    		if(startTime !== endTime) {
			    			for(let i = startTime; i <= endTime; i++) {
			    				data.push(i);
			    			}
			    			
			    		}else if (startTime === endTime ) {
			    			data.push(startTime);
			    		}
				    htmlArray[array[0]][day] = "<td rowspan='"+ htmlArray.length +"'>"+data.claName+"</td>"
				    if(htmlArray.length > 1) {
		    			for(let i = 1; i < htmlArray.length; i++) {
		    				htmlArray[htmlArray[i]][day] = "";
		    			}
		    		
		    		}
				    });
				  $(".time-table").html(htmlArray.join());
				});
			} */
			
			$('#classSearch').on('keyup', function() {
				var claIds = $('.enrolment_table .removebtn').map(function() {
		            return $(this).data('cla-id');
		        }).get();     
				console.log("on");
		        var claNameFilter = $(this).val();
		        var selectedPart = $('.filter .part option:selected').val();
		        var selectedLevel = $('.filter .level option:selected').val();
		        console.log(selectedPart);
		        console.log(selectedLevel);
		        var rowHtml = "";
		        $.ajax({
		            url : '${pageContext.request.contextPath}/api/Search',
		            method : 'POST',
		            data : {
		            	"claNameFilter" : claNameFilter,
		                "variable" : selectedPart,
		                "Level" : selectedLevel,
		                "claIds" : JSON.stringify(claIds)
		            },
		            success : function(data) {
		            	data.forEach(function(EnrolmentItem) {
		            		rowHtml += '<tr>';
		                    rowHtml += '<td >' + EnrolmentItem.classification + '</td>';
		                    rowHtml += '<td >' + EnrolmentItem.dep_name + '</td>';
		                    rowHtml += '<td >' + EnrolmentItem.cla_name + '</td>';
		                    rowHtml += '<td >' + EnrolmentItem.cla_level + '</td>';
		                    rowHtml += '<td >' + EnrolmentItem.cla_grade + '</td>';
		                    rowHtml += '<td >' + EnrolmentItem.pro_name + '</td>';
		                    rowHtml += '<td >' + EnrolmentItem.cla_week +'</td>';
		                    rowHtml += '<td >' + EnrolmentItem.cla_open + '</td>';
		                    rowHtml += '<td >' + EnrolmentItem.cla_close + '</td>';
		                    rowHtml += '<td >' + EnrolmentItem.claroom_name + '</td>';
		                    rowHtml += '<td >' + EnrolmentItem.enrolment + '</td>';
		                    rowHtml += '<td >' + EnrolmentItem.enrolmentMax + '</td>';
		                    rowHtml += '<td ><button class="selectbtn" data-cla-id="' + EnrolmentItem.cla_id + '">등록</button></td>';
		                    rowHtml += '</tr>';
		            	})
		                    $('.class_table').html(rowHtml);
		            },
		            error : function(xhr, status, error) {
		                console.error('AJAX 요청 실패:', status, error);
		            }
		        });
		    });

			$(document).on('click', '.selectbtn', function() {
				event.preventDefault();
				var claId = $(this).data('cla-id');
				var row = $(this).closest('tr');
				
				 // 선택한 행의 값을 가져오기
				var row = $(this).closest('tr');
				var classification = row.find('td:eq(0)').text();
				var dep_name = row.find('td:eq(1)').text();
				var cla_name = row.find('td:eq(2)').text();
				var cla_level = row.find('td:eq(3)').text();
				var cla_grade = row.find('td:eq(4)').text();
				var pro_name = row.find('td:eq(5)').text();
				var cla_week = row.find('td:eq(6)').text();
				var cla_open = row.find('td:eq(7)').text();
				var cla_close = row.find('td:eq(8)').text();
				var claroom_name = row.find('td:eq(9)').text();
				var enrolment = row.find('td:eq(10)').text();
				var enrolmentmax = row.find('td:eq(11)').text();
				
				// 이미 선택된 과목들의 요일과 시간을 체크합니다.
			    var isOverlap = false;
			    $('.enrolment_table tr').each(function() {
			        var selectedWeek = $(this).find('td:eq(6)').text();
			        if (cla_week === selectedWeek) {
			            var selectedOpen = $(this).find('td:eq(7)').text();
			            var selectedClose = $(this).find('td:eq(8)').text();
			            console.log(selectedOpen);
			            console.log(cla_open);
			            var deleteButton = $(this).find('.removebtn');
			            if (deleteButton.length > 0) {
				            if (cla_open < selectedClose && cla_close > selectedOpen) {
				                isOverlap = true;
				                return false; // loop를 빠져나갑니다.
				            }
			            }
			        }
			    });

			    // 시간이 겹치는 경우, 경고문을 띄우고 함수를 종료합니다.
			    if (isOverlap) {
			        alert('시간이 겹칩니다!');
			        return;
			    }

				$.ajax({
					url : '${pageContext.request.contextPath }/api/Valid',
					method : 'POST',
					data : {
						"claId" : claId
					},
					success : function(data) {
						if (data == 1) {
							var newRowHtml = '<tr>'
								newRowHtml += '<td >'+classification+'</td>'
								newRowHtml += '<td >'+dep_name+'</td>'
								newRowHtml += '<td >'+cla_name+'</td>'
								newRowHtml += '<td >'+cla_level+'</td>'
								newRowHtml += '<td >'+cla_grade+'</td>'
								newRowHtml += '<td >'+pro_name+'</td>'
								newRowHtml += '<td >'+cla_week+'</td>'
								newRowHtml += '<td >'+cla_open+'</td>'
								newRowHtml += '<td >'+cla_close+'</td>'
								newRowHtml += '<td >'+claroom_name+'</td>'
								newRowHtml += '<td >'+(Number(enrolment)+1)+'</td>'
								newRowHtml += '<td >'+enrolmentmax+'</td>'
								newRowHtml += '<td ><button class="removebtn" data-cla-id="'+claId+'">제거</button></td>'
							    newRowHtml += '</tr>'
								$('.enrolment_table').append(newRowHtml);
								row.remove();
						} else {
							alert('업데이트에 실패했습니다.');
						}
					},
					error : function(xhr, status, error) {
						// AJAX 요청이 실패한 경우의 처리 코드
						console.error('AJAX 요청 실패:', status, error);
					}
				});
				    
			});
			
			// 외부 테이블에서 제거 버튼 클릭 시 해당 행 제거
			$('.enrolment_table').on('click', '.removebtn', function(event) {
				event.preventDefault();
				var claId = $(this).data('cla-id');
				var row = $(this).closest('tr');
				 // 선택한 행의 값을 가져오기
				var row = $(this).closest('tr');
				var classification = row.find('td:eq(0)').text();
				var dep_name = row.find('td:eq(1)').text();
				var cla_name = row.find('td:eq(2)').text();
				var cla_level = row.find('td:eq(3)').text();
				var cla_grade = row.find('td:eq(4)').text();
				var pro_name = row.find('td:eq(5)').text();
				var cla_week = row.find('td:eq(6)').text();
				var cla_open = row.find('td:eq(7)').text();
				var cla_close = row.find('td:eq(8)').text();
				var claroom_name = row.find('td:eq(9)').text();
				var enrolment = row.find('td:eq(10)').text();
				var enrolmentmax = row.find('td:eq(11)').text();
				
				
				$.ajax({
					url : '${pageContext.request.contextPath }/api/DeleteList',
					method : 'POST',
					data : {
						"claId" : claId
					},
					success : function(data) {
						if (data >= 1) {
							// 값을 추가할 외부 테이블에 새로운 행 생성
							var newRowHtml = '<tr>'
								newRowHtml += '<td >'+classification+'</td>'
								newRowHtml += '<td >'+dep_name+'</td>'
								newRowHtml += '<td >'+cla_name+'</td>'
								newRowHtml += '<td >'+cla_level+'</td>'
								newRowHtml += '<td >'+cla_grade+'</td>'
								newRowHtml += '<td >'+pro_name+'</td>'
								newRowHtml += '<td >'+cla_week+'</td>'
								newRowHtml += '<td >'+cla_open+'</td>'
								newRowHtml += '<td >'+cla_close+'</td>'
								newRowHtml += '<td >'+claroom_name+'</td>'
								newRowHtml += '<td >'+(Number(enrolment)- 1)+'</td>'
								newRowHtml += '<td >'+enrolmentmax+'</td>'
								newRowHtml += '<td ><button button class="selectbtn" data-cla-id="'+claId+'">등록</button></td>'
							    newRowHtml += '</tr>' 
							    
							$('.class_table').append(newRowHtml);
							row.remove();
						} else {
							alert('삭제에 실패했습니다.');
						}
					},
					error : function(xhr, status, error) {
						// AJAX 요청이 실패한 경우의 처리 코드
						console.error('AJAX 요청 실패:', status, error);
					}
				});
			});
		});
				
	</script>
</body>
</html>
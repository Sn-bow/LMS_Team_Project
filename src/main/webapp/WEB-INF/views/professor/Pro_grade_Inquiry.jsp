<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <title>grade check</title>
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

      .gradeCheck-professor-section {
        width: 100%;
        padding: 15px;
        padding-left: 25px;
        margin-top: 25px;
      }

      .class {
        width: 100%;
      }

      .class > h3 {
        font-size: 20px;
      }

      table {
        width: 100%;
        border-collapse: collapse;
        border-top: 3px solid rgba(0, 128, 0, 0.7);
      }

      th,
      td {
        border: 2px solid rgb(220, 220, 220);
        padding: 10px;
      }

      th {
        background-color: rgba(0, 128, 0, 0.3);
      }

      td {
        text-align: center;
      }

      .grade-inquiry-box {
        width: 100%;
        height: 350px;
        overflow: scroll;
      }
      .myscore {
      	font-size: 18px;
      	font-weight: 600;
      }
      .deScore {
      	font-size: 16px;
      	color: gray;
      }
    </style>
  </head>
  <body>
   <c:import url="/WEB-INF/views/layout/top.jsp" />
    <main class="gradeCheck-main">
      <c:import url="/WEB-INF/views/layout/aside.jsp"/>
      <section class="gradeCheck-professor-section">
        <div class="class-choice class">
          <h3>강의선택</h3>
          <table>
            <tr>
              <th>학수번호</th>
              <th>과목명</th>
              <th>이수구분</th>
              <th>학년</th>
              <th>학점</th>
              <th>강의실</th>
              <th>수강인원</th>
              <th>요일</th>
              <th>시간</th>
              <th>비고</th>
            </tr>
            <c:forEach items="${classInquiryList}" var="classInquiry">
            <tr>
              <td>${classInquiry.cla_id}</td>
              <td>${classInquiry.cla_name}</td>
              <td>${classInquiry.major_state}</td>
              <td>${classInquiry.cla_level}</td>
              <td>${classInquiry.cla_grade}</td>
              <td>${classInquiry.claroom_name}</td>
              <td>${classInquiry.cla_maxpeo}</td>
              <td>${classInquiry.cla_week}</td>
              <td>${classInquiry.cla_open} ~ ${classInquiry.cla_close}</td>
              <td>
                <button value="${classInquiry.cla_id}" onclick="claIdBtn(this)" >선택</button>
              </td>
            </tr>
            </c:forEach>
          </table>
        </div>
        <div class="class-info class">
          <h3>과목 정보</h3>
          <table class="table2">
            <tr>
              <th>과목명</th>
              <td>-</td>
              <th>학수번호</th>
              <td>-</td>
              <th>강의실</th>
              <td>-</td>
              <th>요일</th>
              <td>-</td>
              <th>시간</th>
              <td>- ~ -</td>
            </tr>
          </table>
        </div>
        <div class="grade-inquiry class">
          <h3>성적 조회</h3>
          <div class="grade-inquiry-box">
            <table class="myTable">
              <tr>
                <th>학번</th>
                <th>이름</th>
                <th>학과</th>
                <th>학년</th>
                <th>출석</th>
                <th>중간점수</th>
                <th>기말점수</th>
                <th>과제점수</th>
                <th>총점</th>
                <th>점수</th>
                <th>등급</th>
              </tr>
              
            </table>
          </div>
        </div>
      </section>
    </main>
    <script>
 	   const claIdBtn = (event) => {
    		let claId = event.value
    		const classId = {
    				claId : claId
    		}
    		console.log(classId);
    		$.ajax({
    			url: '${pageContext.request.contextPath }/api/classInfo',
    			method: 'POST',
    			contentType: 'application/json',
    			data: JSON.stringify(classId),
    			success: (data) => {
    				console.log('서버 응답:', data);
                    console.log("작동함?");
    				let htm = '';
    				htm += "<tr>"
    					htm += "  <th>" + "과목명" + "</th>"
    					htm += "  <td>" + data.cla_name + "</td>"
    					htm += "  <th>" + "학수번호" + "</th>"
    					htm += "  <td>" + data.cla_id + "</td>"
    					htm += "  <th>" + "강의실" + "</th>"
    					htm += "  <td>" + data.claroom_name + "</td>"
    					htm += "  <th>" + "요일" + "</th>"
    					htm += "  <td>" + data.cla_week + "</td>"
    					htm += "  <th>" + "시간" + "</th>"
    					htm += "  <td>" + data.cla_open + "~" + data.cla_close + "</td>"
    					htm += "</tr>"
    					
    					$('.table2').html(htm);	
    			},
                error: function(xhr, status, error) {
                    // AJAX 요청이 실패한 경우의 처리 코드
                   	console.log("class info 작동안함? ")
                    console.error('AJAX 요청 실패:', status, error);
                }
    		})
    		
    		 $.ajax({
                 url: '${pageContext.request.contextPath }/api/gradeInquiry',
                 method: 'POST',
                 contentType: 'application/json',
                 data: JSON.stringify(classId),
                 success: function(data) { // 여기서 data는 전체 응답입니다.
                     // 서버로부터의 응답을 처리하는 코드
                     /* console.log('서버 응답:', data);
                     console.log(claId);
                     console.log("작동함?"); */
                      // 원하는 형태의 HTML 조작 및 생성
                     var html = '';
                     html += "<tr>"
                    	 html += "  <th>학번</th>"
                    	 html += "  <th>이름</th>"
                    	 html += "  <th>학과</th>"
                    	 html += "  <th>학년</th>"
                    	 html += "  <th>출석</th>"
                    	 html += "  <th>중간점수</th>"
                    	 html += "  <th>기말점수</th>"
                    	 html += "  <th>과제점수</th>"
                    	 html += "  <th>총점</th>"
                    	 html += "  <th>점수</th>"
                    	 html += "  <th>등급</th>"
                    	 html += "</tr>"
                     $.each(data, function(index, item) { // 각 아이템에 대해 처리합니다.
                    	 
                    	 html += "<tr>"
                    		 html += "  <td>" + item.stu_id + "</td>"
                    		 html += "  <td>" + item.stu_name + "</td>"
                    		 html += "  <td>" + item.dep_name + "</td>"
                    		 html += "  <td>" + item.stu_level + "</td>"
                    		 html += "  <td><span class='myscore'>" + item.at_score + "</span> / <span class='deScore'>20</span></td>"
                    		 html += "  <td><span class='myscore'>" + item.m_score + "</span> / <span class='deScore'>30</span></td>"
                    		 html += "  <td><span class='myscore'>" + item.f_score + "</span> / <span class='deScore'>30</span></td>"
                    		 html += "  <td><span class='myscore'>" + item.a_score + "</span> / <span class='deScore'>20</span></td>"
                    		 let totalScore = Number(item.at_score) + Number(item.m_score) + Number(item.f_score) + Number(item.a_score) 
                    		 html += "  <td><span class='myscore'>" + totalScore + "</span> / <span class='deScore'>100</span></td>"
                    		 let nGrade = 0.0;
                    		 let eGrade = "";
                    		 if (totalScore >= 95) {
                  				  nGrade = 4.5;
                  				  eGrade = "A+";
                  				} else if (totalScore >= 90) {
                  				   nGrade = 4.0;
                  				   eGrade = "A";
                  				 } else if (totalScore >= 85) {
                  				   nGrade = 3.5;
                  				   eGrade = "B+";
                  				 } else if (totalScore >= 80) {
                  				   nGrade = 3.0;
                  				   eGrade = "B";
                  				 } else if (totalScore >= 75) {
                  				   nGrade = 2.5;
                  				   eGrade = "C+";
                  				 } else if (totalScore >= 70) {
                  				   nGrade = 2.0;
                  				   eGrade = "C";
                  				 } else if (totalScore >= 65) {
                  				   nGrade = 1.5;
                  				   eGrade = "D+";
                  				 } else if (totalScore >= 60) {
                  				   nGrade = 1.0;
                  				   eGrade = "D";
                  				 } else {
                  				   nGrade = 0.0;
                  				   eGrade = "F";
                  				 }
                           	 nGrade = nGrade.toFixed(1);
                    		 html += "  <td>" + nGrade + "</td>"
                    		 html += "  <td>" + eGrade + "</td>"
                    		 html += "</tr>"
                     }); 
                    	 
                     // 생성된 HTML 삽입
                     $('.myTable').html(html);  // myTable은 테이블의 클래스입니다.
                 },
                 error: function(xhr, status, error) {
                     // AJAX 요청이 실패한 경우의 처리 코드
                    	console.log("after 작동안함? ")
                     console.error('AJAX 요청 실패:', status, error);
                 }
             });
	    	
    	
    	}
    </script>
  </body>
</html>

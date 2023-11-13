<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>학생 리스트</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	background-color: rgba(245, 245, 245, 0.1);
}

header {
	min-width: 800px;
	max-width: 1950px;
	height: 80px;
	background-color: #cedfdf;
	padding: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1.5px solid rgb(220, 220, 220);
	border-radius: 3px;
}

header>img {
	width: 200px;
}

header>div>a {
	margin: 10px;
	text-decoration: none;
	color: black;
	font-size: 18px;
	font-weight: 600;
}

nav {
	min-width: 800px;
	max-width: 1950px;
	height: 50px;
	background-color: #a9c3b6;
	padding: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-bottom: 1.5px solid rgb(220, 220, 220);
	border-radius: 3px;
}

main {
	padding: 50px;
	min-width: 800px;
	max-width: 1950px;
	height: 100%;
}

nav>a {
	text-decoration: none;
	color: black;
	margin: 15px;
	font-size: 18px;
	font-weight: 600;
}

table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 15px;
}

th {
	border-top: 2px solid #a9c3b6;
	border-bottom: 2px solid #a9c3b6;
	padding: 5px;
}

td {
	text-align: center;
	padding: 5px;
	border: 1px solid rgb(220, 220, 220);
}

td>a {
	text-decoration: none;
	color: black;
	font-weight: 500;
}

.search {
	width: 100%;
	display: flex;
	justify-content: right;
	align-items: center;
}

.search>select {
	width: 80px;
	height: 28px;
	font-size: 16px;
	font-weight: 700;
	margin-right: 15px;
}

.search>input[type="text"] {
	width: 250px;
	padding: 3px;
	font-size: 16px;
	margin-right: 15px;
}

.search>input[type="submit"] {
	width: 50px;
	padding: 1.5px;
	font-size: 16px;
	font-weight: 700;
}

.search>input[type="submit"]:hover {
	cursor: pointer;
}

button:hover {
	cursor: pointer;
}

.pageNation {
	width: 100%;
	margin-top: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.pageNation>button {
	margin: 0 20px 0 20px;
}

.pageNation>div>span {
	margin: 0 20px 0 20px;
}

.pageNation>div>span>a {
	text-decoration: none;
	font-weight: 600;
	font-size: 16px;
	color: black;
}
footer {
	min-width: 800px;
	max-width: 1950px;
	height: 150px;
	background-color: lightgray;
	padding: 15px;
	border-radius: 5px;
}

.footer-box1 {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-left: 200px;
	margin-right: 200px;
	font-size: 13px;
	color: rgb(100, 100, 100);
}

.fot-info {
	display: flex;
	flex-direction: column;
	margin-top: 15px;
	margin-bottom: 15px;
}

.footer-box2 {
	display: flex;
	justify-content: space-between;
	margin-left: 200px;
}

.text-deco {
	padding-right: 10px;
	border-right: 1px solid gray;
	color: gray;
}
.hidden {
	display : none;
}

/* 버튼 css */
input[type="submit"] {
	font-size: 12px;
	font-weight: 600;
	color: gray;
	background: #a9c3b6;
	border: 1px solid lightgray;
	border-radius: 5px;
	padding: 5px;
	transition: all 0.5s ease-in-out;
}

button {
	font-size: 12px;
	font-weight: 600;
	color: gray;
	background: #cedfdf;
	border: 1px solid lightgray;
	border-radius: 5px;
	padding: 5px;
	transition: all 0.2s ease-in-out;
}
button:hover{
	cursor: pointer;
	transition: all 0.2s ease-in-out;
	background: #a9c3b6;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/admin_menu.jsp" />
	<main style="height: 700px;">
		<h2>학생 정보</h2>
		<div class="search">
			<select id="filterOption">
				<option selected>학번</option>
				<option>이름</option>
				<option>생년월일</option>
				<option>전화번호</option>
			</select> 
			<input type="text" id="searchText" placeholder="검색할 내용을 입력해주세요" /> 
			<input type="submit" id="searchButton" value="검색" />
		</div>
		<div style="height: 400px;">
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>생년월일</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>학과</th>
				<!-- 단과대 -->
				<th>비고</th>
			</tr>
			<tbody id="list">
			</tbody>
		</table>
		</div>
		<div class="pageNation">
		</div>
	</main>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
	<script>
	$(document).ready(function() {
		  var currentPage = ${currentPage};
		  var maxPage = ${endpage};
		  var root = '<%=request.getContextPath()%>';
		  var receivedData = [];
		  var itemsPerPage = 10;
		  updatePagination();
		  
		  function updateTable(data) {
		    var html = "";
		    data.forEach(function(student) {
		      html += '<tr>';
		      html += '<td>' + student.stu_id + '</td>';
		      html += '<td>' + student.stu_name + '</td>';
		      html += '<td>' + student.stu_rnn + '</td>';
		      html += '<td>' + student.stu_address + '</td>';
		      html += '<td>' + student.stu_phoneNum + '</td>';
		      html += '<td>' + student.stu_email + '</td>';
		      html += '<td>' + student.dep_name + '</td>';
		      html += '<td></td>';
		      html += '</tr>';
		    });
		    $('#list').html(html);
		  }

		  function paginateData(data, page, itemsPerPage) {
		    var startIndex = (page - 1) * itemsPerPage;
		    var endIndex = startIndex + itemsPerPage;
		    return data.slice(startIndex, endIndex);
		  }

		  function updatePagination() {
			  var newhtml = '';
			  if (maxPage > 1) {
			    newhtml += '<button class="page-link hidden" data-page="' + (currentPage - 1) + '">이전</button>';
			    newhtml += '<div>';
			    for (var i = 1; i <= maxPage; i++) {
			      newhtml += '<span><a class="page-link" href="" data-page="' + i + '">' + i + '</a></span>';
			    }
			    newhtml += '</div>';
			    newhtml += '<button class="page-link" data-page="' + (currentPage + 1) + '">다음</button>';
			  } else {
				    newhtml += '<button class="page-link hidden" data-page="' + (currentPage - 1) + '">이전</button>';
				    newhtml += '<div>';
				    newhtml += '</div>';
				    newhtml += '<button class="page-link hidden" data-page="' + (currentPage + 1) + '">다음</button>';
			  }
			  $('.pageNation').html(newhtml);
			}

		  function loadData(filter, searchText) {
		    $.ajax({
		      url: "${root}api/StuinfoFiltering",
		      type: "POST",
		      data: {
		        filter: filter,
		        searchText: searchText
		      },
		      success: function(data) {
		        maxPage = Math.ceil(data.length / itemsPerPage);
		        receivedData = data;
		        currentPage = 1;
		        var paginatedData = paginateData(receivedData, currentPage, itemsPerPage);
		        updateTable(paginatedData);
		        updatePagination();
		      },
		      error: function(jqXHR, textStatus, errorThrown) {
		        console.error('Error: ' + textStatus, errorThrown);
		      }
		    });
		  }

		  $("#searchButton").on('click', function(e) {
			  e.preventDefault();
			  executeSearch();
			});

			$("#searchText").on('keydown', function(e) {
			  if (e.keyCode === 13 || e.key === "Enter") {
			    e.preventDefault();
			    executeSearch();
			  }
			});

			function executeSearch() {
			  var filter = $("#filterOption").val();
			  var searchText = $("#searchText").val();
			  loadData(filter, searchText);
			}


		  $('.pageNation').on('click', '.page-link', function(e) {
		    e.preventDefault();
		    var page = $(this).data('page');
		    if (page) {
		      currentPage = page;
		      var paginatedData = paginateData(receivedData, currentPage, itemsPerPage);
		      updateTable(paginatedData);
		      updatePagination();
		      
		   // 이전 버튼(hidden) 제거/추가
		      if (currentPage === 1) {
		        $('.page-link[data-page="' + (currentPage - 1) + '"]').addClass('hidden');
		      } else {
		        $('.page-link[data-page="' + (currentPage - 1) + '"]').removeClass('hidden');
		      }

		      // 다음 버튼(hidden) 제거/추가
		      if (currentPage === maxPage) {
		        $('.page-link[data-page="' + (currentPage + 1) + '"]').addClass('hidden');
		      } else {
		        $('.page-link[data-page="' + (currentPage + 1) + '"]').removeClass('hidden');
		      }
		    }
		    
		  });

		  // 초기 데이터 로드
		  loadData("학번", "");
		});

    </script>
</body>
</html>

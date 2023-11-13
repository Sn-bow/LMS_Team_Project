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
<title>Document</title>
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
      header > img {
        width: 200px;
      }
      header > div > a {
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

      nav > a {
        text-decoration: none;
        color: black;
        margin: 15px;
        font-size: 18px;
        font-weight: 600;
      }
      .notice-box {
        width: 100%;
        height: 400px;
        border: 2px solid #a9c3b6;
        border-radius: 15px;
        margin-top: 50px;
        margin-bottom: 50px;
        padding: 15px;
      }
      .info-box {
        width: 400px;
        height: 400px;
        border: 2px solid #a9c3b6;
        border-radius: 15px;
        margin-top: 50px;
        margin-bottom: 50px;
        display: flex;
        align-items: center;
      }
      .info-box > a {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-decoration: none;
        color: black;
        font-size: 25px;
        font-weight: 600;
        padding: 15px;
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

      td > a {
        text-decoration: none;
        color: black;
        font-weight: 500;
      }
      .add-box {
        width: 100%;
        margin-top: 15px;
        display: flex;
        justify-content: right;
        align-items: center;
      }
      .add {
        text-decoration: none;
        margin-right: 5px;
        color: gray;
        font-size: 14px;
      }
      img {
        object-fit: cover;
        width: 100%;
        height: 100%;
      }
      .info-contain {
        display: flex;
        justify-content: space-around;
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
	<header>
	<a href="${root }main"><img  style="width: 200px;" src="image/jonggak_un_full_logo_green.png" /></a>
	<div>
		<c:choose>
			<c:when test="${loginUserBean.userLogin == true }">
				<!-- 로그인시 -->
				<a href="${root }user/logout">로그아웃</a>
			</c:when>
			<c:otherwise>
				<!-- 로그아웃시  -->
				<a href="${root }user/login">로그인</a>
			</c:otherwise>
		</c:choose>
	</div>
	</header>
	<nav>
	<a href="${root }admin/studentInfo">학생 리스트</a> 
	<a href="${root }admin/professorInfo">교수 리스트</a> 
	<a href="${root }board/main">공지사항 리스트</a> 
</nav>
	<main>
		<h2>공지</h2>
		<hr />
		<section class="notice-box">
		<div style="height: 340px">
			<table>
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
				<tbody id="list">
				<!-- forEach -->
					<c:forEach items="${boardList }" var="board">
						<tr>
							<td><a href="${root }board/read?noti_id=${board.noti_id }">
									${board.noti_id }</a></td>
							<td><a href="${root }board/read?noti_id=${board.noti_id }">
									${board.title } </a></td>
							<td><a href="${root }board/read?noti_id=${board.noti_id }">
									${board.a_id } </a></td>
							<td><a href="${root }board/read?noti_id=${board.noti_id }">
									${board.registration }</a></td>
						</tr>
					</c:forEach>
				<!-- forEach -->
				</tbody>
			</table>
		</div>

			<div class="pageNation">
			<c:choose>
				<c:when test="${endpage > 0 }">
						<button class="page-link hidden" data-page="${currentPage - 1}">이전</button>
					<div>
						<c:forEach var="i" begin="1" end="${endpage }">
							<span><a class="page-link" href="" data-page="${i}">${i}</a></span>
						</c:forEach>
					</div>
						<button class="page-link" data-page="${currentPage + 1}">다음</button>
				</c:when>
			</c:choose>
		</div>
			<!--  -->
		</section>
		<h2>권한 구분</h2>
		<hr />
		<section class="info-contain">
			<div class="info-box">
				<a href="${root }admin/studentInfo"><img
					src="https://cdn.pixabay.com/photo/2017/06/22/02/16/computer-icon-2429310_1280.png" /><span>학생</span></a>
			</div>
			<div class="info-box">
				<a href="${root }admin/professorInfo"><img
					src="https://cdn.pixabay.com/photo/2017/06/22/02/16/computer-icon-2429310_1280.png" /><span>교수</span></a>
			</div>
		</section>
	</main>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
	<script>

	$(document).ready(function() {
		var currentPage = ${currentPage};
		var maxPage = ${endpage};
		var root = '<%=request.getContextPath()%>';
		    updatePagination();
		
		    function updatePagination() {
			    $('.page-link').each(function() {
			        var page = $(this).text();
			        if (page === '이전') {
			            $(this).data('page', currentPage - 1);
			            if (currentPage === 1) {
			                $(this).addClass('hidden');
			            } else {
			                $(this).removeClass('hidden');
			            }
			        } else if (page === '다음') {
			            $(this).data('page', currentPage + 1);
			            if (currentPage === maxPage) {
			                $(this).addClass('hidden');
			            } else {
			                $(this).removeClass('hidden');
			            }
			        } else {
			            var pageNumber = parseInt(page);
			            $(this).data('page', pageNumber);
			        }
			    });
			}
		
		    $('.page-link').click(function(e) {
		        e.preventDefault();
		        currentPage = $(this).data('page');
		        var html = "";
		        console.log(currentPage);
		        $.ajax({
		            url: '${root}api/PageSel',
		            type: 'GET',
		            data: {
		                page: currentPage
		            },
		            success: function(data) {
		                data.forEach(function(board) {
		                	 html += '<tr>';
			                    html += '<td><a href="' + root + '/board/read?noti_id=' + board.noti_id + '">' + board.noti_id + '</a></td>';
			                    html += '<td><a href="' + root + '/board/read?noti_id=' + board.noti_id + '">' + board.title + '</a></td>';
			                    html += '<td><a href="' + root + '/board/read?noti_id=' + board.noti_id + '">' + board.a_id + '</a></td>';
			                    html += '<td><a href="' + root + '/board/read?noti_id=' + board.noti_id + '">' + board.registration + '</a></td>';
			                    html += '</tr>';
		                });
		                $('#list').html(html);
		                updatePagination();
		            },
		            error: function(jqXHR, textStatus, errorThrown) {
		                console.error('Error: ' + textStatus, errorThrown);
		            }
		        });
		    });
		});

    </script>
</body>
</html>

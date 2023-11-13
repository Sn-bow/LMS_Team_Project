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
<!-- <script type="text/javascript" src="script/carousel.js"></script> -->
<!-- <script type="text/javascript" src="script/smoothscroll.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>종각대학교</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
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

nav>a {
	text-decoration: none;
	color: black;
	margin: 15px;
	font-size: 18px;
	font-weight: 600;
}

main {
	min-width: 800px;
	max-width: 1950px;
	height: 100%;
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

.decoration {
	min-width: 800px;
	max-width: 1950px;
	height: 50px;
	background-color: rgba(20, 20, 20, 0.9);
	padding: 10px;
	border-bottom: 1.5px solid rgb(220, 220, 220);
	border-radius: 3px;
}

.carousel-wrapper {
	min-width: 800px;
	max-width: 1950px;
	height: 350px;
	overflow: hidden;
	border-bottom: 1.5px solid rgb(220, 220, 220);
	border-radius: 2px;
}

.carousel-img {
	margin: 0 auto;
	width: 100%;
	height: 350px;
	/* object-fit: fill; */
}

.carousel-button {
	width: 100%;
	display: flex;
	justify-content: space-between;
}

.button1-box {
	position: relative;
}

.button1-box>button {
	position: absolute;
	bottom: 180px;
	transform: translate(0, 50%);
	font-size: 60px;
	background: none;
	border: none;
	color: rgba(240, 240, 240, 0.3);
	transition: all 0.3s ease-in-out;
}

.button1-box>button:hover {
	color: rgba(240, 240, 240, 0.9);
	transition: all 0.3s ease-in-out;
}

.button2-box {
	position: relative;
}

.button2-box>button {
	position: absolute;
	right: 0px;
	bottom: 180px;
	transform: translate(0, 50%);
	font-size: 60px;
	background: none;
	border: none;
	color: rgba(240, 240, 240, 0.3);
	transition: all 0.3s ease-in-out;
}

.button2-box>button:hover {
	color: rgba(240, 240, 240, 0.9);
	transition: all 0.3s ease-in-out;
}

button:hover {
	cursor: pointer;
}
/* contain */
/* notice */
.contain {
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.contain>div {
	width: 850px;
	height: 400px;
	border: 2px solid #a9c3b6;
	border-radius: 15px;
	margin: 20px;
	margin-top: 50px;
	margin-bottom: 50px;
	padding: 15px;
}

.notice-box {
	
}

.bookApi-box {
	
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
	display: none;
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
		<div style="display:flex">
		<a class="navbar-brand" href="${root }main"> <img
			src="image/jonggak_un_full_logo_green.png"
			style="width: 170px; height: 60px;" />
		</a>
		<c:choose>
			<c:when test="${loginUserBean.userLogin == true }">
			<c:choose>
				<c:when test="${loginUserBean.user_idx != 3 }">
					<div style="margin-left: 15px; display: flex; flex-direction: column; border: 1px solid gray; border-radius: 5px; justify-content: center;">
						<span
							style="padding: 3px; font-size: 14px; font-weight: 600; color: gray; margin-right: 10px;">이름
							: ${loginUserBean.user_name }</span><span
							style="padding: 3px; font-size: 14px; font-weight: 600; color: gray; margin-right: 10px;">교번
							: ${loginUserBean.user_id }</span>
					</div>
				</c:when>
				</c:choose>
			</c:when>
		</c:choose>
	</div>
			
		<div>
			<c:choose>
				<c:when test="${loginUserBean.userLogin == true }">
					<!-- 로그인시 -->
					<%-- <a href="${root }user/modify"
						style="font-family: 'Nanum Gothic', sans-serif;">정보수정_미완성</a> --%>
					<a href="${root }user/logout"
						style="font-family: 'Nanum Gothic', sans-serif;">로그아웃</a>
				</c:when>
				<c:otherwise>
					<!-- 로그아웃시  -->
					<a href="${root }user/login"
						style="font-family: 'Nanum Gothic', sans-serif;">로그인</a>
				</c:otherwise>
			</c:choose>
		</div>
	</header>
	<nav>
		<c:choose>
			<c:when test="${loginUserBean.user_idx == 1 }">
				<a class="first-main" href="${root }student/stu_tt"> 학사관리
					시스템&ensp;&ensp;&ensp;</a>
				<a class="second-main" href="${root }enrolment/enrolm">
					&ensp;&ensp;&ensp;수강신청</a>
			</c:when>
			<c:when test="${loginUserBean.user_idx == 2 }">
				<a class="first-main" href="${root }professor/pro_tt"> 학사관리
					시스템&ensp;&ensp;&ensp;</a>
			</c:when>
		</c:choose>
	</nav>
	<main>
		<section>
			<div class="carousel-wrapper">
				<div class="carousel">
					<img class="carousel-img" src="image/univer1.jpg" />
				</div>
			</div>
			<div class="carousel-button">
				<div class="button1-box">
					<button class="prev" type="button">
						<img src="image/icons/arrow-left.png" />
					</button>
				</div>
				<div class="button2-box">
					<button class="next" type="button">
						<img src="image/icons/arrow-right.png" />
					</button>
				</div>
			</div>
		</section>
		<div class="decoration"></div>
		<section
			style="width: 100%; height: 100%; background-color: rgb(245, 245, 245)">
			<div></div>
			<div class="contain">
				<div class="notice-box">
					<div>
						<h3>공지</h3>
					</div>
					<div style="height: 200px;">
					<table>
						<tr>
							<th style="text-align: center;">번호</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">날짜</th>
						</tr>
						<tbody id="list">
							<!-- forEach -->
							<c:forEach items="${boardList }" var="board">
								<tr>
									<td><a
										href="${root }/board/read?noti_id=${board.noti_id }">
											${board.noti_id }</a></td>
									<td><a
										href="${root }/board/read?noti_id=${board.noti_id }">
											${board.title } </a></td>
									<td><a
										href="${root }/board/read?noti_id=${board.noti_id }">
											${board.registration }</a></td>
								</tr>
							</c:forEach>
						</tbody>
						<!-- forEach -->
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
				</div>
				
			</div>
		</section>
	</main>
	<c:import url="/WEB-INF/views/layout/footer.jsp" />
	<script>

	const prevButton = document.querySelector(".prev");
    const nextButton = document.querySelector(".next");
    const carousel = document.querySelector(".carousel");
    const carouselImg = document.querySelector(".carousel-img");
    let index = 0;
    const imgArray = [
      "image/univer1.jpg",
      "image/univer2.jpg",
      "image/univer3.jpg",
    ];

    prevButton.addEventListener("click", () => {
      if (index === 0) {
        index += 2;
        carouselImg.src = imgArray[index];
        return;
      }
      index -= 1;
      carouselImg.src = imgArray[index];
      // carousel.style.transform = `translate3d(-${100 * index}%, 0, 0)`;
    });

    nextButton.addEventListener("click", () => {
      if (index === 2) {
        index -= 2;
        carouselImg.src = imgArray[index];
        return;
      }
      index += 1;
      carouselImg.src = imgArray[index];
      // carousel.style.transform = `translate3d(-${100 * index}%, 0, 0)`;
    });

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
	            url: '${root}api/PageSel5',
	            type: 'GET',
	            data: {
	                page: currentPage
	            },
	            success: function(data) {
	                data.forEach(function(board) {
	                	 html += '<tr>';
		                    html += '<td><a href="' + root + '/board/read?noti_id=' + board.noti_id + '">' + board.noti_id + '</a></td>';
		                    html += '<td><a href="' + root + '/board/read?noti_id=' + board.noti_id + '">' + board.title + '</a></td>';
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
	</script>
</body>
</html>

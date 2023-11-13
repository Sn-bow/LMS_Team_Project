<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항 상세보기</title>
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
        width: 50%;
        margin: 15px auto;
      }

      nav > a {
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
        border-left: 1px solid lightgray;
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

      .content {
        width: 100%;
        height: 300px;
        border: 1px solid lightgray;
        border-top: 1px solid #a9c3b6;
        padding: 10px;
      }
      .search {
        width: 100%;
        display: flex;
        justify-content: right;
        align-items: center;
      }

      .search > select {
        width: 80px;
        height: 28px;
        font-size: 16px;
        font-weight: 700;
        margin-right: 15px;
      }

      .search > input[type="text"] {
        width: 250px;
        padding: 3px;
        font-size: 16px;
        margin-right: 15px;
      }

      .search > input[type="submit"] {
        width: 50px;
        padding: 1.5px;
        font-size: 16px;
        font-weight: 700;
      }

      .search > input[type="submit"]:hover {
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

      .pageNation > button {
        margin: 0 20px 0 20px;
      }

      .pageNation > div > span {
        margin: 0 20px 0 20px;
      }

      .pageNation > div > span > a {
        text-decoration: none;
        font-weight: 600;
        font-size: 16px;
        color: black;
      }
      .link-box {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 35px;
      }
      .link-box > a {
        margin: 15px;
        text-decoration: none;
        font-size: 18px;
        color: black;
        padding: 10px;
        border: 2px solid lightgray;
        border-radius: 5px;
        font-weight: 600;
        transition: all 0.2s ease-in-out;
      }
      .link-box > a:hover {
        background-color: #cedfdf;
        transition: all 0.2s ease-in-out;
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
    </style>
  </head>
<body>

	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/layout/top.jsp"/>
	 <main class="gradeCheck-main">
	      <h2>공지</h2>
	      <table>
	        <tr>
	          <th>제목</th>
	          <td colspan="3">${boardDto.title }</td>
	        </tr>
	        <tr>
	          <th>작성자</th>
	          <td>${boardDto.a_id }</td>
	          <th>작성날짜</th>
	          <td>${boardDto.registration }</td>
	        </tr>
	        <!-- <tr>
	          forEach
	          <td colspan="4">file.exe</td>
	        </tr> -->
	      </table>
	      <div class="content">
	        ${boardDto.content }
	      </div>
	      <div class="link-box">
	      	<%-- <c:choose>
				<c:when test="${loginUserBean.user_idx == 3}">
			        <a href="${root }board/modify?noti_id=${boardDto.noti_id }">수정</a>
			        <a href="${root }board/delete?noti_id=${boardDto.noti_id }">삭제</a>
		        </c:when>
	      	</c:choose> --%>
	        <a href="${root }board/main">목록</a>
	      </div>
    	</main>
</body>
</html>

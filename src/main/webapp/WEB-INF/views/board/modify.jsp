<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>공지사항 수정</title>
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
      input[type="submit"] {
        margin: 15px;
        text-decoration: none;
        font-size: 18px;
        color: black;
        padding: 10px;
        border: 2px solid lightgray;
        border-radius: 5px;
        font-weight: 600;
        background: none;
        transition: all 0.2s ease-in-out;
      }
      input[type="submit"]:hover {
        background-color: #cedfdf;
        transition: all 0.2s ease-in-out;
        cursor: pointer;
      }
    </style>
  </head>
<body>


	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/layout/admin_menu.jsp"/>
	<main>
      <h2>공지수정</h2>
      <form action="${root }board/writeForm" method="post">
          <input type="hidden" value="${bdto.noti_id }">
        <table>
          <tr>
            <th>제목</th>
            <td colspan="3">
              <input
                style="width: 100%; padding: 5px; font-size: 16px; border: none"
                type="text" id="title"
                placeholder="${bdto.title }" required
              />
            </td>
          </tr>
          <!-- <tr>
            forEach
            <td colspan="4"><input type="file" /></td>
          </tr> -->
        </table>
      		 <textarea style="width: 100%; padding: 5px; font-size: 16px; border: none; height: 150px;" id="content" placeholder="${bdto.content }" required></textarea>
        <div class="link-box">
          <input type="submit" value="수정"/>
          <a href="${root }board/read?noti_id=${bdto.noti_id }">취소</a>
        </div>
      </form>
    </main>
	
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
body {
	background: linear-gradient(155deg, rgba(0, 128, 0, 0.2),
		rgba(0, 128, 0, 0.5) 60%);
	height: 100vh;
}

.main {
	width: 100%;
	height: 100%;
}

.contain {
	width: 550px;
	height: 650px;
	/* border: 1px solid rgb(130, 130, 130); */
	border-radius: 15px;
	box-shadow: 0 0 20px rgb(250, 250, 250);
	margin: 180px auto;
}

.logo-box {
	width: 100%;
	height: 320px;
	/* border: 1px solid black; */
	position: relative;
	display: flex;
	justify-content: center;
}

.logo-box>img {
	/* border: 1px solid black; */
	width: 250px;
	position: absolute;
	top: -50px;
}

.form-box {
	width: 100%;
}

.form-box>form {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.input {
	width: 350px;
	font-size: 17px;
	padding: 10px;
	border: 1.5px solid rgb(150, 150, 150);
	transition: all 0.5s ease-in-out;
}

.input:focus {
	outline: none;
	border-color: #d6a8e9;
	box-shadow: 0 0 20px rgba(0, 128, 0, 0.6);
	transition: all 0.2s ease-in-out;
}

.studentNumber-input {
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
}

.password {
	border-bottom-left-radius: 12px;
	border-bottom-right-radius: 12px;
}

.login-submit {
	width: 370px;
	margin-top: 20px;
	padding: 8px;
	font-size: 16px;
	color: gray;
	border-radius: 10px;
	border: 2px solid rgb(150, 150, 150);
	transition: all 0.2s ease-in-out;
}

.login-submit:hover {
	cursor: pointer;
	box-shadow: 0 0 10px rgba(0, 128, 0, 0.6);
	transition: all 0.2s ease-in-out;
}
</style>
</head>
<body>

	<main class="main">
	<!-- 상단 메뉴 부분 -->
		<c:if test="${fail == true }">
			<div style="position: absolute; width: 100%; top: 0px" class="alert alert-danger">
				<h3>로그인 실패</h3>
				<p>아이디 비밀번호를 확인해주세요</p>
			</div>
		</c:if>
		<div class="contain">
			<div class="logo-box">
				<img src="../image/jonggak_un_logo.png" alt="대학로고" />
			</div>
			 <div class="form-box">
                <form:form action="${root }user/login_pro" method='post' modelAttribute="tempLoginUserBean"
                    onsubmit="return LoginFormCheck(this)">

                    <form:input path="user_id" class='studentNumber-input input' placeholder="학번/교번을 입력해주세요"/>
                    <form:errors path='user_id' style='color:red' />

                    <form:password path="user_pw" class='password input' placeholder="비밀번호를 입력해주세요" />
                    <form:errors path='user_pw' style='color:red' />

                    <div class="form-group text-right">
                        <form:button class='login-submit'>로그인</form:button>
                    </div>
                </form:form>
            </div>
		</div>
	</main>
</body>
</html>









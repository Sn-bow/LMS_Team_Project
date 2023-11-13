<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>미니 프로젝트</title>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style>
  .hidden {
    display: none;
  }
</style>
</head>
<body>

	<!-- 상단 메뉴 부분 -->
	<c:import url="/WEB-INF/views/layout/top_menu.jsp"/>
	<div class="container" style="margin-top: 100px">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<div class="card shadow">
					<div class="card-body">
						<form action="${root }user/join_${param.selectType}" method="post">
							<!-- 유효성 검사여부 보내기 -->
							<input type="hidden" name="userIdExist" value="" />
							<div class="form-group">
								<select id="selectType">
									<option value="student">학생</option>
									<option value="professor">교수</option>
								</select>
							</div>
							<div class="form-group set-student">`
								<label>학번</label>
								<input type="text" name="stu_id" class="form-control" />
								<label>학생 비밀번호</label>
								<input type="password" name="stu_pw" class="form-control" />
								<label>학생 이름</label>
								<input type="text" name="stu_name" class="form-control" />
								<label>학생 주민번호</label>
								<input type="text" name="stu_rnn" class="form-control" />
								<label>학생 전화번호</label>
								<input type="text" name="stu_phoneNum" class="form-control" />
								<label>학생 주소</label>
								<input type="text" name="stu_address" class="form-control" />
								<label>학생 이메일</label>
								<input type="text" name="stu_email" class="form-control" />
								<label>사진 아이디</label>
								<input type="text" name="pic_id" class="form-control" />
								<label>교수 아이디</label>
								<input type="text" name="pro_id" class="form-control" />
								<label>학과 아이디</label>
								<input type="text" name="dep_id" class="form-control" />
								<label>시작년도</label>
								<input type="text" name="startYear" class="form-control" />
								<label>졸업년도</label>
								<input type="text" name="endYear" class="form-control" />
								<label>학년</label>
								<input type="text" name="stu_level" class="form-control" />
								<label>학기</label>
								<input type="text" name="stu_semester" class="form-control" />
								<label>상태</label>
								<input type="text" name="stu_state" class="form-control" />
							</div>
							<div class="form-group set-professor hidden">
								<!-- 숨겨진 교수 부분 필드들 -->
								<label>교수 아이디</label>
								<input type="text" name="pro_id" class="form-control" />
								<label>교수 비밀번호</label>
								<input type="password" name="pro_pw" class="form-control" />
								<label>교수 이름</label>
								<input type="text" name="pro_name" class="form-control" />
								<label>연구실 주소</label>
								<input type="text" name="pro_room" class="form-control" />
								<label>연구실 전화번호</label>
								<input type="text" name="pro_roomNum" class="form-control" />
								<label>교수 이메일</label>
								<input type="text" name="pro_email" class="form-control" />
								<label>사진 아이디</label>
								<input type="text" name="pic_id" class="form-control" />
								<label>학과 아이디</label>
								<input type="text" name="dep_id" class="form-control" />
							</div>
							<div class="form-group">
								<div class="text-right">
									<button class="btn btn-primary">회원가입</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#selectType').change(function() {
				var selectedValue = $(this).val();

				if (selectedValue === 'student') {
					$('.set-student').removeClass('hidden');
					$('.set-professor').addClass('hidden');
				} else if (selectedValue === 'professor') {
					$('.set-student').addClass('hidden');
					$('.set-professor').removeClass('hidden');
				}
			});
		});
	</script>
</body>
</html>

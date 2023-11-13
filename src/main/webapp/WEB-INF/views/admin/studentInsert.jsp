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
    <title>학생 정보등록</title>
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
      nav > a {
        text-decoration: none;
        color: black;
        margin: 15px;
        font-size: 18px;
        font-weight: 600;
      }

      main {
        padding: 50px;
        min-width: 800px;
        max-width: 1950px;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .insert-form {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 120px auto;
        width: 50%;
        height: 500px;
      }
      .insert-box > div {
        width: 350px;
        height: 60px;
        border: 1px solid black;
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
        padding: 15px;
        border: 2px solid #cedfdf;
        border-radius: 5px;
      }
      .insert-box > div > div {
        font-size: 17px;
        font-weight: 600;
      }
      .insert-box > div > div > input {
        width: 200px;
        height: 20px;
        padding: 5px;
        font-size: 16px;
        border: 1.5px solid gray;
        border-radius: 4px;
      }
      .img-insert-box {
        height: 100%;
        margin-left: 105px;
        position: relative;
      }

      .img-insert-box > img {
        width: 150px;
        height: 150px;
        position: absolute;
        top: -13px;
        border: 1px solid #cedfdf;
        border-radius: 5px;
      }
      .img-insert-box > input {
        position: absolute;
        top: 150px;
      }
      .submit-btn {
        width: 100%;
        height: 100%;
        font-size: 18px;
        background: none;
        border: none;
        font-weight: 600;
        color: gray;
      }
      .submit-btn:hover {
        color: black;
        cursor: pointer;
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
    </style>
  </head>
  <body>
    <c:import url="/WEB-INF/views/layout/admin_menu.jsp" />
    <main>
      <form class="insert-form" action="${root }admin/studnetInsertForm" method="post" onsubmit="return stuinsertCheck(this)">
        <div class="insert-box">
          <div>
            <div>학번</div>
            <div><input type="text" name="stu_id" placeholder="학번을 입력해주세요" required/></div>
          </div>
          <div>
            <div>이름</div>
            <div><input type="text" name="stu_name" placeholder="이름을 입력해주세요" required/></div>
          </div>
          <div>
            <div>비밀번호</div>
            <div>
              <input type="password" name="stu_pw" placeholder="비밀번호를 입력해주세요" required/>
            </div>
          </div>
          <div>
            <div>생년월일</div>
            <div>
              <input type="text" name="stu_rnn" placeholder="생년월일을 입력해주세요" required/>
            </div>
          </div>
          <div>
            <div>주소</div>
            <div><input type="text" name="stu_address" placeholder="주소를 입력해주세요" required/></div>
          </div>
          <div>
            <div>이메일</div>
            <div><input type="text" name="stu_email" placeholder="이메일을 입력해주세요" required/></div>
          </div>
          <div>
            <div>전화번호</div>
            <div>
              <input type="text" name="stu_phoneNum" placeholder="전화번호를 입력해주세요" required/>
            </div>
          </div>
          <div><input class="submit-btn" type="submit" /></div>
        </div>
        <!-- <div class="img-insert-box">
          <img src="" />
          <input type="file" />
        </div> -->
      </form>
    </main>
    <c:import url="/WEB-INF/views/layout/footer.jsp" />
    <script type="text/javascript">
	    function stuinsertCheck(stuForm) {
	        var stu_id = stuForm.stu_id;
	        var stu_name = stuForm.stu_name;
	        var stu_pw = stuForm.stu_pw;
	        var stu_rnn = stuForm.stu_rnn;
	        var stu_address = stuForm.stu_address;
	        var stu_email = stuForm.stu_email;
	        var stu_phoneNum = stuForm.stu_phoneNum;
	
	        // 아이디 유효성 검사
	        var idPattern = /^S\d{8}$/; // "S"로 시작하고 8자리 숫자인지 확인하는 정규식
	        if (!idPattern.test(stu_id.value)) {
	          alert('아이디는 "S"로 시작하고 8자리 숫자여야 합니다.');
	          return false;
	        }
	
	     	// 비밀번호 유효성 검사
	        var pwPattern = /^[a-zA-Z0-9]{4,}$/; // 알파벳과 숫자로만 구성된 4자리 이상의 비밀번호인지 확인하는 정규식
	        if (!pwPattern.test(stu_pw.value)) {
	          alert('비밀번호는 알파벳과 숫자로만 구성된 4자리 이상이어야 합니다.');
	          return false;
	        }
	
	        // 나머지 필드들의 값이 비어있는지 확인
	        if (!(stu_name.value && stu_rnn.value && stu_address.value && stu_email.value && stu_phoneNum.value)) {
	          alert('모든 정보를 입력하세요.');
	          return false;
	        }
	      }
	</script>
  </body>
</html>

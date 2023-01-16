<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#empId').val().length==0){
				$('#msg').text('아이디를 입력해주세요.');
				$('#empId').focus();
				return;
			}
			if($('#empPw').val().length==0){
				$('#msg').text('비밀번호를 입력해주세요.');
				$('#empPw').focus();
				return;
			}
			$('#loginEmpForm').submit();
		});
	});
</script>
</head>
<body>
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	<h1>직원 로그인</h1>
	<form action="${pageContext.request.contextPath}/admin/emp/loginEmp" method="post" id="loginEmpForm">
		<div>
			아이디 : <input type="text" name="empId" id="empId">
		</div>
		<div>
			비밀번호 : <input type="password" name="empPw" id="empPw">
		</div>
		<div><span id="msg">${msg}</span></div> <!-- 빨간 색으로 -->
		<div><button type="button" id="submitBtn">로그인</button></div>
	</form>
</body>
</html>
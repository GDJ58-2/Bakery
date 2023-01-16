<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	// 비밀번호 길이 제한
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			$('#empNameMsg').text('');
			$('#empIdMsg').text('');
			$('#empPwMsg').text('');
			if($('#empName').val().length==0){
				$('#empNameMsg').text('필수정보입니다.');
			}
			if($('#empId').val().length==0){
				$('#empIdMsg').text('필수정보입니다.');
			}
			if($('#empPw').val().length==0){
				$('#empPwMsg').text('필수정보입니다.');
				return;
			}
			$('#addEmpForm').submit();
		});
	});
</script>
<title>addEmp</title>
</head>
<body>
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	<h1>회원가입</h1>
	<form action="${pageContext.request.contextPath}/admin/emp/addEmp" method="post" id="addEmpForm">
		<div>
			이름 : <input type="text" name="empName" id="empName">
			<span id="empNameMsg"></span>
		</div>
		<div>
			아이디 : <input type="text" name="empId" id="empId">
			<span id="empIdMsg">${msg}</span>
		</div>
		<div>
			비밀번호 : <input type="password" name="empPw" id="empPw">
			<span id="empPwMsg"></span>
		</div>
		<div><button type="button" id="submitBtn">가입</button></div>
	</form>
	<a href="${pageContext.request.contextPath}/admin/emp/loginEmp">로그인</a>
</body>
</html>
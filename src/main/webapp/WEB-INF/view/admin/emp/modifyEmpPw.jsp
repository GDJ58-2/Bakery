<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#empPw').val().length==0) {
				alert('비밀번호를 입력하세요.');
				$('#empPw').focus();
				return;
			}
			if($('#newEmpPw').val().length==0) {
				alert('새 비밀번호를 입력하세요.');
				$('#newEmpPw').focus();
				return;
			}
			if($('#checkEmpPw').val().length==0) {
				alert('비밀번호 확인을 입력하세요.');
				$('#checkEmpPw').focus();
				return;
			}
			if($('#newEmpPw').val()!=$('#checkEmpPw').val()) {
				alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
				$('#newEmpPw').val('');
				$('#checkEmpPw').val('');
				$('#newEmpPw').focus();
				return;
			}
			$('#modifyEmpPwForm').submit();
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	<h1>관리자- 직원비밀번호 변경</h1>
	<form action="${pageContext.request.contextPath}/admin/emp/modifyEmpPw" method="post" id="modifyEmpPwForm">
		<input type="hidden" value="${e.empId}" name="empId"> 
		<table border="1">
			<tr>
				<th>현재 비밀번호</th>
				<td><input type="password" name="empPw"></td>
			</tr>
			<tr>
				<th>새 비밀번호</th>
				<td><input type="password" name="newEmpPw"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="checkEmpPw"></td>
			</tr>
		</table>
		<div>
			<button type="button" id="submitBtn">변경</button>
		</div>
	</form>
</body>
</html>
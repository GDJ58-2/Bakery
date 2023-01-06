<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addEmp</title>
</head>
<body>
	<jsp:include page="../inc/empMenu.jsp"></jsp:include>
	<h1>회원가입</h1>
	<form action="${pageContext.request.contextPath}/emp/addEmp" method="post">
		<div>
			이름 : <input type="text" name="empName">
		</div>
		<div>
			아이디 : <input type="text" name="empId">
		</div>
		<div>
			비밀번호 : <input type="password" name="empPw">
		</div>
		<div><button type="submit">가입</button></div>
	</form>
</body>
</html>
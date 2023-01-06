<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/empMenu.jsp"></jsp:include>
	<h1>직원 로그인</h1>
	<form action="${pageContext.request.contextPath}/emp/loginEmp" method="post">
		<div>
			아이디 : <input type="text" name="empId">
		</div>
		<div>
			비밀번호 : <input type="password" name="empPw">
		</div>
		<div><button type="submit">로그인</button></div>
	</form>
</body>
</html>
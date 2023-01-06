<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/empMenu.jsp"></jsp:include>
	<h1>비밀번호 변경</h1>
	<form action="${pageContext.request.contextPath}/emp/modifyEmpPw" method="post">
		<div>
			아이디 : <input type="text" value="${e.empId}" name="empId" readonly="readonly">
			비밀번호 : <input type="password" name="empPw">
		</div>
		<div>
			<button type="submit">변경</button>
		</div>
	</form>
</body>
</html>
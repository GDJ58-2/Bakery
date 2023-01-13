<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	<h1>관리자-고객관리-탈퇴</h1>
	${customerId}님을 탈퇴시키겠습니까?
	<form action="${pageContext.request.contextPath}/admin/customer/removeCustomer" method="post">
		<button type="submit">예</button>
	</form>
</body>
</html>
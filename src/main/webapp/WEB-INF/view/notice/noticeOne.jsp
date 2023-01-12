<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h1>Notice</h1>
	<div>
		제목 : ${n.noticeTitle}
	</div>
	<div>
		내용 : ${n.noticeContent}
	</div>
	<div>
		작성자 : ${n.empId}
	</div>
	<div>
		작성일 : ${n.createdate}
	</div>
</body>
</html>
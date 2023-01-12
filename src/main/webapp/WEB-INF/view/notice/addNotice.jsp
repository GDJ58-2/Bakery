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
	<h1>add Notice</h1>
	<form action="${pageContext.request.contextPath}/notice/addNotice" method="post">
		<div>
			제목 : <input type="text" name="noticeTitle">
		</div>
		<div>
			내용 : <textarea rows="5" cols="50" name="noticeContent"></textarea>
		</div>
		<div>
			<button type="submit">등록</button>
		</div>
	</form>
</body>
</html>
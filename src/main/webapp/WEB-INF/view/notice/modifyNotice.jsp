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
	<h1>modify Notice</h1>
	<form action="${pageContext.request.contextPath}/notice/modifyNotice" method="post">
		<input type="hidden" name="noticeCode" value="${n.noticeCode}">
		<div>
			제목 : <input type="text" name="noticeTitle" value="${n.noticeTitle}">
		</div>
		<div>
			내용 : <textarea rows="5" cols="50" name="noticeContent">${n.noticeContent}</textarea>
		</div>
		<div>
			작성자 : <input type="text" name="empId" value="${n.empId}" readonly="readonly">
		</div>
		<div>
			작성일 : ${n.createdate}
		</div>
		<div><button type="submit">수정</button></div>
	</form>
</body>
</html>
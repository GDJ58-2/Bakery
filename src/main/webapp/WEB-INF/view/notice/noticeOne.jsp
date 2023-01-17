<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#removeNotice').click(function(){
			let result = confirm('삭제하시겠습니까?');
			if(result) {
				return true;
			} else {
				return false;
			}
		});
	});
</script>
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
		내용 : <pre>${n.noticeContent}</pre> <!-- pre : 개행과 줄바꿈을 처리  -->
	</div>
	<div>
		작성자 : ${n.empId}
	</div>
	<div>
		작성일 : ${n.createdate}
	</div>
	<a href="${pageContext.request.contextPath}/notice/noticeList">목록</a>
	<!-- emp 기능 -->
	<c:if test="${loginEmp ne null}">
		<a href="${pageContext.request.contextPath}/admin/notice/modifyNotice?noticeCode=${n.noticeCode}">수정</a>
		<a href="${pageContext.request.contextPath}/admin/notice/removeNotice?noticeCode=${n.noticeCode}" id="removeNotice">삭제</a>
	</c:if>
</body>
</html>
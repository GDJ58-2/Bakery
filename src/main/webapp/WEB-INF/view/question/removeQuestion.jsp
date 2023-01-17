<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>removeQuestion.jsp</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- 자바스크립트로 유효성 확인 -->
	<script>
		$(document).ready(function(){ // 페이지가 로드되고 나면 실행
			$('#deleteBtn').focus();
			
			$('#deleteBtn').click(function(){
				
				if(!confirm("문의 삭제하시면 관련 게시글도 전부 삭제됩니다.\n문의를 삭제하시겠습니까?")){
					$('#deleteBtn').focus();
					return false;
				} else {
					$('#deleteForm').submit();
				}
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h1>문의 삭제</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/question/removeQuestion" method="post" id="deleteForm">
		<table border="1">
			<tr>
				<th>문의 번호 : </th>
				<td>
					${question.questionCode}
					<input type="hidden" name="questionCode" value="${question.questionCode}">
				</td>
			</tr>
			<tr>
				<th>주문 번호 : </th>
				<td>
					${question.orderCode}
				</td>
			</tr>
			<tr>
				<th>문의 종류 : </th>
				<td>
					${question.category}
				</td>
			</tr>
			<tr>
				<th>문의 메모 : </th>
				<td>
					${question.questionMemo}
				</td>
			</tr>
			<tr>
				<th>문의 날짜 : </th>
				<td>
					${question.createdate}
				</td>
			</tr>
		</table>
		<button type="submit" id="deleteBtn">삭제</button>
	</form>
</body>
</html>
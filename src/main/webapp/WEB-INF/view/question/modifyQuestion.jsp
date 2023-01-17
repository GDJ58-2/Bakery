<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modifyQuestion.jsp</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- 자바스크립트로 유효성 확인 -->
	<script>
		$(document).ready(function(){ // 페이지가 로드되고 나면 실행
			let allCk = false;
			$('#category').focus();
			
			// 문의 종류 유효성 검사
			$('#category').blur(function(){
				if($('#category').val() == ''){
					$('#msg').text('문의 종류를 선택해주세요.');
					$('#category').focus();
				} else {
					$('#msg').text('');
					$('#questionMemo').focus();
				}
			});
			
			// 문의 내용 유효성 검사
			$('#questionMemo').blur(function(){
				if($('#questionMemo').val() == ''){
					$('#msg').text('문의 내용을 입력해주세요.');
					$('#questionMemo').focus();
				} else {
					$('#msg').text('');
					$('#modifyBtn').focus();
					allCk = true;
				}
			});
			
			$('#modifyBtn').click(function(){
				if(allCk == false){
					$('#category').focus();
					return false;
				}
				$('#modifyForm').submit();
			});
		});
	</script>	
</head>
<body>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h1>문의 수정</h1>
	<br>
	<div style="color:red;" id="msg">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/question/modifyQuestion" method="post" id="modifyForm">
		<table border="1">
			<tr>
				<th>문의 번호 : </th>
				<td>
					<input type="number" name="questionCode" value="${question.questionCode}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>주문 번호 : </th>
				<td>
					<input type="number" name="orderCode" value="${question.orderCode}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>문의 종류 : </th>
				<td>
					<select name="category" id="category">
						<option>${question.category}</option>
						<c:if test="${question.category ne '배송'}">
							<option value="배송">배송</option>
						</c:if>
						<c:if test="${question.category ne '반품'}">
							<option value="반품">반품</option>
						</c:if>
						<c:if test="${question.category ne '교환'}">
							<option value="교환">교환</option>
						</c:if>	
						<c:if test="${question.category ne '기타'}">
							<option value="기타">기타</option>
						</c:if>
					</select>
				</td>
			</tr>
			<tr>
				<th>문의 메모 : </th>
				<td>
					<textarea name="questionMemo" id="questionMemo" rows="5" cols="50">${question.questionMemo}</textarea>
				</td>
			</tr>
			<tr>
				<th>문의 날짜 : </th>
				<td>
					<input type="text" name="createdate" value="${question.createdate}" readonly="readonly">
				</td>
			</tr>
		</table>
		<button type="submit" id="modifyBtn">수정</button>
	</form>
</body>
</html>
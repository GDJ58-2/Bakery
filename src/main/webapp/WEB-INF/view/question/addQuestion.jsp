<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>addQuestion.jsp</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- 자바스크립트로 유효성 확인 -->
	<script>
		$(document).ready(function(){ // 페이지가 로드되고 나면 실행
			let allCk = false;
			$('#orderCode').focus();
			
			// 주문 내역 유효성 검사
			$('#orderCode').blur(function(){
				if($('#orderCode').val() == ''){
					$('#msg').text('주문 내역을 선택해주세요.');
					$('#orderCode').focus();
				} else {
					$('#msg').text('');
					$('#category').focus();
				}
			});
			
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
					$('#addBtn').focus();
					allCk = true;
				}
			});
			
			$('#addBtn').click(function(){
				if(allCk == false){
					$('#orderCode').focus();
					return false;
				}
				$('#addForm').submit();
			});
		});
	</script>	
</head>
<body>
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h1>문의 작성</h1>
	<br>
	<div style="color:red;" id="msg">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/question/addQuestion" method="post" id="addForm">
		<table border="1">
			<tr>
				<th>주문내역 </th>
				<td>
					<select name="orderCode" id="orderCode">
						<option>===</option>
						<c:forEach var = "order" items = "${orderCodeList}">
							<option value="${order.orderCode}">${order.orderCode} / ${order.goodsName} / ${order.orderQuantity}개</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>문의 종류</th>
				<td>
					<select name="category" id="category">
						<option value="배송">배송</option>
						<option value="반품">반품</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>문의 내용 : </th>
				<td>
					<textarea name="questionMemo" id="questionMemo" rows="5" cols="50"></textarea>
				</td>
			</tr>
		</table>
		<button type="submit" id="addBtn">문의등록</button>
	</form>
</body>
</html>
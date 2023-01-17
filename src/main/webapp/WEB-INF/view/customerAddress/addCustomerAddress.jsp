<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>addCustomerAddress.jsp</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- 자바스크립트로 유효성 확인 -->
	<script>
		$(document).ready(function(){ // 페이지가 로드되고 나면 실행
			let allCk = false;
			$('#addressKind').focus();
			
			// 주소 종류 유효성 검사
			$('#addressKind').blur(function(){
				if($('#addressKind').val() == ''){
					$('#msg').text('주소 종류를 선택해주세요.');
					$('#addressKind').focus();
				} else {
					$('#msg').text('');
					$('#address').focus();
				}
			});
			
			// 주소 유효성 검사
			$('#address').blur(function(){
				if($('#address').val() == ''){
					$('#msg').text('주소를 입력해주세요.');
					$('#address').focus();
				} else {
					$('#msg').text('');
					$('#addBtn').focus();
					allCk = true;
				}
			});
			
			$('#addBtn').click(function(){
				if(allCk == false){
					$('#addressKind').focus();
					return false;
				}
				$('#addForm').submit();
			});
		});
	</script>	
</head>
<body>
	<h1>주소 추가</h1>
	<br>
	<div style="color:red;" id="msg">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/customerAddress/addCustomerAddress" method="post" id="addForm">
		<input type="hidden" name="customerId" value="${customerId}">
		<table border="1">
			<tr>
				<th>주소 종류 : </th>
				<td>
					<select name="addressKind" id="addressKind">
						<option value="집">집</option>
						<option value="회사">회사</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>주소 : </th>
				<td>
					<input type="text" name="address" id="address">
				</td>
			</tr>
		</table>
		<button type="submit" id="addBtn">추가</button>
	</form>
</body>
</html>
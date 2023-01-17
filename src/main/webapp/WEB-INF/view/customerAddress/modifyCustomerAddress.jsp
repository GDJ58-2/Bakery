<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modifyCustomerAddress.jsp</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- 자바스크립트로 유효성 확인 -->
	<script>
		$(document).ready(function(){ // 페이지가 로드되고 나면 실행
			let allCk = false;
			$('#address').focus();			
			
			// 주소 유효성 검사
			$('#address').blur(function(){
				if($('#address').val() == ''){
					$('#msg').text('주소를 입력해주세요.');
					$('#address').focus();
				} else {
					$('#msg').text('');
					$('#modifyBtn').focus();
					allCk = true;
				}
			});
			
			$('#modifyBtn').click(function(){
				if(allCk == false){
					$('#address').focus();
					return false;
				}
				$('#modifyForm').submit();
			});
		});
	</script>	
</head>
<body>
	<h1>주소 수정</h1>
	<br>
	<div style="color:red;" id="msg">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/customerAddress/modifyCustomerAddress" method="post" id="modifyForm">
		<input type="hidden" name="addressCode" value="${ca.addressCode}">
		<table border="1">
			<tr>
				<th>주소 이름 : </th>
				<td>
					<input type="text" name="addressKind" value="${ca.addressKind}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>주소 : </th>
				<td>
					<input type="text" name="address" value="${ca.address}" id="address">
				</td>
			</tr>
			<tr>
				<th>생성 날짜 : </th>
				<td>${ca.createdate}</td>
			</tr>
		</table>
		<button type="submit" id="modifyBtn">수정</button>
	</form>
</body>
</html>
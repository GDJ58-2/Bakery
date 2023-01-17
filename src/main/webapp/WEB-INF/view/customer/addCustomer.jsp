<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#createBtn').click(function() {
			// 아이디
			$('#id').blur(function() {
				if($('#id').val() == ''){
					$('#idMsg').text('ID를 입력하세요');
					$('#id').focus();
				} else {
					$('#idMsg').text('');
					$('#pw').focus();
				}
			});
			// 비밀번호
			$('#pw').blur(function() {
				if($('#pw').val() == ''){
					$('#pwMsg').text('pw를 입력하세요');
					$('#pw').focus();
				} else {
					$('#pwMsg').text('');
					$('#pwck').focus();
				}
			});
			// 비밀번호 확인
			$('#pwck').blur(function() {
				if($('#pw').val() != $('#pwck').val()){
					$('#ckMsg').text('pw가 일치하지 않습니다');
					$('#pwck').focus();
				} else {
					$('#ckMsg').text('');
					$('#name').focus();
				}
			});
			// 이름확인
			$('#name').blur(function() {
				if($('#name').val() == ''){
					$('#nameMsg').text('이름을 입력하세요');
					$('#name').focus();
				} else {
					$('#nameMsg').text('');
					$('#phone').focus();
				}
			});
			// 전화번호 확인
			$('.phone').blur(function() {
				if($('.phone').val() == ''){
					$('#phoneMsg').text('전화번호를 입력하세요');
					$('#phone').focus();
				} else {
					$('#phoneMsg').text('');
					$()
				}
			});
			// 주소확인
			
		});

		if($('.msg').val() == '') {
			$('#loginForm').submit();
		}
	});
</script>
</head>
<body>
	<h2>회원가입</h2>
	<form action = "${pageContext.request.contextPath}/customer/addCustomer" method = "post" id = "loginForm">
		<table>
			<tr>
				<td>ID</td>
				<td>
					<input type = "text" id = "id" name = "id">
					<span id = "idMsg" class = "msg"></span>
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
					<span>
					<input type = "password" id = "pw" name = "pw"><br>
					<input type = "password" id = "pwck" placeholder = "pw확인">
					</span>
					<span id = "pwMsg" class = "msg"></span>
					<span id = "ckMsg" class = "msg"></span>
				</td>
			</tr>
			<tr>
				<td>Name</td>
				<td>
					<input type = "text" id = "name" name = "name">
					<span id = "nameMsg" class = "msg"></span>
				</td>
			</tr>
			<tr>
				<td>Phone Number</td>
				<td>
					<input type = "text" class = "phone" name = "phone1">-<input type = "text" class = "phone" name = "phone2">-<input type = "text" class = "phone" name = "phone3">
					<span id = "phoneMsg" class = "msg"></span>
				</td> 
			</tr>
			<tr>
				<td>Address</td>
				<td>
					<input type = "radio" class = "addressKind" name = "addressKind" value = "집">집
					<input type = "radio" class = "addressKind" name = "addressKind" value = "회사">회사
					<input type = "text" id = "address" name = "address">
				</td>
			</tr>
		</table>
		<button type = "button" id = "createBtn">create</button>
	</form>
	<a href = "${pageContext.request.contextPath}/customer/login">
		<button type = "button" id = "loginBtn">login</button>
	</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			$('#authCodeMsg').text('');
			$('#authMemoMsg').text('');
			if($('#authCode').val().length==0) {
				$('#authCodeMsg').text('필수정보입니다.');
			}
			if($('#authMemo').val().length==0) {
				$('#authMemoMsg').text('필수정보입니다.');
				return;
			}
			$('#addAuthInfoForm').submit();
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	<h1>관리자 등급 추가</h1>
	<form action="${pageContext.request.contextPath}/admin/auth/addAuthInfo" method="post" id="addAuthInfoForm">
		<div>
			등급번호 : <input type="number" name="authCode" id="authCode">
			<span id="authCodeMsg"></span>
		</div>
		<div>
			등급 : <input type="text" name="authMemo" id="authMemo">
			<span id="authMemoMsg"></span>
		</div>
		<div><button type="button" id="submitBtn">추가</button></div>
	</form>
</body>
</html>
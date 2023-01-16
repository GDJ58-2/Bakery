<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#authMemo').val().length==0) {
				$('#authMsg').text('등급을 작성해주세요.');
				$('#authMemo').focus();
				return;
			}
			$('#modifyAuthInfoForm').submit();
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	<h1>관리자 등급 수정</h1>
	<form action="${pageContext.request.contextPath}/admin/auth/modifyAuthInfo" method="post" id="modifyAuthInfoForm">
		<div>
			등급번호 : <input type="number" name="authCode" readonly="readonly" value="${a.authCode}">
		</div>
		<div>
			등급 : <input type="text" name="authMemo" value="${a.authMemo}" id="authMemo">
		</div>
		<div><span id="authMsg"></span></div><!-- 빨간 색 -->
		<div><button type="button" id="submitBtn">수정</button></div>
	</form>
</body>
</html>
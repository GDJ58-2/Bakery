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
		$('#removeBtn').click(function() {
			let removeCheck = $('#removeCheck').is(':checked');
			if(removeCheck) {
				$('#removeForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<form action = "${pageContext.request.contextPath}/customer/removeCustomer" method = "post" id = "removeForm">
    	<input type = "hidden" name = "id" value = "${loginCustomer.customerId}">
    	<div>회원탈퇴시 개인정보 및 개인데이터는 삭제됩니다
       		<br>단, 아래 항목은 삭제되지 않으므로 삭제를 원하시면 탈퇴 전 삭제하시기 바랍니다
       		<br>- 리뷰
       		<br>- QNA
       		<br>또한 탈퇴한 아이디는 재사용과 복구가 불가합니다
    	</div>
    	<div>
    		<input type = "checkbox" id = "removeCheck">
			안내사항을 확인하였으며, 이에 동의합니다
    	</div>
    	<button type = "button" id = "removeBtn">회원탈퇴</button>
 	</form>
</body>
</html>
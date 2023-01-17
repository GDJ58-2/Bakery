<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#noticeTitle').val().length==0) {
				alert('제목을 입력해주세요.');
				$('#noticeTitle').focus();
				return;
			}
			if($('#noticeContent').val().length==0) {
				alert('내용을 입력해주세요.');
				$('#noticeContent').focus();
				return;
			}
			$('#addNoticeForm').submit();
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	<h1>add Notice</h1>
	<form action="${pageContext.request.contextPath}/admin/notice/addNotice" method="post" id="addNoticeForm">
		<div>
			제목 : <input type="text" name="noticeTitle" id="noticeTitle">
		</div>
		<div>
			내용 : <textarea rows="5" cols="50" name="noticeContent" id="noticeContent"></textarea>
		</div>
		<div>
			<button type="button" id="submitBtn">등록</button>
		</div>
	</form>
</body>
</html>
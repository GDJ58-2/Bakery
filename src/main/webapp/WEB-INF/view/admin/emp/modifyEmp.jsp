<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('.authCode option:selected').val()==0){ // authCode=0 -> 비활성화
				$('#active').val('N');
			} else {
				$('#active').val('Y');
			}
			$('#modifyEmpForm').submit();
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	<h1>관리자-직원 권한/활성화 상태 수정</h1>
	<form action="${pageContext.request.contextPath}/admin/emp/modifyEmp" method="post" id="modifyEmpForm">
		<input type="hidden" name="empId" value="${e.empId}">
		<input type="hidden" name="empCode" value="${e.empCode}">
		<input type="hidden" name="active" id="active">
		<table border="1">
			<thead>
				<tr>
					<th>#</th>
					<th>ID</th>
					<th>이름</th>
					<th>권한</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${e.empCode}</td>
					<td>${e.empId}</td>
					<td>${e.empName}</td>
					<td>
						<select name="authCode" id="authCode">
							<c:forEach var="a" items="${authInfoList}">
								<option value="${a.authCode}">${a.authCode} ${a.authMemo}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<div><button type="button" id="submitBtn">변경</button></div>
	</form>
</body>
</html>
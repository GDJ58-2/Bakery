<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addQuestion.jsp</title>
</head>
<body>
	<h1>문의 작성</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/question/addQuestion" method="post">
		<table border="1">
			<tr>
				<th>주문 번호 : </th>
				<td>
					<input type="number" name="orderCode" value="${orderCode}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>문의 종류</th>
				<td>
					<select name="category">
						<option value="배송">배송</option>
						<option value="반품">반품</option>
						<option value="교환">교환</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>문의 메모 : </th>
				<td>
					<textarea name="questionMemo"></textarea>
				</td>
			</tr>
		</table>
		<button type="submit">문의등록</button>
	</form>
</body>
</html>
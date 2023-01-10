<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionList.jsp</title>
</head>
<body>
	<h1>questionList</h1>
	<a href="${pageContext.request.contextPath}/question/addQuestion">추가</a> <!-- 문의하기 -> 주문번호 선택-> 내 문의 내역 마이페이지-->
	<table border="1">
		<thead>
			<tr>
				<th>문의번호</th>
				<th>문의종류</th>
				<th>문의내용</th>
				<th>등록일</th>
				<th>답변</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="q" items="${list}">
				<tr>
					<td>${q.questionCode}</td>
					<td>${q.category}</td>
					<td>
						<a href="${pageContext.request.contextPath}/question/questionOne?questionCode=${q.questionCode}">
							${q.questionMemo}
						</a>
					</td> 
					<td>${q.createdate}</td>
					<c:if test="${q.commentCode eq null||q.commentCode == 0}">
						<td>답변 대기</td>
					</c:if>
					<c:if test="${q.commentCode ne null&&q.commentCode != 0}">
						<td>답변 완료</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
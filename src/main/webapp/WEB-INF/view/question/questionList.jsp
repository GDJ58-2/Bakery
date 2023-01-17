<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionList.jsp</title>
</head>
<body>
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h1>questionList</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<a href="${pageContext.request.contextPath}/question/addQuestion">추가</a> <!-- 문의하기 -> 주문번호 선택-> 내 문의 내역 마이페이지-->
	<table border="1">
		<thead>
			<tr>
				<th>문의번호</th>
				<th>문의종류</th>
				<th>문의내용</th>
				<th>등록일</th>
				<th>답변</th>
				<th>&nbsp;</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="q" items="${list}">
				<tr>
					<td>${q.questionCode}</td>
					<td>${q.category}</td>
					<td>
						<a href="${pageContext.request.contextPath}/question/questionOne?questionCode=${q.questionCode}">
							${q.questionMemo} <!-- ... -->
						</a>
					</td> 
					<td>${q.createdate}</td>
					<c:if test="${q.commentCode eq null||q.commentCode == 0}">
						<td>답변 대기</td>
						<td>
							<a href="${pageContext.request.contextPath}/question/modifyQuestion?questionCode=${q.questionCode}">수정</a>
							<a href="${pageContext.request.contextPath}/question/removeQuestion?questionCode=${q.questionCode}">삭제</a>
						</td>
					</c:if>
					<c:if test="${q.commentCode ne null&&q.commentCode != 0}">
						<td>답변 완료</td>
						<th>&nbsp;</th>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<!-- 페이징 -->
	<div>
		<a type="button" href="${pageContext.request.contextPath}/question/questionList?currentPage=1">처음</a>
			<c:if test="${currentPage > 1}">
				<a type="button" href="${pageContext.request.contextPath}/question/questionList?currentPage=${currentPage-1}">이전</a>
			</c:if>
			<span>${currentPage}</span>
			<c:if test="${currentPage < lastPage}">
				<a type="button" href="${pageContext.request.contextPath}/question/questionList?currentPage=${currentPage+1}">다음</a>
			</c:if>
		<a type="button" href="${pageContext.request.contextPath}/question/questionList?currentPage=${lastPage}">마지막</a>
	</div>
</body>
</html>
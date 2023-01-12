<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/empMenu.jsp"></jsp:include><!-- 관리자 -->
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h1>noticeList</h1>
	<!-- 관리자 기능 -->
	<a href="${pageContext.request.contextPath}/notice/addNotice">추가</a>
	
	<!-- 검색창 -->
	<form action="${pageContext.request.contextPath}/notice/noticeList">
		<input type="text" name="search" value="${search}">
		<button type="submit">검색</button>
		<select name="rowPerPage">
			<option value=10>10</option>
			<option value=20>20</option>
			<option value=30>30</option>
		</select>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${noticeList}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/notice/noticeOne?noticeCode=${n.noticeCode}">${n.noticeTitle}</a></td>
					<td>${n.empId}</td>
					<td>${n.createdate}</td>
					
					<!-- 관리자 -->
					<td>
						<a href="${pageContext.request.contextPath}/notice/modifyNotice?noticeCode=${n.noticeCode}">수정</a>
						<a href="${pageContext.request.contextPath}/notice/removeNotice?noticeCode=${n.noticeCode}">삭제</a>
					</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}&search=${search}">이전</a>
	<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}&search=${search}">다음</a>
</body>
</html>
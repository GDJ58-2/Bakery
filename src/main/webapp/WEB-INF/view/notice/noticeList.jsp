<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#rowPerPage').change(function(){
			$('#form').submit();
		});
		$('#submitBtn').click(function(){
			$('#form').submit();
		});
		$('#removeNotice').click(function(){
			let result = confirm('삭제하시겠습니까?');
			if(result) {
				return true;
			} else {
				return false;
			}
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h1>noticeList</h1>
	<a href="${pageContext.request.contextPath}/admin/notice/addNotice">추가</a>
	<!-- 검색창 -->
	<form action="${pageContext.request.contextPath}/notice/noticeList" id="form">
		<input type="text" name="search" value="${search}" id="search">
		<button type="button" id="submitBtn">검색</button>
		
		<!-- 페이지당 보여질 공지 개수 -->
		<select name="rowPerPage" id="rowPerPage">
			<c:forEach var="i" begin="10" end="30" step="10">
				<c:if test="${rowPerPage eq i}">
					<option value="${i}" selected="selected">${i}</option>
				</c:if>
				<c:if test="${rowPerPage ne i}">
					<option value="${i}">${i}</option>
				</c:if>
			</c:forEach>
		</select>
	</form>
	
	<!-- noticeList -->
	<table border="1">
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<!-- emp 기능 -->
				<c:if test="${loginEmp ne null}">
					<th>수정/삭제</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${noticeList}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/notice/noticeOne?noticeCode=${n.noticeCode}">${n.noticeTitle}</a></td>
					<td>${n.empId}</td>
					<td>${n.createdate}</td>
					<!-- emp 기능 -->
					<c:if test="${loginEmp ne null}">
						<td>
							<a href="${pageContext.request.contextPath}/admin/notice/modifyNotice?noticeCode=${n.noticeCode}">수정</a>
							<a href="${pageContext.request.contextPath}/admin/notice/removeNotice?noticeCode=${n.noticeCode}" id="removeNotice">삭제</a>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 -->
	<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}&search=${search}">이전</a>
	<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}&search=${search}">다음</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsListByAdmin.jsp</title>
</head>
<body>
<h1>상품 안내</h1>
	<c:choose>
		<c:when test="${categoryKind == null || categoryKind eq ''}">
			<a href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?categoryKind=">전체</a>
			<c:forEach var="gc" items="${gcList}">
				<a href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?categoryNo=${gc.categoryNo}&categoryKind=${gc.categoryKind}">${gc.categoryName}</a>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?categoryKind=">전체</a>
			<c:forEach var="gc" items="${gcList}">
				<c:if  test="${categoryKind eq gc.categoryKind}">
					<a href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?categoryNo=${gc.categoryNo}&categoryKind=${gc.categoryKind}">${gc.categoryName}</a>
				</c:if>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<table border="1">
		<tr>
			<!-- 
				varStatus 변수속성
				${s.current} 현재 for문의 해당하는 번호
				${s.index} 0부터의 순서
				${s.count} 1부터의 순서
				${s.first} 첫 번째인지 여부
				${s.last} 마지막인지 여부
				${s.begin} for문의 시작 번호
				${s.end} for문의 끝 번호
				${s.step} for문의 증가값				
			-->
			<c:forEach var="m" items="${list}" varStatus="s">
				<c:if test="${s.index != 0 && s.index % 5 == 0}">
					</tr><tr>
				</c:if>
				
				<td>
					<div>
						<a href="${pageContext.request.contextPath}/admin/goods/goodsOneByAdmin?goodsCode=${m.goodsCode}">
							<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="200" height="200">
						</a>
					</div>
					<div>
						<a href="${pageContext.request.contextPath}/admin/goods/goodsOneByAdmin?goodsCode=${m.goodsCode}">
							${m.goodsName}
						</a>
					</div>
					<div>재고 : ${m.goodsStock}개</div>
					<a href="${pageContext.request.contextPath}/admin/goods/modifyGoods?goodsCode=${m.goodsCode}">수정</a>
					<a href="${pageContext.request.contextPath}/admin/goods/removeGoods?goodsCode=${m.goodsCode}">삭제</a>
				</td>
			</c:forEach>
		</tr>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/admin/goods/addGoods">
			상품 추가
		</a>
	</div>
</body>
</html>
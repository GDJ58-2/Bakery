<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<c:choose>
				<c:when test = "${userListOne ne null}">
					<table>
						<tr>
							<td><input type="hidden" name="goodsCode" value="${user.goodsCode}"></td>
							<td></td>
							<td><img src = "${pageContext.request.contextPath}/upload/${user.filename}" width = "50" height = "50"></td>
							<td><input type="hidden" name="goodsName" value="${user.goodsName}">${user.goodsName}</td>
							<td>
								<form action = "${pageContext.request.contextPath}/cart/modifyCart" method="post">
									<input type="hidden" name="goodsCode" value="${user.goodsCode}">
									<input type="number" name="cartQuantity" value="${user.cartQuantity}">개
									<button type = "submit">변경하기</button>
								</form>
							</td>
						</tr>
					</table>
				</c:when>
				<c:when test = "${customerListOne ne null && loginCustomer ne null}">
					<table>
							<tr>
								<td><input type="hidden" name="goodsCode" value="${customerListOne.goodsCode}"></td>
								<td></td>
								<td><img src = "${pageContext.request.contextPath}/upload/${customerListOne.filename}" width = "50" height = "50"></td>
								<td><input type="hidden" name="goodsName" value="${customerListOne.goodsName}">${customerListOne.goodsName}</td>
								<td>
									<form action="${pageContext.request.contextPath}/cart/modifyCart" method="post">
										<input type="hidden" name="goodsCode" value="${customerListOne.goodsCode}">
										<input type="number" name="cartQuantity" value="${customerListOne.cartQuantity}">개
										<button type = "submit">변경하기</button>
									</form>
								</td>
							</tr>
					</table>
				</c:when>
			</c:choose>
	
	<div>
		<c:if test = "${loginCustomer == null}">
			<a href ="${pageContext.request.contextPath}/customer/login">
				로그인
			</a>
		</c:if>
	</div>
</body>
</html>
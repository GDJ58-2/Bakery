<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- Core JSTL 사용 -->
<c:if test="${loginCustomer eq null}">
	<div>
		<a href="${pageContext.request.contextPath}/customer/login">로그인</a>
	</div>
</c:if>
<c:if test="${loginCustomer ne null}">
	<div>
		<a href="${pageContext.request.contextPath}/customer/home">${loginCustomer.customerName} 님</a>
	</div>
</c:if>
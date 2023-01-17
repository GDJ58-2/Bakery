<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>goodsList.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- 자바스크립트로 유효성 확인 -->
	<script>
		$(document).ready(function(){ // 페이지가 로드되고 나면 실행
			let allCk = false;
			$('#empPw').focus();
			
			// 비밀번호 유효성 검사
			$('#empPw').blur(function(){
				if($('#empPw').val() == ''){
					$('#msg').text('비밀번호를 입력해주세요.');
					$('#empPw').focus();
				} else {
					$('#msg').text('');
					$('#deleteBtn').focus();
					allCk = true;
				}
			});
			
			$('#deleteBtn').click(function(){
				if(allCk == false){
					$('#empPw').focus();
					return false;
				}
				if(!confirm("상품을 삭제하시면 관련 게시글도 전부 삭제됩니다.\n상품을 삭제하시겠습니까?")){
					$('#empPw').focus();
					return false;
				} else {
					$('#deleteForm').submit();
				}
			});
		});
	</script>
</head>
<body>
	<h1>상품 삭제</h1>
	<br>
	<div style="color:red;" id="msg">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/admin/goods/removeGoods" method="post" id="deleteForm">
		<table border="1">
			<tr>
				<td rowspan="9">
					<img src="${pageContext.request.contextPath}/upload/${map.filename}" width="400" height="400">
				</td>
				<th>상품 코드 : </th>
				<td>
					${map.goodsCode}
					<input type="hidden" name="goodsCode" value="${map.goodsCode}">
				</td>
			</tr>
			<tr>
				<th>상품 종류 : </th>
				<td>${map.categoryKind} ${map.categoryName}</td>
			</tr>
			<tr>
				<th>상품 이름 : </th>
				<td>${map.goodsName}</td>
			</tr>
			<tr>
				<th>상품 가격 : </th>
				<td>${map.goodsPrice}</td>
			</tr>
			<tr>
				<th>상품 재고 : </th>
				<td>${map.goodsStock}개</td>
			</tr>
			<tr>
				<th>작성 직원 : </th>
				<td>${map.empId}</td>
			</tr>
			<tr>
				<th>상품 순위 : </th>
				<td>${map.hit}위</td>
			</tr>
			<tr>
				<th>출시 일자 : </th>
				<td>${map.createdate}</td>
			</tr>
			<tr>
				<th>비밀 번호 입력 : </th>
				<td>
					<input type="password" name="empPw">
				</td>
			</tr>
			<tr>
			<td colspan="3">
				<div>상품 설명 : </div>
				<div>${map.goodsContent}</div>
			</td>
		</tr>
		</table>
		<button type="submit" id="deleteBtn">상품삭제</button>
	</form>
</body>
</html>
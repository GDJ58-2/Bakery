<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>addGoods.jsp</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- 자바스크립트로 유효성 확인 -->
	<script>
		$(document).ready(function(){ // 페이지가 로드되고 나면 실행
			let allCk = false;
			${'#categoryNo'}.focus();
			
			// 상품 종류 유효성 검사
			$('#categoryNo').blur(function(){
				if($('#categoryNo').val() == ''){
					$('#msg').text('상품 종류를 선택해주세요.');
					$('#categoryNo').focus();
				} else {
					$('#msg').text('');
					$('#goodsName').focus();
				}
			});
			
			// 상품 이름 유효성 검사
			$('#goodsName').blur(function(){
				if($('#goodsName').val() == ''){
					$('#msg').text('상품 이름을 입력해주세요.');
					$('#goodsName').focus();
				} else {
					$('#msg').text('');
					$('#goodsPrice').focus();
				}
			});
			
			// 상품 가격 유효성 검사
			$('#goodsPrice').blur(function(){
				if($('#goodsPrice').val() == ''){
					$('#msg').text('상품 가격을 입력해주세요.');
					$('#goodsPrice').focus();
				} else {
					$('#msg').text('');
					$('#goodsContent').focus();
				}
			});
			
			// 상품 설명 유효성 검사
			$('#goodsContent').blur(function(){
				if($('#goodsContent').val() == ''){
					$('#msg').text('상품 설명을 입력해주세요.');
					$('#goodsContent').focus();
				} else {
					$('#msg').text('');
					$('#goodsStock').focus();
				}
			});
			
			// 상품 설명 유효성 검사
			$('#goodsContent').blur(function(){
				if($('#goodsContent').val() == ''){
					$('#msg').text('상품 설명을 입력해주세요.');
					$('#goodsContent').focus();
				} else {
					$('#msg').text('');
					$('#empId').focus();
				}
			});
			
			// 직원 아이디 유효성 검사
			$('#empId').blur(function(){
				if($('#empId').val() == ''){
					$('#msg').text('직원 아이디를 입력해주세요.');
					$('#empId').focus();
				} else {
					$('#msg').text('');
					$('#hit').focus();
				}
			});
			
			// 상품 순위 유효성 검사
			$('#hit').blur(function(){
				if($('#hit').val() == ''){
					$('#msg').text('상품 순위를 입력해주세요.');
					$('#hit').focus();
				} else {
					$('#msg').text('');
					$('#goodsImg').focus();
				}
			});
			
			// 상품 이미지 파일 유효성 검사
			$('#goodsImg').blur(function(){
				if($('#goodsImg').val() == ''){
					$('#msg').text('상품 이미지 파일을 불러오세요.');
					$('#goodsImg').focus();
				} else {
					$('#msg').text('');
					$('#addBtn').focus();
					allCk = true;
				}
			});
			
			$('#addBtn').click(function(){
				if(allCk == false){
					$('#categoryNo').focus();
					return false;
				}
				$('#addGoodsForm').submit();
			});
		});
	</script>
</head>
<body>
	<h1>상품 등록</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/admin/goods/addGoods" method="post" enctype="multipart/form-data" id="addGoodsForm">
		<table border="1">
			<tr>
				<th>상품 종류 : </th>
				<td>
					<select name= "categoryNo" id="categoryNo">
						<c:forEach var="gc" items="${list}">
							<option value="${gc.categoryNo}">
								${gc.categoryKind} ${gc.categoryName}
							</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품 이름 : </th>
				<td>
					<input type="text" name="goodsName" id="goodsName">
				</td>
			</tr>
			<tr>
				<th>상품 가격 : </th>
				<td>
					<input type="number" name="goodsPrice" id="goodsPrice">원
				</td>
			</tr>
			<tr>
				<th>상품 설명 : </th>
				<td>
					<textarea name="goodsContent" id="goodsContent" rows="10" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<th>상품 재고 : </th>
				<td>
					<input type="number" name="goodsStock" id="goodsStock">개
				</td>
			</tr>
			<tr>
				<th>직원 아이디 : </th>
				<td>
					<input type="text" name="empId" id="empId">
				</td>
			</tr>
			<tr>
				<th>상품 순위 : </th>
				<td>
					<input type="number" name="hit" id="hit">위
				</td>
			</tr>
			<tr>
				<th>상품 이미지 : </th>
				<td>
					<input type="file" name="goodsImg" id="goodsImg">
				</td>
			</tr>
		</table>
		<button type="submit" id="addBtn">상품등록</button>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modifyGoods.jsp</title>
	
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
					$('#goodsStock').focus();
				}
			});
			
			// 상품 재고 유효성 검사
			$('#goodsStock').blur(function(){
				if($('#goodsStock').val() == ''){
					$('#msg').text('상품 재고를 입력해주세요.');
					$('#goodsStock').focus();
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
					$('#modifyBtn').focus();
					allCk = true;
				}
			});
			
			$('#modifyBtn').click(function(){
				if(allCk == false){
					$('#categoryNo').focus();
					return false;
				}
				$('#modifyForm').submit();
			});
	</script>
</head>
<body>
	<h1>상품 수정</h1>
	<br>
	<div style="color:red;" id="msg">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/admin/goods/modifyGoods" method="post" enctype="multipart/form-data" id="modifyForm">
		<table border="1">
			<tr>
				<td rowspan="8">
					<img src="${pageContext.request.contextPath}/upload/${map.filename}" width="400" height="400">
				</td>
				<th>상품 코드 : </th>
				<td>
					<input type="number" name="goodsCode" value="${map.goodsCode}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>상품 종류 : </th>
				<td>
					<select name= "categoryNo" id="categoryNo">
						<option value="${map.categoryNo}">
							${map.categoryKind} ${map.categoryName}
						</option>
						<c:forEach var="gc" items="${list}">
							<c:if test="${gc.categoryNo != map.categoryNo}">
								<option value="${gc.categoryNo}">
									${gc.categoryKind} ${gc.categoryName}
								</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품 이름 : </th>
				<td>
					<input type="text" name="goodsName" value="${map.goodsName}" id="goodsName">
				</td>
			</tr>
			<tr>
				<th>상품 가격 : </th>
				<td>
					<input type="number" name="goodsPrice" value="${map.goodsPrice}" id="goodsPrice">
				</td>
			</tr>
			<tr>
				<th>상품 재고 : </th>
				<td>
					<input type="number" name="goodsStock" value="${map.goodsStock}" id="goodsStock">
				</td>
			</tr>
			<tr>
				<th>직원 아이디 : </th>
				<td>
					<input type="text" name="empId" value="${map.empId}" id="empId">
				</td>
			</tr>
			<tr>
				<th>상품 순위 : </th>
				<td>
					<input type="number" name="hit" value="${map.hit}" id="hit">
				</td>
			</tr>
			<tr>
				<th>상품 이미지 : </th>
				<td>
					<input type="file" name="goodsImg" id="goodsImg">
				</td>
			</tr>
			<tr>
			<td colspan="3">
				<div>상품 설명 : </div>
				<textarea name="goodsContent" rows="5" cols="100" id="goodsContent">${map.goodsContent}</textarea>
			</td>
		</tr>
		</table>
		<button type="submit" id="modifyBtn">상품수정</button>
	</form>
</body>
</html>
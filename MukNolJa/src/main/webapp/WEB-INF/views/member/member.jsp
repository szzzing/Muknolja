<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 상세보기</h1>
	<table>
		<tr>
			<th>상품명</th>
			<td>${ product.productName }</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${ product.price }</td>
			<th>등록날짜</th>
			<td>${product.createDate}</td>
		</tr>
		<tr>
			<th>상품 내용</th>
			<td>${ product.productContent }</td>
		</tr>
	</table>
</body>
</html>
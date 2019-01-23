<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = dao.selectProduct(id);
	if(dto ==null){
%>
	입력하신 아이디에 대한 상품 정보가 없습니다.
	<br><a href="index.html">메인으로</a>
<%}else{ %>
	<form action="update2.jsp">
		<input type="hidden" name = "id" value="<%=dto.getId() %>">
		상품설명 : <input type="text" name="explanation" value="<%=dto.getExplanation()%>"><br>
		가격 : <input type="text"	name="price" value="<%=dto.getPrice()%>"><br>
		<input type="submit" value="수정하기">
	</form>
<%} %>

</body>
</html>
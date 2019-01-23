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

<!-- insert.html에서 넘어온 자료들을 dto에 저장 -->
<jsp:useBean id="dto" class="product.ProductDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%	
	ProductDAO dao = new ProductDAO();
	dao.insertProduct(dto);
	response.sendRedirect("index.html");
%>

</body>
</html>
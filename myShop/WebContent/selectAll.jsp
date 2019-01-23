<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
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
<%	ProductDAO dao = new ProductDAO();
	ArrayList<ProductDTO> list = dao.selectAll();
	for(int i =0; i<list.size(); i++){
%>
아이디 : <%=list.get(i).getId() %><br>
제목 : <%=list.get(i).getTitle() %><br>
설명 : <%=list.get(i).getExplanation() %><br>
가격 : <%=list.get(i).getPrice() %><br>
<hr>
<%} %>
<a href="index.html">메인으로</a>
</body>
</html>
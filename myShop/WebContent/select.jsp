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
<%	String id = request.getParameter("id");
	ProductDAO dao = new ProductDAO();
	ProductDTO dto = dao.selectProduct(id);
	if(dto==null){
%>
입력하신 아이디에 해당하는 상품정보가 없습니다.
<%}else{ %>
아이디 : <%=dto.getId() %><br>
제목 : <%=dto.getTitle() %><br>
설명 : <%=dto.getExplanation() %><br>
가격 : <%=dto.getPrice() %><br>
<%} %>
<a href="index.html">메인으로</a>
</body>
</html>
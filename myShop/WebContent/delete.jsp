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
// 	입력 받은 아이디가 존재하면 삭제 진행 없을 시 없다는 문구 출력
	if(dao.selectProduct(id)!=null){
	dao.deleteProduct(id);
%>
삭제 되었습니다.
<%}else{ %>
	입력하신 아이디에 해당하는 상품 정보가 없습니다.
<%} %>
<br>
<a href="index.html">메인으로</a>
</body>
</html>
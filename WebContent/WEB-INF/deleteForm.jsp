<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.javaex.dao.GuestBookDao" %>
<%@page import="com.javaex.vo.GuestBookVo" %>
<%@page import="java.util.List" %>       
    
	<%int no = Integer.parseInt(request.getParameter("no")); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/guestbook2/gbc" method="post">
				<input type="hidden" name="action" value="delete">
		비밀번호 <input type="password" name="password" value="">
				<input type="hidden" name="no" value=<%=no %>>
		<button type="submit">확인</button>
		

	</form>
	
	<a href="http://localhost:8088/guestbook2/gbc?action=addList">메인으로 돌아가기</a>
	
	
</body>
</html>
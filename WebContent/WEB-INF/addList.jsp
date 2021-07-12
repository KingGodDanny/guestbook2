<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.javaex.dao.GuestBookDao" %>
<%@page import="com.javaex.vo.GuestBookVo" %>
<%@page import="java.util.List" %>
    
<%
	GuestBookDao guestBookDao = new GuestBookDao(); //게스트리스트를 불러오기위한 공간열기
	List<GuestBookVo> guestList = guestBookDao.getGuestList(); //게스트리스트를 배열에 담기

%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/guestbook2/gbc" method="post">
	<input type="hidden" name="action" value="add">  <!-- 컨트롤러에 action="add"가 날아가기위함! -->
	<table border="1">
		<colgroup>
			<col style="width: 40px;">
			<col style="width: 120px;">
			<col style="width: 80px;">
			<col style="width: 120px;">
		</colgroup>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value=""></td>
			<td>비밀번호</td>
			<td><input type="password" name="password" value=""></td>
		</tr>
		
		<tr>
			<td colspan="4" height="150" ><textarea name ="content"></textarea></td>
		</tr>
		<tr>
			<td colspan = "4"><button type ="submit">확인</button></td>
		</tr>
	</table>
	
	</form>
	
	
	<%
		for(int i=0; i<guestList.size(); i++) {
	%>
		<br>
		<table border="1">
			<colgroup>
				<col style="width: 30px;">
				<col style="width: 90px;">
				<col style="width: 300px;">
				<col style="width: 60px;">
			</colgroup>
			<tr>
				<td><%=guestList.get(i).getNo() %></td>
				<td><%=guestList.get(i).getName() %></td>
				<td><%=guestList.get(i).getRegdate() %></td>
				<td><a href="/guestbook2/gbc?action=dForm&no=<%=guestList.get(i).getNo() %>">삭제</a></td>
			</tr>
			<tr>
				<td colspan="4" height="60">첫번째 방명록내용<br><%=guestList.get(i).getContent() %></td>
			</tr>
		</table>
	
	<%
		}
	%>	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int res = (Integer)request.getAttribute("result");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>공지사항 등록하기</h2>
	<form action="/FireMoth/InsertNotice.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>관리자 아이디</td>
				<td><input type="hidden" name="admin_id" value="admin"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="notice_title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea class="content" rows="10" cols="50" name="notice_content"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="공지사항 등록">
		<input type="reset" value="취소">
		
	</form>
	
</body>
</html>
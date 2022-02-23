<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<body>
	<h2>공지사항 삭제하기</h2>
	<form action="/FireMoth/DeleteNotice.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>삭제할 글번호</td>
				<td><input type="text" name="notice_no"></td>
			</tr>
		</table>
		<input type="submit" value="공지사항 삭제">
	</form>
</body>
</body>
</html>
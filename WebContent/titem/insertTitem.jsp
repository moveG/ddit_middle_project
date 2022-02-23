<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String host_no = (String)request.getAttribute("host_no");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>여행상품 등록</h2>
	
	<form action="/FireMoth/InsertTitem.do" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>호스트 아이디: </td>
			<td><input type="hidden" name="host_no" value="99" ></td>
		</tr>
		<tr>
			<td>이름: </td>
			<td><input type="text" name="titem_name"></td>
		</tr>
		<tr>
			<td>가격: </td>
			<td><input type="text" name="titem_price"></td>
		</tr>
		
		<tr>
			<td>테마구분: </td>
			<td><input type="hidden" name="titem_div" value="여행"></td>
		</tr>
		<tr>
			<td>소개: </td>
			<td><input type="text" name="titem_info"></td>
		</tr>
<<<<<<< .mine
		<tr>
||||||| .r191658
		<!-- <tr>
=======
		 
		 <tr>
>>>>>>> .r191761
			<td>첨부파일</td>
			<td><input type="file" name="atch_file_id" multiple></td>
<<<<<<< .mine
		</tr>
||||||| .r191658
		</tr> -->
=======
		</tr> 
>>>>>>> .r191761
	
		<tr>
			<td>수용인원: </td>
			<td><input type="text" name="titem_people"></td>
		</tr>
	

	
	</table>
	
	<input type="submit" value="숙소 등록">
  </form>
	



</body>
</html>
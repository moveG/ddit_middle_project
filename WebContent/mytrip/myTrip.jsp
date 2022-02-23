<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>


<style>
#myTripForm{
	border : 2px solid black;
	width : 100%;
	text-align: cent;  
}
.myTrip{
	border : 2px solid black;
	width : 98%;
	height: 600px;
	magin : 0 auto;
	text-align: left;
}
.btn-success{
	margin-top: 10px;
	margin-left: 10px;
	
}

</style>

<script>
$(function(){
	// 나만의 여행지 등록 버튼 클릭 -> 나만의 여행지 작성 페이지로 이동
	$('.btn').on('click', function(){
		
		location.replace('myTripInsert.jsp');
		
		
	})	
	
})	

</script>

</head>
<body>
	<div id="myTripForm">
		<center>
		<div class="myTrip">
			
		<button type="button" name="tripinsert" class="btn btn-success btn-sm">나만의 여행지 등록</button>
		</div>
		</center>
	</div>
</body>
</html>
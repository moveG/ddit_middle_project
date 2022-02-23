<%@page import="kr.or.ddit.search.vo.SearchVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<SearchVO> list = (List<SearchVO>)request.getAttribute("searchList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
</script>
<style>
.dis_container{
	display: flex;
	flex-direction: column;
	width: 700px; /* 100%; */
	padding: 7px;
	border: 2px solide lightgray;
	border-radius: 5px;
}
.div_stay{
	width: 95%;
	height: 200px;
	display: flex;
	align-items: stretch;
	padding: 5px;
	border: 2px solide lightgray;
	border-radius: 5px;
}
.div_stay_img{
	width: 250px;
	height: 190x;
	/* margin-bottom: 10px; */
}
.stay_img{
	width: 100%;
	height: 100%;
}
.stay_info{
	width: 95%;
}
</style>




<title>숙소 검색</title>
</head>
<body>
<%
	for(int i = 0; i < list.size(); i++){
		if(i >= 0){
%>
	<div class="div_container">
		<div class="div_stay">
			<div class="div_stay_img">
				<img alt="stay_img" href="#" src="/FireMoth/img/nav_img3.jpg" class="stay_img"/>
			</div>
			<div class="stay_info">
				<h4 class="stay_name"><%= list.get(i).getStay_name() %></h4>
				<p class="peaple_num"><%= list.get(i).getStay_pnum() %></p>
			</div>
		</div>
	</div>


<%			
		}
		
	}
%>
</body>
</html>
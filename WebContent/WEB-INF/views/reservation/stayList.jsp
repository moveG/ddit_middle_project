<%@page import="kr.or.ddit.reser.vo.StayVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<StayVO> list = (List<StayVO>) request.getAttribute("stayList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="../js/jquery-3.6.0.min.js"></script>
		<title>숙소 리스트</title>
		<style>
			#d1{
				display : inline-block;
				border : 1px solid black;
				margin : 5px;
				width : 50%;
			}
			#d2{
				border : 1px solid black;
				margin : 5px;
			}
			#d3{
				border : 1px solid blue;
				margin : 5px;
				display : inline-block;
				width : 20%;
				height : 85%;
			}
			#d4{
				border : 1px solid blue;
				margin : 5px;
				display : inline-block;
				width : 75%;
				height : 85%;
			}
			.d2:hover{
				background : orange;
				color : white;
			}
			.d2:link, .d2:visited, .d2:active{
				color : black;
			}
			a{
				width : 90%;
				height : 90%;
			}
		</style>
	</head>
	<body>
		<div id="d1">
<%
	int staySize = list.size();
	if(staySize > 0){
		for(int i = 0; i < staySize; i++){
%>
			<div id="d2" class="d2">
				<a href="StayDetail.do?stay_id=<%= list.get(i).getStay_id() %>&atch_file_id=<%= list.get(i).getAtch_file_id() %>">
				<div id="d3">
				zzz
					
				</div>
				<div id="d4">
					<p>숙소명 : <%= list.get(i).getStay_name() %></p>
					<p>숙소정보 : <%= list.get(i).getStay_info() %></p>
					<p>한계인원 : <%= list.get(i).getStay_pnum() %></p>
					<p>가격 : <%= list.get(i).getStay_pnum() %></p>
					<p>주소 : <%= list.get(i).getStay_add() %></p>
				</div>
				</a>
			</div>
<%			
		}
	}
%>			
		</div>
	</body>
</html>
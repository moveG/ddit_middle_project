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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/FireMoth/css/only_headerpage.css">
  <link rel="stylesheet" href="/FireMoth/css/header.css">
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
  
<script>
</script>
<title>숙소 검색 페이지</title>
</head>
<body>
	<div class="container">
	<div id="header">
		<div id="header_container">
		
			<div class="inr" id="inr1">
				<div class="mem">
					<a href="/FireMoth/memberJoin/memberLogin.jsp" class="loginbox">로그인</a>
					<a href="/FireMoth/memberJoin/member_choice.jsp" class="loginbox">회원가입</a>
				</div>
			</div>
			
			<div class="inr" id="inr2">
				<div id="page_name_box">
					<img alt="로고" id="logoimg" src="/FireMoth/img/travel.png">
					<a id="page_name" href="#">Hot Air Balloon</a>
				</div>
				<div class="serchform">
					<form name="search" action="#" method="get" autocomplete="on">
						<input type="text" name="search" placeholder="Search.." class="search">
					
					</form>


					<div class="private_menu">
						<a href="#" class="private_menu_icon" id="menu_icon1">
							<img alt="마이메뉴" src="/FireMoth/img/mymenu_icon.png" class="private_menu_icon_img"/>
							<p>마이메뉴</p>
						</a>
						<a href="/FireMoth/GuestReserList.do" class="private_menu_icon" id="menu_icon2">
							<img alt="예약내역" src="/FireMoth/img/document_icon.png" class="private_menu_icon_img"/>
							<p>예약내역</p>
						</a>
						<a href="/FireMoth/CartList.do" class="private_menu_icon" id="menu_icon3">
							<img alt="찜리스트" src="/FireMoth/img/shopping_cart_icon.png" class="private_menu_icon_img"/>
							<p>장바구니</p>
						</a>
					</div>
				</div>
				
			</div>	
			
			
			<div class="inr" id="inr3">
					<div id="menu_bar">
					<div id="menudrop">
						<ul>
							<li><a href="/FireMoth/reservation/StayList.do" class="category">숙소</a>
								<ul>
									<li><a href="/FireMoth/SearchStay.do?search=서울">서울</a></li>
									<li><a href="/FireMoth/SearchStay.do?search=강원">강원도</a></li>
									<li><a href="/FireMoth/SearchStay.do?search=충북">충청도</a></li>
									<li><a href="/FireMoth/SearchStay.do?search=전북">전라도</a></li>
									<li><a href="/FireMoth/SearchStay.do?search=경북">경상도</a></li>
									<li><a href="/FireMoth/SearchStay.do?search=제주특별">제주도</a></li>

								</ul>
							</li>
							<li><a href="/FireMoth/traffic/Air.jsp" class="category">교통편</a>
								<ul>
									<li><a href="/FireMoth/traffic/Bus.jsp">버스</a></li>
									<li><a href="/FireMoth/traffic/Train.jsp">기차</a></li>
									<li><a href="/FireMoth/traffic/Air.jsp">항공</a></li>
								</ul>
							</li>
							<li><a href="/FireMoth/MyTripList.do" class="category">나만의 여행지</a></li>
							<li><a href="/FireMoth/EventSelect.do" class="category">혜택/이벤트</a></li>
							<li><a href="/FireMoth/SelectAllNotice.do" class="category">공지사항</a></li>
							<li><a href="/FireMoth/SelectAllFaq.do" class="category">고객센터</a>
								<ul>
									<li><a href="/FireMoth/SelectAllFaq.do">자주 묻는 질문</a></li>
									<li><a href="/FireMoth/SelectAllFaq.do">문의하기</a></li>
								</ul>
							</li>
						</ul>
					</div>	
					</div>
			</div>
		</div>
	</div>
	
	<nav id="nav">
		<div id="content_box">
			<div id="content_box_container">
				
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
				
				
				
				
				
			</div>				
		</div>
	</nav>
	<footer id="foot">
			
	</footer>
	
</div>
</body>
</html>
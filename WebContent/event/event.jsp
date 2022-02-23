<%@page import="kr.or.ddit.event.vo.EventVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


 <%
		List<EventVO> list = (List<EventVO>)request.getAttribute("eventList");
 %>




<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/FireMoth/css/aside.css">
  <link rel="stylesheet" href="/FireMoth/css/header.css">
  <link rel="stylesheet" href="/FireMoth/event/event.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>혜택/이벤트</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script>
	$(function(){

	
		//로그인
		$.ajax({
			url : '/FireMoth/LoginCheck.do',
			type : 'post',
			dataType : 'json',
			success : function(res){
				/*  alert(res.division); */
				if(res.division == "guest" || res.division == "host" ){
					$('.login').hide();
					code = '<p id="logout">로그아웃</a>';
					$('.mem').html(code);
				}
			},
			error : function(asd){
				alert("상태 : " + asd.status);
			}
		})

		// 로그아웃
		$(document).on('click', '#logout', function(){

			logdata = $('#logout').text();

			$.ajax({
				url : '/FireMoth/LogoutCheck.do',
				data : {"logdata" : logdata},
				dataType : 'json',
				type : 'get',
				success : function(res){
					alert(res.flag)
					$('.mem p').remove();
					location.replace('/FireMoth/memberJoin/memberLogin.jsp');
				},
				error : function(asd){
					alert("상태 : " + asd.status);
				}
			})
		})




		//마이페이지 게스트/호스트 구분
		$('#menu_icon1').on('click', function(){

			$.ajax({
				url : '/FireMoth/Mypage.do',
				type : 'post',
				dataType : 'json',
				success : function(res){
					/* alert(res.memChk); */
					if(res.memChk == 1){
						location.href = "/FireMoth/ListStay.do"
					}else if(res.memChk == 0){
						location.href = "/FireMoth/GuestReserList.do"
					}else{
						alert("회원가입 후 이용가능합니다.")
					}
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				}
			})

		})
	

		
		/* $.ajax({
		
			url :'/FireMoth/EventSelect.do',
			type : 'post',
			success : function(res){
			
				code = "";
				console.log(res.admin_id);
				$.each(res, function(i, v){
				
					code+="<div id='event'>";			
					code+="<h2>진행중인 이벤트<h2><br>";			
					code+="<div id='eventImg'>";			
					code+="<img src='/FireMoth/img/temp.png' alt='이미지없음'>";
					code+="<div id='eventContent'>";
					code+= v.event_title+"<br>";
					code+="</div>";
					code+="</div>";
					code+="</div>"; 
					
				
				})
				
				
				 $('#content_box_container').html(code); 
				
			},
			error : function(a){
				alert("상태 : "+a.status);
			},
			dataType : 'json'
		
		
		})	 */ 
			
})

</script>
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
						<img alt="로고" id="logoimg" src="/FireMoth/img/logo.PNG">
						<a id="page_name" href="/FireMoth/jsp/index.jsp">Come&Stay</a>
					</div>
					<div class="serchform">
						<form name="search" action="/FireMoth/SearchStay.do" method="get" autocomplete="on">
							<input type="text" name="search" placeholder="Search.." class="search">
							<input id="search_btnbtn" type="submit" value="">
							
							<div class="private_menu">
							<a href="#" class="private_menu_icon" id="menu_icon1">
								<img alt="마이메뉴" src="/FireMoth/img/mymenu_icon.png" class="private_menu_icon_img"/>
								<p>마이메뉴</p>
							</a>
							<a href="#" class="private_menu_icon" id="menu_icon2">
								<img alt="예약내역" src="/FireMoth/img/document_icon.png" class="private_menu_icon_img"/>
								<p>예약내역</p>
							</a>
							<a href="/FireMoth/CartList.do" class="private_menu_icon" id="menu_icon3">
								<img alt="찜리스트" src="/FireMoth/img/shopping_cart_icon.png" class="private_menu_icon_img"/>
								<p>찜리스트</p>
							</a>
						
							</div>
						</form>
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
			<div id="nav_container">
				<div id="aside">
					<div id="aside_container">
						<div class="aside_menu" id="aside_menu1"><a href="#" class="aside_menu_a">이벤트&혜택</a></div>
					</div>
				</div>
				
				<div id="content_box">
					<div id="content_box_container">
				
					
			<% 
			
			
			 	for(int i=0; i<list.size();i++){
			 		
			 		if(list.size()>=0){
			 	
			
			%>	
			
				<div calss="event_box" onclick="location='detailEvent.do?event_no=<%=list.get(i).getEvent_no()%>'">
				    <div class='event'>
			<%
					if(i < 4){
			%>
						<h3 class="e_h3">진행중인 이벤트</h3>
			<%
					}else{
			%>
						<h3 class="e_h3">종료된 이벤트</h3>
			<%
					}
			%>
						<div id='eventImg'>	
							<img id="event_img<%=i%>" class="event_img" src='/FireMoth/img/event_img<%=i+1%>.jpg' alt='이미지없음'>
						</div>
						<div id='eventContent'>
							<p class="p"><%=list.get(i).getEvent_title() %></p>
						</div>
					</div>
				</div>	
				
			<%
			 	}else{
			%>
						
				<div><h2>진행중인 이벤트가 존재하지 않습니다</h2></div>		
			<%
			
			 	}
			 	}
			%>			
						
					</div>				
				</div>
			</div>
		</nav>
		<footer id="foot">
		<div id="footer_container">
			<div id="footer_msg">
				<p>Come&Stay</p>
				<p>Tel. 042-555-666</p>
				<p>※Come&Stay는 통신판매중개자로서 통신판매의 당사자가 아니며 해당상품의 거래정보 및 거래등에 대해 책임을 지지 않습니다.</p>
				<p></p>
				<p></p>
				<p></p>
			</div>
		</div>
	</footer>
	
	</div>	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/FireMoth/css/aside.css">
  <link rel="stylesheet" href="/FireMoth/css/header.css">
  <link rel="stylesheet" href="/FireMoth/traffic/bus.css">
<title>교통편-기차</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	/* $(function(){
	
		$.ajax({
			url : '/FireMoth/LoginCheck.do',
			type : 'post',
			dataType : 'json',
			success : function(res){
				 alert(res.division);
				if(res.division == "guest" || res.division == "host" ){
					$('.login').hide();
					code = '<a href="/FireMoth/memberJoin/memberLogin.jsp"' 
					code += 'onclick="session();" class="loginbox logout">로그아웃</a>';
					$('.mem').html(code);
				}
			},
			error : function(asd){
				alert("상태 : " + asd.status);
			}
		
		
		})
}) */
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
							<a href="/FireMoth/ListStay.do" class="private_menu_icon" id="menu_icon1">
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
								<li><a href="#" class="category">숙소</a>
									<ul>
										<li><a href="#">서울</a></li>
										<li><a href="#">강원도</a></li>
										<li><a href="#">충청도</a></li>
										<li><a href="#">전라도</a></li>
										<li><a href="#">경상도</a></li>
										<li><a href="#">제주도</a></li>
										
									</ul>
								</li>
								<li><a href="#" class="category">교통편</a>
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
										<li><a href="#">문의하기</a></li>
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
						<div class="aside_menu" id="aside_menu1"><a href="#" class="aside_menu_a">버스</a></div>
						<div class="aside_menu" id="aside_menu2"><a href="#" class="aside_menu_a">기차</a></div>
						<div class="aside_menu" id="aside_menu3"><a href="#" class="aside_menu_a">항공</a></div>
					</div>
				</div>
				
				<div id="content_box">
					<div id="content_box_container">
						<h1 class="big_title_h1">기차</h1>
						<div class="t_container">
							<div class="t_box">
								<img alt="ktx" src="/FireMoth/img/train1.png" class="t_img">
								<h1 class="t_title_h1">KTX 예약사이트</h1>
								<button onclick="location='http://www.letskorail.com/ebizprd/EbizPrdTicketpr21100W_pr21110.do'" class="base_btn">바로가기</button>
							</div>
							<div class="t_box">
								<img alt="str" src="/FireMoth/img/train2.png" class="t_img">
								<h1 class="t_title_h1">STR 예약사이트</h1>
								<button onclick="location='https://etk.srail.kr/main.do'" class="base_btn">바로가기</button>
							</div>
						</div>
						
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
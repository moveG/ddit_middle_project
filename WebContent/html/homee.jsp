<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
 
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/FireMoth/css/index.css">
  <link rel="stylesheet" href="/FireMoth/css/header.css">
<script>
</script>
<title>메인페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container">
	<div id="header">
		<div id="header_container">
		
			<div class="inr" id="inr1">
				<div class="mem">
					<a href="#민영" class="loginbox">로그인</a>
					<a href="#민영" class="loginbox">회원가입</a>
				</div>
			</div>
			
			<div class="inr" id="inr2">
				<div id="page_name_box">
					<img alt="로고" id="logoimg" src="/FireMoth/img/logo.PNG">
					<a id="page_name" href="/FireMoth/html/index.html">Come&Stay</a>
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
						
						
						
						<a href="#동근" class="private_menu_icon" id="menu_icon2">
							<img alt="예약내역" src="/FireMoth/img/document_icon.png" class="private_menu_icon_img"/>
							<p>예약내역</p>
						</a>
						<a href="/FireMoth/CartList.do" class="private_menu_icon" id="menu_icon3">
							<img alt="찜리스트" src="/FireMoth/img/shopping_cart_icon.png" class="private_menu_icon_img"/>
							<p>찜</p>
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
									<li><a href="/FireMoth/Se.do">서울</a></li>
									<li><a href="/FireMoth/Ga.do">강원도</a></li>
									<li><a href="/FireMoth/Ch.do">충청도</a></li>
									<li><a href="/FireMoth/Z.do">전라도</a></li>
									<li><a href="/FireMoth/Gy.do">경상도</a></li>
									<li><a href="/FireMoth/Je.do">제주도</a></li>
									
								</ul>
							</li>
							<li><a href="#" class="category">교통편</a>
								<ul>
									<li><a href="/FireMoth/Bus.do">버스</a></li>
									<li><a href="/FireMoth/Train.do">기차</a></li>
									<li><a href="/FireMoth/Air.do">항공</a></li>
								</ul>
							</li>
							<li><a href="/FireMoth/MyTripInsert.do" class="category">나만의 여행지</a>
								<ul>
									<li><a href="#">나만의 여행지</a></li>
									<li><a href="#">추천 여행지</a></li>
									<li><a href="#">나만의 여행지 등록</a></li>
								</ul>
							</li>
							<li><a href="/FireMoth/Event.do" class="category">혜택/이벤트</a></li>
							<li><a href="/FireMoth/SelectAllNotice.do" class="category">공지사항</a></li>
							<li><a href="#혜윤" class="category">고객센터</a>
								<ul>
									<li><a href="#혜윤">자주 묻는 질문</a></li>
									<li><a href="#혜윤">문의하기</a></li>
								</ul>
							</li>
						</ul>
					</div>	
					</div>
			</div>
		</div>
	</div>
	
	<nav id="nav">
		<div class="nav_container">
			<div class="rec_stay">
				<h1>어디에서나, 여행은 살아보는거야!</h1>
				<div class="nav_img">
					<div class="nav_img_div">
						<a href="#동근" class="nav_img_a">
							<img alt="stay1" href="#혜윤" src="/FireMoth/img/nav_img1.jpg" class="nav_imgs"/>
							<h3>자연생활</h3>
						</a>
					</div>
					<div class="nav_img_div">
						<a href="#동근" class="nav_img_a">
							<img alt="stay2" href="#혜윤" src="/FireMoth/img/nav_img2.jpg" class="nav_imgs"/>
							<h3>독특한 공간</h3>
						</a>
					</div>
					<div class="nav_img_div">
						<a href="#동근" class="nav_img_a">
							<img alt="stay3" href="#혜윤" src="/FireMoth/img/nav_img3.jpg" class="nav_imgs"/>
							<h3>집전체</h3>
						</a>
					</div>
					<div class="nav_img_div">
						<a href="#동근" class="nav_img_a">
							<img alt="stay4" href="#혜윤" src="/FireMoth/img/nav_img4.jpg" class="nav_imgs"/>
							<h3>반려동물 동반 가능</h3>
						</a>
					</div>
				</div>
			</div>
			
			<div class="rec_hosting">
				<div class="rec_hosting_img_div">
					<a href="#혜윤">
						<img alt="hosting_rec" href="#혜윤" src="/FireMoth/img/hosting_start.PNG" class="rec_hosting_img"/>
					</a>
				</div>
			</div>
		</div>	
	</nav>
	<footer id="foot">
		<div id="footer_container">
			<div id="footer_msg">
				<p>Hot Air Balloon</p>
				<p>Tel. 042-555-666</p>
				<p>※Hot Air Balloon은 통신판매중개자로서 통신판매의 당사자가 아니며 해당상품의 거래정보 및 거래등에 대해 책임을 지지 않습니다.</p>
				<p></p>
				<p></p>
				<p></p>
			</div>
		</div>
	</footer>
	
</div>
</body>
</html>
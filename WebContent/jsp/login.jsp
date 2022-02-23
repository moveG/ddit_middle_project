<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/login.css" type="text/css" rel="stylesheet">
<link href="../css/main.css" type="text/css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>로그인 페이지</title>
</head>
<body>
<div id="all">
		<header id="head">
			<a id="title" href="#">
				<img src="../img/travel.png" id="logo">
				<h1>Hot Air Balloon</h1>
			</a>
			
			<form name="search" action="#" method="get" autocomplete="on">
				<input type="text" name="search" placeholder="Search.." class="search">
			</form>
			
			<div id="login">
				<a href="#">로그인</a>
				<a href="#">회원가입</a>
			</div>
			
			<div id="icons">
				<a href="#" class="mymenu">
					<img alt="마이메뉴" src="../img/mymenu_icon.png"/>
					<p>마이메뉴</p>
				</a>
				<a href="#" class="reservation">
					<img alt="예약내역" src="../img/document_icon.png"/>
					<p>예약내역</p>
				</a>
				<a href="#" class="basket">
					<img alt="장바구니" src="../img/shopping_cart_icon.png"/>
					<p>장바구니</p>
				</a>
			</div>
			
			<div id="menu_bar">
				<ul>
					<li><a href="#">전체메뉴</a></li>
					<li><a href="#">숙소</a></li>
					<li><a href="#">여행상품</a></li>
					<li><a href="#">교통편</a></li>
					<li><a href="#">나만의 여행지</a></li>
					<li><a href="#">혜택/이벤트</a></li>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>
			
		</header>
		
		<nav id="nav">
			<div class="container">
				 <form id="login-form" class="form" action="" method="post">
				    <div class="text-box">
                       <h3 class="text-center text-info">로그인</h3>
                       <div class="form-group">
                           <label for="username" class="text-info">ID</label><br>
                           <input type="text" name="username" id="username" class="form-control">
                       </div>
                       <div class="form-group">
                           <label for="password" class="text-info">Password:</label><br>
                           <input type="text" name="password" id="password" class="form-control">
                       </div>
                       <div id="register-link" class="text-right">
                           <a href="#" class="text-info">비회원 살펴보기</a>
                       </div>
                       <div id="register-link" class="text-right">
                           <a href="#" class="text-info">회원가입</a>
                       </div>
                       <div id="register-link" class="text-right">
                           <a href="#" class="text-info">ID/Password 찾기</a>
                       </div>
                     </div>
                   </form>
			</div>
		</nav>
		<footer id="foot">
			
		</footer>
	</div>
</body>
</html>
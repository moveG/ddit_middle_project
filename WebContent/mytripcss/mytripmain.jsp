<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/FireMoth/css/aside.css">
  <link rel="stylesheet" href="/FireMoth/css/header.css">
  <link rel="stylesheet" href="/FireMoth/mytripcss/mytripmain.css">
  <link rel="stylesheet" href="/FireMoth/css/button.css">
<title>나만의 여행지</title>
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
							<a href="/FireMoth/GuestReserList.do" class="private_menu_icon" id="menu_icon2">
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
						<div class="aside_menu" id="aside_menu1"><a href="#" class="aside_menu_a">나만의 여행지</a></div>
						<div class="aside_menu" id="aside_menu2"><a href="#" class="aside_menu_a">추천 여행지</a></div>
						<div class="aside_menu" id="aside_menu3"><a href="/FireMoth/MyTripStayCheck.do" class="aside_menu_a">나만의 여행지 등록</a></div>
					</div>
				</div>
				
				<div id="content_box">
					<div id="content_box_container">
					
						<div id="mytrip_container">
							<h1 id="mytrip_h1">나만의 여행지</h1>
							<br>
							<p class="p mytrip_info_p">나만의 여행지를 소개해주세요!😊</p>
							<p class="p mytrip_info_p"> 소개된 여행지 중 마음에 드는 여행지의 숙소는 '따라가기'를 통해 예약할수도 있어요👍</p>
							<br>
							
							<div class="mytrip_content_box">
							
								<div class="id_line">
									<div class="profile_img_div">
										<img alt="mytrip_profile" src="/FireMoth/img/nav_img4.jpg" class="profile_img"/>
									</div>
									<div class="writer_id">
										<p class="p">작성자</p>
									</div>
								</div>
								
								<div class="img_line">
									<img alt="mytrip_img" src="/FireMoth/img/mytrip_img.jpg" class="mytrip_img"/>
								</div>
								
								<div class="rec_line">
									<img alt="rec_img" src="/FireMoth/img/heart_img.PNG" class="rec_img"/>
									<p class="p rec_num">추천수</p>
									<div class="rec_button_div">
										<button onclick="location='notice/insertNotice.jsp'" class="base_btn">추천</button>
										<button onclick="location='notice/updateNotice.jsp'" class="base_btn">따라가기</button>
									</div>
								</div>
								
								<div class="content_line">
									<p class="p">#제주도 #우도 #바다 #산책<br><br>섬 전체가 하나의 거대한 관광자원인 제주도. 에메랄드빛 물빛이 인상적인 협재 해수욕장은
												 제주 대표 여행지며, 파도가 넘보는 주상절리와 바다 위 산책로인 용머리 해안은 제주에서만 볼 수 있는
												  천혜의 자연경관으로 손꼽힌다. 드라마 촬영지로 알려진 섭지코스는 꾸준한 사랑을 받고 있으며
												   한라봉과 흑돼지, 은갈치 등은 제주를 대표하는 음식이다.</p>
								</div>
								
								<div class="coment_write_line">
									<div class="c_profile_img_div">
										<img alt="mytrip_profile" src="/FireMoth/img/nav_img4.jpg" class="c_profile_img"/>
									</div>
									<input type="text" name="comment_write" placeholder="댓글을 입력해주세요." class="comment_input">
									<button type="submit" class="comment_btn">등록</button>
									<button type="reset" class="comment_btn">취소</button>
								</div>
								
								<div class="coment_show_line">
								
								</div>
						
							</div>
							
							
							
							
							
							<!-- 여기서 부터 -->
							
							<div class="mytrip_content_box">
							
								<div class="id_line">
									<div class="profile_img_div">
										<img alt="mytrip_profile" src="/FireMoth/img/nav_img3.jpg" class="profile_img"/>
									</div>
									<div class="writer_id">
										<p class="p">작성자</p>
									</div>
								</div>
								
								<div class="img_line">
									<img alt="mytrip_img" src="/FireMoth/img/mytrip_img2.jpg" class="mytrip_img"/>
								</div>
								
								<div class="rec_line">
									<img alt="rec_img" src="/FireMoth/img/heart_img.PNG" class="rec_img"/>
									<p class="p rec_num">추천수</p>
									<div class="rec_button_div">
										<button onclick="location='notice/insertNotice.jsp'" class="base_btn">추천</button>
										<button onclick="location='notice/updateNotice.jsp'" class="base_btn">따라가기</button>
									</div>
								</div>
								
								<div class="content_line">
									<p class="p">#파리 #에펠탑<br><br>섬 전체가 하나의 거대한 관광자원인 제주도. 에메랄드빛 물빛이 인상적인 협재 해수욕장은
												 제주 대표 여행지며, 파도가 넘보는 주상절리와 바다 위 산책로인 용머리 해안은 제주에서만 볼 수 있는
												  천혜의 자연경관으로 손꼽힌다. 드라마 촬영지로 알려진 섭지코스는 꾸준한 사랑을 받고 있으며
												   한라봉과 흑돼지, 은갈치 등은 제주를 대표하는 음식이다.</p>
								</div>
								
								<div class="coment_write_line">
									<div class="c_profile_img_div">
										<img alt="mytrip_profile" src="/FireMoth/img/nav_img3.jpg" class="c_profile_img"/>
									</div>
									<input type="text" name="comment_write" placeholder="댓글을 입력해주세요." class="comment_input">
									<button type="submit" class="comment_btn">등록</button>
									<button type="reset" class="comment_btn">취소</button>
								</div>
								
								<div class="coment_show_line">
								
								</div>
						
							</div>
							
							<!-- 여기까지 지우기 -->
							
							
							
							
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
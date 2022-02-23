<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.cmm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.reser.vo.ReservationVO"%>
<%@page import="kr.or.ddit.reser.vo.StayVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%
 
 	StayVO vo = (StayVO)request.getAttribute("stayVO");
    ReservationVO revo = (ReservationVO)request.getAttribute("reserVO");
    List<AtchFileVO> atchfileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
 	int people = (Integer)request.getAttribute("people");
 
 %>
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/FireMoth/css/only_headerpage.css">
  <link rel="stylesheet" href="/FireMoth/css/header.css">
  <link rel="stylesheet" href="/FireMoth/css/button.css">
  <link rel="stylesheet" href="/FireMoth/pay/paymain.css">
<title>결제 페이지</title>
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
					<a id="page_name" href="/FireMoth/html/index2.html">Come&Stay</a>
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
		<div id="content_box">
			<div id="content_box_container">
				
				<div id="pay_container">
				
					<div id="reser_info_container">
						<h1>확인 및 결제</h1>
						<div id="reser_info_line1" class="reser_info_line">
							<h2>예약정보</h2>
							
							<h3>날짜</h3>
							<p class="p"><%=revo.getReser_ckin().substring(0,revo.getReser_ckin().indexOf(" ")+1) %></p> <p class="p">~</p> <p class="p"><%=revo.getReser_ckout().substring(0,revo.getReser_ckout().indexOf(" ")+1)%></p>
							
							<h3>인원</h3>
							<p class="p"><%=people %></p><p class="p">명</p>
						</div>
						<div id="reser_info_line2" class="reser_info_line">
							<h2>환불정책</h2>
							<p class="p">체크인 날짜로부터 5일 이전까지 무료로 예약을 취소하실 수 있습니다.</p><br>
							<p class="p">그 후에는 첫 1박 요금 및 서비스 수수료를 제외한 요금의 50%가 환불됩니다.</p>
						</div>
						<div id="reser_info_line3" class="reser_info_line">
							<br>
							<p class="p"><span>아래 버튼을 선택함으로써, 호스트가 설정한 숙소 이용규칙, 코로나19 방역 수칙 및 게스트 환불 정책에 동의합니다.<span></span></p>
							<br><br>
							<button onclick="" class="base_btn">결제</button>
						</div>
					</div>
					
					
					<div id="pay_info_container">
						<div id="pay_info_box">
							<div id="pay_info_box_line1" class="pay_info_box_line">
								<div id="pay_stay_img_box">
									
									<%
										for(int i=0; i<1; i++){
									if(atchfileList.get(i) != null){
									%>			
												<img id="pay_stay_img" src="<%= request.getContextPath() %>/filedownload.do?fileId=<%= atchfileList.get(i).getAtchFileId() %>&fileSn=<%= atchfileList.get(i).getFileSn() %>">
									<%			
										  }
										}	
									%>
									
									
									
									
								</div>
								<div>
									<p class="p"><span><%=vo.getStay_name()%></span></p>
								</div>
							</div>
							<div id="pay_info_box_line2" class="pay_info_box_line">
								<h3 id="aaa">가격</h3>
								<p id="bbb" class="p"><%=revo.getReser_price() %></p><p class="p">원</p>
							</div>
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
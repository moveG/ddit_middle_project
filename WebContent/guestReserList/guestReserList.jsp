<%@page import="kr.or.ddit.cmm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.gurlist.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReservationVO> list = (List<ReservationVO>) request.getAttribute("gurList");
	List<AtchFileVO> atchList = (List<AtchFileVO>) request.getAttribute("atchList");
	String mem_id = (String) request.getAttribute("mem_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="/FireMoth/css/aside.css">
		<link rel="stylesheet" href="/FireMoth/css/header.css">
		
		<title>마이페이지-게스트</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
		<style>
			#content_box #guestReserList{
				inline-block;
				float : left;
				width : 90%;
			}
			#content_box .grList{
				margin : 10px;
				padding: 10px;
				height : 250px;
				border-bottom : 1px solid rgb(128, 128, 128);
			}
			.grImage, .grInfo{
				display : inline-block;
				height : 80%;
				margin : 10px;
				padding: 10px;
			}
			.grImage{
				float : left;
				width : 30%;
			}
			.grInfo{
				float : right;
				width : 60%;
				line-height : 250%;
			}
			.grImage img{
				width : 100%;
				height : 100%;
				border-radius : 7%;
			}
			.lb{
				display : inline-block;
				width : 150px;
			}
		</style>
		
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
										<li><a href="/FireMoth/SearchStay.do?search=강원도">강원도</a></li>
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
							<div class="aside_menu" id="aside_menu1"><a href="/FireMoth/GuestReserList.do" class="aside_menu_a">예약 내역</a></div>
							<div class="aside_menu" id="aside_menu2"><a href="/FireMoth/CartList.do" class="aside_menu_a">찜리스트</a></div>
							<div class="aside_menu" id="aside_menu3"><a href="/FireMoth/GuestReserList.do" class="aside_menu_a">my상품평</a></div>
							<div class="aside_menu" id="aside_menu4"><a href="/FireMoth/MemberList.do" class="aside_menu_a">회원정보</a></div>
						</div>
					</div>
					
					<div id="content_box">
						<div id="guestReserList">
							<%
							int grListSize = list.size();
							
							if(grListSize > 0){
								for(int i = 0; i < grListSize; i++){
									if(mem_id == "비회원"){
							%>				
										<div id="noMember" class="grList" onclick="location.href='/FireMoth/memberJoin/memberLogin.jsp'">				
							<%				
									}else{
							%>
										<div class="grList" onclick="location.href='/FireMoth/reservation/StayDetail.do?stay_id=<%= list.get(i).getStay_id() %>&atch_file_id=<%= list.get(i).getAtch_file_id() %>'">
							<%
									}
							%>		
											<div class="grImage">
							<%
												if(atchList.get(i) != null){
							%>
													<img src="<%= request.getContextPath() %>/filedownload.do?fileId=<%= atchList.get(i).getAtchFileId() %>&fileSn=<%= atchList.get(i).getFileSn() %>">
							<%							
												}
							%>
											</div>
											<div class="grInfo">
												<div class="grInfoDetail"><label class="lb">숙소명</label><%= list.get(i).getStay_name() %></div>
												<div class="grInfoDetail"><label class="lb">예약일</label><%= list.get(i).getReser_date() %></div>
												<div class="grInfoDetail"><label class="lb">결제 금액</label><%= list.get(i).getReser_price() %> 원</div>
												<div class="grInfoDetail"><label class="lb">체크인 날짜</label><%= list.get(i).getReser_ckin() %></div>
												<div class="grInfoDetail"><label class="lb">체크아웃 날짜</label><%= list.get(i).getReser_ckout() %></div>
											</div>
										</div>	
							<%			
								}
							}else{
							%>	
										<div class="grList">
											예약정보가 없습니다.
										</div>
							<%
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
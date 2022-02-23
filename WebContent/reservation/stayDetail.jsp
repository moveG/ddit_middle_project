<%@page import="kr.or.ddit.reser.vo.ReservationVO"%>
<%@page import="kr.or.ddit.reser.vo.StayVO"%>
<%@page import="kr.or.ddit.reser.vo.CoVO"%>
<%@page import="kr.or.ddit.cmm.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<AtchFileVO> atchList = (List<AtchFileVO>) request.getAttribute("atchList");
	ReservationVO rvo = (ReservationVO) request.getAttribute("rvo3");
	String stay_id = (String) request.getAttribute("stay_id");
	String mem_id = (String) request.getAttribute("mem_id");
	CoVO vo = (CoVO) request.getAttribute("coList"); 
	StayVO svo = (StayVO) request.getAttribute("stayDetail");
	String host_id = (String) request.getAttribute("host_id");
	int cart_no = (Integer) request.getAttribute("cartNo");
	int rbutton = (Integer) request.getAttribute("rbutton");
	
	//카트번호 안나옴
	boolean flag = true;
	
	if(rvo == null){
		flag = false;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel='stylesheet' href='/FireMoth/css/main.min.css'>
		<script src='/FireMoth/js/main.min.js'></script>
		<script src='/FireMoth/js/locales-all.js'></script>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="/FireMoth/js/jquery.serializejson.min.js"></script>
		
		<script src="/FireMoth/js/reservation.js"></script>
		<script src="/FireMoth/js/review.js"></script>
		
		<link rel="stylesheet" href="/FireMoth/css/aside.css">
		<link rel="stylesheet" href="/FireMoth/css/header.css">
  		
  		<title>숙소 상세정보</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
		<style>

		</style>
		<script>
			document.addEventListener('DOMContentLoaded', function() {
				var calendarEl = document.getElementById('calendar');
				var calendar = new FullCalendar.Calendar(calendarEl, {
					initialView : 'dayGridMonth',
					includeScheduleEnd : true,
					eventSources : [{
						events: function(info, successCallback, failureCallback) {
							$.ajax({
								url : '/FireMoth/reservation/ReserList.do',
								type : 'get',
								data : {"stay_id" : stay_id},
								dataType : 'json',
								success : function(res){
									successCallback(res);
								}
							})
						}
					}],
					eventColor: 'lightseagreen',
					height : 'auto',
					stickyHeaderDates : false
				});
				calendar.render();
			});
		</script>
		<script>
			var adult = 0;
			var child = 0;
			var baby = 0;
			var price = 0;
			var people = 0;
			var pnum = <%= svo.getStay_pnum()%>;

			var stay_id = "<%= stay_id %>";
			var mem_id = "<%= mem_id %>";
			var rbutton = "<%= rbutton %>";
			var rnum = 0;
			currentTime = new Date();
			year = currentTime.getFullYear();
			month = ('0' + (currentTime.getMonth() + 1)).slice(-2);
			day = ('0' + currentTime.getDate()).slice(-2);
			currentTime = year + '-' + month  + '-' + day;
			var reser_no = 0;
			
			var sdd = 0;
		    var edd = 0;
		    var ar1 = 0;
		    var ar2 = 0;
		    var da1 = 0;
		    var da2 = 0;
		    var dif = 0;
		    var cDay = 0;
		    var cMonth = 0;
		    var cYear = 0;
			var reserPrice = 0;
			
			peopleCountServer = function(){
				if((adult + child + baby) > pnum){
					alert("최대 인원보다 많이 예약할 수 없습니다.");
					adult = 0;
					child = 0;
					baby = 0;
					$('#adult option:eq(0)').prop('selected', true);
					$('#child option:eq(0)').prop('selected', true);
					$('#baby option:eq(0)').prop('selected', true);
				}
			}
			
			dateCalServer = function(){
				sdd = $("#reser_ckin").val();
				edd = $("#reser_ckout").val();
				ar1 = sdd.split('-');
				ar2 = edd.split('-');
				da1 = new Date(ar1[0], ar1[1], ar1[2]);
				da2 = new Date(ar2[0], ar2[1], ar2[2]);
				dif = da2 - da1;
				cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
				
				if(sdd && edd){
				  	var reserPrice = (parseInt(dif/cDay) + 1) * (<%= svo.getStay_price()%>);
				 	
					$('#price1').html(reserPrice + " 원");
					$('#price2').val(reserPrice);
					if(sdd > edd){
						alert("예약이 불가능한 시간입니다.");
						$('#reserFrom')[0].reset();
						$('#price1').html("");
						}
					}
				};
			ckinServer = function(){
				if(sdd < currentTime){
					alert("예약이 불가능한 시간입니다.");
					$('#reserFrom')[0].reset();
					$('#price1').html("");
				}
			}
			ckoutServer = function(){
				if(edd < currentTime){
					alert("예약이 불가능한 시간입니다.");
					$('#reserFrom')[0].reset();
					$('#price1').html("");
				}
			}
			
			$(function(){
				//로그인 체크
				loginCheckServer();
				
				//마이페이지
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
				//호스트 체크
				//memberCheckServer();
				
				//예약 체크
				//reserCheckServer();
				
				//리뷰 게시판
				reviewListServer();
				
				//예약기간 표시
				//reserListServer();
				
				//편의시설 숨기기
				$('.coDetail0').hide();
				
				//예약박스
				<% 
				if(flag != false && rbutton > 0){
				%>
					$('#reserTable').hide();
					$('#reserOk').show();
					$('#jbutton').hide();
					$('#rbutton').hide();
					$('#cbutton').show();
					$('#ckbutton').hide();
					rnum = <%= rvo.getReser_no() %>;

				<%
					}else{
					%>
						$('#reserTable').show();
						$('#reserOk').hide();
						$('#rbutton').show();
						$('#jbutton').show();
						$('#ckbutton').show();
						$('#cbutton').hide();
					<% 
					}
				%>
				
				//인원수 계산
				$('#adult').change(function(){
					adult= parseInt($(this).val());
					peopleCountServer();
				})
				$('#child').change(function(){
					child= parseInt($(this).val());
					peopleCountServer();
				})
				$('#baby').change(function(){
					baby = parseInt($(this).val());
					peopleCountServer();
				})
						
				//날짜계산
				$('#reser_ckin').on('change', function(){
					dateCalServer();
					ckinServer();
				})
				$('#reser_ckout').on('change', function(){
					dateCalServer();
					ckoutServer();
				})
				
				//중복체크
				$('#ckbutton').on('click', function(){
					duplicateCheckServer();
				})
				
				//예약
				$('#rbutton').on('click', function(){
					if((adult + child + baby) == 0){
						alert("인원을 입력해주세요.");						
					}else{
						rdatas = $('#reserFrom').serialize();
						reserInsertServer();
						reviewListServer();
						/* reserCheckServer(); */
					}
				})
				
				//예약취소
				$('#cbutton').on('click', function(){
					reserCancelServer();
					/* reserCheckServer(); */
					reviewListServer();
				})
				
				//장바구니 - 석기현
				$('#jbutton').on('click', function(){
					cartInsertServer();
				})
			})
			
			//리뷰 답글 삭제 버튼
			$(document).on('click', '#replyDeleteButton', function(){
				review_no = $(this).attr("idx");
				replyDeleteButtonServer();
			})
			
			//리뷰 답글 수정 버튼
			$(document).on('click', '#replyUpdateButton', function(){
				review_no = $(this).attr("idx");
				replyUpdateButtonServer();
			})
			
			//리뷰 답글 완료 버튼
			$(document).on('click', '#replyOKButton', function(){
				review_no = $(this).attr("idx");
				rudatas = $('#replyUpdateForm').serialize();
				replyOKButtonServer();
			})
			
			//리뷰 답글 취소 버튼
			$(document).on('click', '#replyCancelButton', function(){
				reviewListServer();
			})
			
			//리뷰 삭제 버튼
			$(document).on('click', '#reviewDeleteButton', function(){
				review_no = $(this).attr("idx");
				reviewDeleteButtonServer();
			})
			
			//리뷰 수정 버튼
			$(document).on('click', '#reviewUpdateButton', function(){
				review_no = $(this).attr("idx");
				reviewUpdateButtonServer();
			})
			
			//리뷰 완료 버튼
			$(document).on('click', '#reviewOKButton', function(){
				review_no = $(this).attr("idx");
				rvdatas = $('#reviewUpdateForm').serialize();
				reviewOKButtonServer();
			})
			
			//리뷰 및 답글 취소 버튼
			$(document).on('click', '#reviewCancelButton', function(){
				reviewListServer();
			})
			
			//리뷰 답글 작성 버튼
			$(document).on('click', '#replyInsertButton', function(){
				review_no = $(this).attr("idx");
				replyInsertButtonServer();
			})
			
			//리뷰 답글 완료 버튼
			$(document).on('click', '#replyInsertOKButton', function(){
				review_no = $(this).attr("idx");
				ridatas = $('#replyInsertForm').serialize();
				replyInsertOKButtonServer();
			})
			
			//리뷰 작성 버튼
			$(document).on('click', '#reviewInsertButton', function(){
				reser_no = rnum;
				reviewInsertButtonServer();
			})
			
			//리뷰 완료 버튼
			$(document).on('click', '#reviewInsertOKButton', function(){
				reser_no = rnum;
				
				rvidatas = $('#reviewInsertForm').serialize();
				reviewInsertOKButtonServer();
				
			})
		</script>

		<style>
			.noAnswer{
				border-top : 1px solid gray;
			}
			#calbox{
				margin : 10px;
			}
			#calendar{
				height : auto;
				clear : both;
			}
			.fc-day-sun{
				background : rgb(255, 223, 223);
			}
			.fc-day-sat{
				background : rgb(223, 230, 255);
			}
			#content_box #stayTitle,
			#content_box #stayTitle div,
			#content_box #stayInfo #host,
			#content_box #stayInfo #stayIntroduce,
			#content_box #stayInfo #stayCo,
			#content_box #stayImage,
			#content_box #stayImage div, 
			#content_box #stayReservation,
			#content_box #stayReservation div, 
			#content_box #stayReview,
			#content_box #stayReview div{
				margin : 10px;
				padding : 10px;
				line-height : 300%;
			}
			#content_box #stayInfo{
				display : inline-block;
				float : left;
				width : 60%;
			}
			#content_box #stayReservation{
				display : inline-block;
				float : right;
				width : 32%;
				position : sticky;
				top : 20px;
			}
			#stayTitle, #stayImage, #host, #stayIntroduce, #stayCo, #reserList{
			    border-bottom: 1px solid gray;			
			}
			#stayReservation, #reserTable{
				border : 1px solid gray;
				border-radius : 4%;
			}
			#content_box #stayImage img{
				width : 334px;
				height : 300px;
				border-radius : 10%;
				margin : 5px;
			}
			#content_box #StayCo img{
				vertical-align : middle;
			}
			.btn{
				display : inline-block;
				width : 330px;
			    height: 38px;
			    margin-top : 10px;
			    border-radius: 4px;
			    border : 1px solid lightseagreen;
			    background : lightseagreen;
			    color : white;
			    cursor : pointer;
			}
			.btn2{
				display : inline-block;
				width : 100px;
			    height: 38px;
			    border-radius: 4px;
			    border : 1px solid lightseagreen;
			    background : lightseagreen;
			    color : white;
			    cursor : pointer;
			}
			#calendar button{
				border : 1px solid lightseagreen;
			    background : lightseagreen;
			}
			.reviewButton{
				text-align : right;
			}
			.lb{
				display : inline-block;
				width : 100px;
			}
			#price1{
				display : inline-block;
			}
			#stayReview{
				padding : 0;
				display : inline-block;
				float : left;
				width : 60%;
			}
			.reviewDetail, #reviewTitle{
				border-bottom : 1px solid gray;
			}
			.reviewDetail{
				margin : 1px;
				padding : 1px;
			}
			#stayReservation{
				background : white;
				text-align : center;
			}
			#replyDate, .reviewDate{
				text-align : right;
			}
			#reserTable{
				text-align : left;
			}
			.pnum{
				width : 143px;
			}
			#jbutton{
				margin-bottom : 10px;
			}
			#replyContent{
				border-top : 1px solid gray;
			}
			#rea_content{
				display : inline-block;
			}
			#rea_start{
				display : inline-block;
				vertical-align : top;
			}
			#reviewTitle{
				text-align : justify;
			}
			#rTitle, #reviewInsertButton, #spacep{
				display : inline-block;
			}
			#spacep{
				width : 393px;
			}
			#reviewInsertBox{
				border-bottom : 1px solid gray;
				text-align : right;
			}
			#review_content{
				margin-bottom : 8px;
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
							<div class="aside_menu" id="aside_menu1"><a href="/FireMoth/SearchStay.do?search=서울" class="aside_menu_a">서울</a></div>
							<div class="aside_menu" id="aside_menu2"><a href="/FireMoth/SearchStay.do?search=강원" class="aside_menu_a">강원도</a></div>
							<div class="aside_menu" id="aside_menu3"><a href="/FireMoth/SearchStay.do?search=충북" class="aside_menu_a">충청도</a></div>
							<div class="aside_menu" id="aside_menu4"><a href="/FireMoth/SearchStay.do?search=전북" class="aside_menu_a">전라도</a></div>
							<div class="aside_menu" id="aside_menu5"><a href="/FireMoth/SearchStay.do?search=경북" class="aside_menu_a">경상도</a></div>
							<div class="aside_menu" id="aside_menu6"><a href="/FireMoth/SearchStay.do?search=제주특별" class="aside_menu_a">제주도</a></div>
						</div>
					</div>
					
					<div id="content_box">
						<div id="stayTitle">
							<h2><%= svo.getStay_name() %></h2>	
						</div>
						<div id="stayImage">
							<%
								if(atchList != null){
									for(AtchFileVO fileVO : atchList){
							%>			
										
										<img src="<%= request.getContextPath() %>/filedownload.do?fileId=<%= fileVO.getAtchFileId() %>&fileSn=<%= fileVO.getFileSn() %>">
										
							<%			
									}
								}
							%>
						</div>
						<div id="stayInfo" style="margin:10px;padding:10px;">
							<div id="host">
								<h3><%= host_id %>님이 호스팅하는 숙소</h3>
								<p>최대인원 <%= svo.getStay_pnum()%>명</p>
								<p><%= svo.getStay_add()%></p>
							</div>
							<div id="stayIntroduce">
								<h3>숙소 소개</h3>
								<p><%= svo.getStay_info()%></p>
							</div>
							<div id="stayCo">
								<h3>숙소 편의시설</h3>
								<p class="coDetail<%= vo.getCo_hair()%>">
								<img alt="hair.png" src="/FireMoth/img/hair.png">&nbsp;&nbsp;&nbsp;&nbsp;
								헤어드라이어<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_bath()%>">
								<img alt="bathtub.png" src="/FireMoth/img/bathtub.png">&nbsp;&nbsp;&nbsp;&nbsp;
								욕조<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_bidet()%>">
								<img alt="bidet.png" src="/FireMoth/img/bidet.png">&nbsp;&nbsp;&nbsp;&nbsp;
								비데<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_water()%>">
								<img alt="water.png" src="/FireMoth/img/water.png">&nbsp;&nbsp;&nbsp;&nbsp;
								온수<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_wash()%>">
								<img alt="washer.png" src="/FireMoth/img/washer.png">&nbsp;&nbsp;&nbsp;&nbsp;
								세탁기<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_bed()%>">
								<img alt="bed.png" src="/FireMoth/img/bed.png">&nbsp;&nbsp;&nbsp;&nbsp;
								침대<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_internet()%>">
								<img alt="wifi.png" src="/FireMoth/img/wifi.png">&nbsp;&nbsp;&nbsp;&nbsp;
								무선 인터넷<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_tem()%>">
								<img alt="temp.png" src="/FireMoth/img/temp.png">&nbsp;&nbsp;&nbsp;&nbsp;
								냉난방<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_emer()%>">
								<img alt="fireAlert.png" src="/FireMoth/img/fireAlert.png">&nbsp;&nbsp;&nbsp;&nbsp;
								화재 경보기<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_co()%>">
								<img alt="coAlert.png" src="/FireMoth/img/coAlert.png">&nbsp;&nbsp;&nbsp;&nbsp;
								일산화탄소 경보기<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_re()%>">
								<img alt="refri.png" src="/FireMoth/img/refri.png">&nbsp;&nbsp;&nbsp;&nbsp;
								냉장고<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_et()%>">
								<img alt="microwave.png" src="/FireMoth/img/microwave.png">&nbsp;&nbsp;&nbsp;&nbsp;
								전자레인지<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_gas()%>">
								<img alt="induction.png" src="/FireMoth/img/induction.png">&nbsp;&nbsp;&nbsp;&nbsp;
								가스레인지<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_rice()%>">
								<img alt="rice.png" src="/FireMoth/img/rice.png">&nbsp;&nbsp;&nbsp;&nbsp;
								전기밥솥<br>
								</p>
								
								<p class="coDetail<%= vo.getCo_park()%>">
								<img alt="parking.png" src="/FireMoth/img/parking.png">&nbsp;&nbsp;&nbsp;&nbsp;
								주차장<br>
								</p>
							</div>
							<!-- <div id="reserList">
							</div> -->
							<div id="calbox">
								<div id="calendar"></div>
							</div>
						</div>
						<div id="stayReservation">
							<form id="reserFrom" onsubmit="return false;">
								<div id ="reserOk">예약이 완료되었습니다.</div>
								<div id ="reserTable" style="padding-left:40px;">
									<h3>￦<%= svo.getStay_price()%>/박</h3>
									<label class="lb">성인</label>
									<select class="pnum" id="adult" name="people_a">
										<option value="0" selected>0</option>
										<%int onum = svo.getStay_pnum();
										
										for(int i = 1; i <= onum; i++){%>
											<option value="<%= i %>"><%= i %></option>
										<%}%>
									</select>
									<br>
									<label class="lb">어린이</label>
									<select class="pnum" id="child" name="people_c">
										<option value="0" selected>0</option>
										<%for(int i = 1; i <= onum; i++){%>
											<option value="<%= i %>"><%= i %></option>
										<%}%>
									</select>
									<br>
									<label class="lb">유아</label>
									<select class="pnum" id="baby" name="people_b">
										<option value="0" selected>0</option>
										<%for(int i = 1; i <= onum; i++){%>
											<option value="<%= i %>"><%= i %></option>
										<%}%>
									</select>
									<br>
									<label class="lb">체크인</label>
									<input type="date" name="reser_ckin" id="reser_ckin">
									<br>
									<label class="lb">체크아웃</label>
									<input type="date" name="reser_ckout" id="reser_ckout">

									<label class="lb">가격</label>
									<p id="price1">0 원</p>
									
								</div>
								<input type="hidden" name="stay_id" value="<%= stay_id %>">
								<input type="hidden" name="cart_no" value="<%= cart_no %>">
								<input type="hidden" name="reser_price" id="price2">
								<input type="hidden" name="mem_id" value="<%= mem_id %>">
								<input class="btn" type="button" id="ckbutton" value="중복체크"><br>
								<button class = "btn" id="rbutton">예약</button><br>
								<button class = "btn" id="cbutton">취소</button>
							</form>
								
							<form action="/FireMoth/CartInsert.do" onsubmit="return false;">
								<input type="hidden" name="stay_id" value="<%= stay_id %>">
								<button class = "btn" id="jbutton" type="submit">찜리스트</button>
							</form>
							※ 체크아웃 다음날은 청소일로 예약할 수 없습니다.
						</div>
						<div id="stayReview"></div>
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
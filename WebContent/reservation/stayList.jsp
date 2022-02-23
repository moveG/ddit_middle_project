<%@page import="kr.or.ddit.cmm.service.AtchFileServiceImpl"%>
<%@page import="kr.or.ddit.cmm.service.IAtchFileService"%>
<%@page import="kr.or.ddit.cmm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.reser.vo.StayVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<StayVO> list = (List<StayVO>) request.getAttribute("stayList");
	String mem_id = (String) request.getAttribute("mem_id");
	List<AtchFileVO> atchList = (List<AtchFileVO>) request.getAttribute("atchList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<script src="/FireMoth/js/jquery-3.6.0.min.js"></script>
		
  		<link rel="stylesheet" href="/FireMoth/css/header.css">
		<link rel="stylesheet" href="/FireMoth/css/aside.css">
		
		<title>숙소</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

		<style>
			#content_box #stayList{
				display : inline-block;
				float : left;
				width : 52%;
			}
			#content_box #map{
				display: inline-block;
   			 	float: right;
   			 	position : sticky;
				top : 20px;
				border-radius : 2%;
			}
			#content_box .sList{
				border-bottom : 1px solid gray;
				height : 200px;
			}
			#content_box .sImage, #content_box .sInfo{
				display : inline-block;
				margin : 10px;
				height : 80%;
			}
			#content_box .sImage{
				float : left;
				width : 30%;
				padding : none;
			}
			#content_box .sInfo{
				float : right;
				width : 58%;
				padding : 10px;
				line-height : 200%;
			}
			#content_box .sImage img{
				width : 100%;
				height : 100%;
				border-radius : 10%;
			}
			.markerInfo{
				border: 2px solid lightblue;
				font-weight: bold;
			}
		</style>
		<script>
			let mapArr = [];
			
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
							<div class="aside_menu" id="aside_menu1"><a href="/FireMoth/SearchStay.do?search=서울" class="aside_menu_a">서울</a></div>
							<div class="aside_menu" id="aside_menu2"><a href="/FireMoth/SearchStay.do?search=강원" class="aside_menu_a">강원도</a></div>
							<div class="aside_menu" id="aside_menu3"><a href="/FireMoth/SearchStay.do?search=충북" class="aside_menu_a">충청도</a></div>
							<div class="aside_menu" id="aside_menu4"><a href="/FireMoth/SearchStay.do?search=전북" class="aside_menu_a">전라도</a></div>
							<div class="aside_menu" id="aside_menu5"><a href="/FireMoth/SearchStay.do?search=경북" class="aside_menu_a">경상도</a></div>
							<div class="aside_menu" id="aside_menu6"><a href="/FireMoth/SearchStay.do?search=제주특별" class="aside_menu_a">제주도</a></div>
						</div>
					</div>
					
					<div id="content_box">
						<div id="stayList">
							<%
							   int staySize = list.size();
							   if(staySize > 0){
							      for(int i = 0; i < staySize; i++){
							    	  if(mem_id == "비회원"){
							%>
							<div id="noMember" class="sList" onclick="location.href='/FireMoth/memberJoin/memberLogin.jsp'">
							<%
							}else{
							%>
							<div class="sList" onclick="location.href='/FireMoth/reservation/StayDetail.do?stay_id=<%= list.get(i).getStay_id() %>&atch_file_id=<%= list.get(i).getAtch_file_id() %>'">
							<%
							}
							%>							
							    <div class="sImage">
					               <%
										if(atchList.get(i) != null){
									%>			
												<img src="<%= request.getContextPath() %>/filedownload.do?fileId=<%= atchList.get(i).getAtchFileId() %>&fileSn=<%= atchList.get(i).getFileSn() %>">
									<%			
										}
											
									%>
					            </div>
					            <div class="sInfo">
					               <p>숙소명 : <%= list.get(i).getStay_name() %></p>
					               <%-- <p>숙소정보 : <%= list.get(i).getStay_info() %></p> --%>
					               <p>최대인원 : <%= list.get(i).getStay_pnum() %></p>
					               <p>가격 : ￦<%= list.get(i).getStay_price() %>/박</p>
					               <p>주소 : <%= list.get(i).getStay_add() %></p>
					            </div>
         					</div>
       
							<script>
								mapArr.push({"add" : "<%= list.get(i).getStay_add() %>", "name" : "<%= list.get(i).getStay_name() %>"});
								console.log(mapArr);
							</script>
							<%         
							      }
							   }else{
							%>
							         <div class="sList">
							            숙소정보가 없습니다.
							         </div>
							<%
							   }
							%>
     					</div>

						<div id="map" style="width: 46%; height: 900px;">
							<script type="text/javascript"
         					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f40e53b023026aaa7ac30a1a7084ac3&libraries=services"></script>
     						<script>
								var mapContainer = document.getElementById('map'); // 지도를 표시할 div
         
								var mapOption = {
								   center : new kakao.maps.LatLng(36.35043075681321, 127.3848294267714), // 지도의 중심좌표
								   level : 12
								// 지도의 확대 레벨
								};

								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer, mapOption);
         						
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();
								
								
								
								$.each(mapArr, function(idx, obj){
									addToMarker(obj);
								})
         
								function addToMarker(obj) {
									// 주소로 좌표를 검색합니다
									geocoder.addressSearch(obj.add, function(result, status) {
										// 정상적으로 검색이 완료됐으면 
										if (status === kakao.maps.services.Status.OK) {

											var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

											// 결과값으로 받은 위치를 마커로 표시합니다
											var marker = new kakao.maps.Marker({
												map : map,
												position : coords
											});
					
											/* // 인포윈도우로 장소에 대한 설명을 표시합니다
											var infowindow = new kakao.maps.InfoWindow({
												content : '<div style="width:150px;text-align:center;padding:6px 0;">'+obj.name+'</div>'
											});
											
                 							infowindow.open(map, marker); */
											
											// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
											var iwContent = '<div class="markerInfo" style="width:150px;text-align:center;padding:6px 0;">'+obj.name+'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

											// 인포윈도우를 생성합니다
											var infowindow = new kakao.maps.InfoWindow({
											    content : iwContent
											});

											// 마커에 마우스오버 이벤트를 등록합니다
											kakao.maps.event.addListener(marker, 'mouseover', function() {
											  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
											    infowindow.open(map, marker);
											});

											// 마커에 마우스아웃 이벤트를 등록합니다
											kakao.maps.event.addListener(marker, 'mouseout', function() {
											// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
											infowindow.close();
											});
										}
									});
								}
								
								var zoomControl = new kakao.maps.ZoomControl();
								map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

								// 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
								kakao.maps.event.addListener(map, 'zoom_changed', function() {        
								    
								    // 지도의 현재 레벨을 얻어옵니다
								    var level = map.getLevel();
								    
								    var message = '현재 지도 레벨은 ' + level + ' 입니다';
								    var resultDiv = document.getElementById('result');  
								    
								});
         
      						</script>
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
<%@page import="kr.or.ddit.stay.vo.CoDetailVO"%>
<%@page import="kr.or.ddit.stay.vo.StayVO"%>
<%@page import="kr.or.ddit.cmm.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
    
   		List<AtchFileVO> atchfileList = (List<AtchFileVO>)request.getAttribute("atchFileList");
    	StayVO vo = (StayVO)request.getAttribute("stayList");
    	CoDetailVO covo = (CoDetailVO)request.getAttribute("covo");
    %>
    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/FireMoth/css/aside.css">
  <link rel="stylesheet" href="/FireMoth/css/header.css">
  <link rel="stylesheet" href="/FireMoth/css/button.css">
<title>마이페이지-호스트</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <style>
	 .p{
 		font-size: 1.2em;
 	}
 	#deimg{
 		width : 100px;
 		height : 100px;	
 		margin-bottom: 20px;
 		margin-top: 20px;
 	}
 	table{
 		border-collapse : collapse;
 		border-top: 1px solid lightgray;
 		width: 700px;
 		font-size: 1.2em;
 	}
 	table input{
 		width: 300px;
 		border: none;
 		font-size: 0.9em;
 		height: 40px;
 		width: 440px;
 		/* padding-left: 15px; */
 	}
 	.td1{
 		width: 30%;
 		background-color: #F5F5DC;
 	}
 	td{
 		height: 80px;
 		padding-left: 10px;
 	}
 	tr{
 		border-bottom: 1px solid lightgray;
 	}
 	.co_div{
 		border: 1px solid lightgray;
 		width: 670px;
 		height: auto;
 		padding: 15px;
 		margin-top: 10px;
 		background-color: #F5F5DC;
 	}
 	.d_form{
 		float: left;
 	}
 	#content_box_container{
 		width: 1000px;
 		padding-left: 30px;
 	}
 	/* #td_content{
 		padding-top: 
 	} */
 </style>
 
<script>
			
$(function(){

	 //호스트 게스트 판별 후 로그아웃  
     $.ajax({
       url : '/FireMoth/LoginCheck.do',
       type : 'post',
       dataType : 'json',
       success : function(res){
           /* alert(res.division); */
          if(res.division == "guest" || res.division == "host" ){
             $('.login').hide();
             code = '<a href="/FireMoth/memberJoin/memberLogin.jsp"' 
             code += 'onclick="session();" class="loginbox logout">로그아웃</a>';
             $('.mem').html(code);
          }
       },
       error : function(asd){
         /*  alert("상태 : " + asd.status); */
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
    
    
    	//숨기는 옵션
			$(function(){
				$('.coDetail0').hide();
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
					<a href="../memberJoin/memberLogin.jsp" class="loginbox">로그인</a>
					<a href="../memberJoin/member_choice.jsp" class="loginbox">회원가입</a>
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
						<a href="" class="private_menu_icon" id="menu_icon1">
							<img alt="마이메뉴" src="/FireMoth/img/mymenu_icon.png" class="private_menu_icon_img"/>
							<p>마이메뉴</p>
						</a>
						<a href="#동근" class="private_menu_icon" id="menu_icon2">
							<img alt="예약내역" src="/FireMoth/img/document_icon.png" class="private_menu_icon_img"/>
							<p>예약내역</p>
						</a>
						<a href="" class="private_menu_icon" id="menu_icon3">
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
							<li><a href="#" class="category">교통편</a>
								<ul>
									<li><a href="/FireMoth/traffic/Bus.jsp">버스</a></li>
									<li><a href="//FireMoth/traffic/Train.jsp">기차</a></li>
									<li><a href="/FireMoth/traffic/Air.jsp">항공</a></li>
								</ul>
							</li>
							<li><a href="/FireMoth/MyTripInsert.do" class="category">나만의 여행지</a></li>
							<li><a href="/FireMoth/EventSelect.do" class="category">혜택/이벤트</a></li>
							<li><a href="/FireMoth/SelectAllNotice.do" class="category">공지사항</a></li>
							<li><a href="#혜윤" class="category">고객센터</a>
								<ul>
									<li><a href="/FireMoth/SelectAllFaq.do">자주 묻는 질문</a></li>
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
	
		<div id="nav_container">
				<div id="aside">
					<div id="aside_container">
						<div class="aside_menu" id="aside_menu1"><a href="/FireMoth/ListStay.do" class="aside_menu_a">상품별 관리</a></div>
						<div class="aside_menu" id="aside_menu2"><a href="/FireMoth/hostName.do" class="aside_menu_a">상품 예약관리</a></div>
						<div class="aside_menu" id="aside_menu3"><a href="/FireMoth/MemberList.do" class="aside_menu_a">회원정보</a></div>
						<div class="aside_menu" id="aside_menu4"><a href="/FireMoth/CirChart.do" class="aside_menu_a">매출통계</a></div>
					</div>
				</div>


			<div id="content_box">
				<div id="content_box_container">
					
					<h1>상품별 관리 상세</h1>
					<br>
					
					<table>
					
					<tr>
						<td class="td1">
							📸 숙소사진
						</td>
						<td>
							<%
								if(atchfileList != null){
									for(AtchFileVO fileVO : atchfileList){
							%>			
								<img id="deimg" src="<%=request.getContextPath()%>/filedownload.do?fileId=<%=fileVO.getAtchFileId()%>&fileSn=<%=fileVO.getFileSn()%>">
																
							<%			
									}
								}
							%>
						</td>
					<tr>
					
							
					<!-- <tr>
					<td>호스트 아이디 </td>
					<td><input type="hidden" value="99" name="HOST_NO" ></td>
					</tr> -->
					<tr>	
						<td class="td1">🔖 숙소이름</td>
						<td><%=vo.getStay_name() %></td>
					</tr>
		
					<tr>	
						<td class="td1">🏠 숙소 주소</td>
						<td><%=vo.getStay_add() %></td>
			
					</tr>
					
				
					
					<tr>	
					
						
						<td class="td1">📋 숙소 정보</td>
						<td id="td_content"><%=vo.getStay_info().replaceAll("/n", "<br>")%></td><br> 
						
					</tr>
					
					<tr>	
						<td class="td1">💰 숙소 가격</td>
						<td><%=vo.getStay_price() %></td>
					</tr>
					
					<tr>	
						<td class="td1">🙎‍♂️ 숙소 수용 가능 인원</td>
						<td><%=vo.getStay_pnum() %></td>
			
					</tr>
					
					
					
							</table>		
										<br>
										<p class="p">📌편의시설📌</p>
										<div class="co_div">
											<p class="p coDetail<%= covo.getCo_hair()%>">헤어드라이어 <%= String.valueOf(covo.getCo_hair()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_bath()%>">욕조 <%= String.valueOf(covo.getCo_bath()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_bidet()%>">비데 <%= String.valueOf(covo.getCo_bidet()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_water()%>">온수 <%= String.valueOf(covo.getCo_water()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_wash()%>">세탁기 <%= String.valueOf(covo.getCo_wash()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_bed()%>">침대 <%= String.valueOf(covo.getCo_bed()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_internet()%>">무선인터넷 <%= String.valueOf(covo.getCo_internet()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_tem()%>">냉난방 <%= String.valueOf(covo.getCo_tem()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_emer()%>">화재경보기 <%= String.valueOf(covo.getCo_emer()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_co()%>">일산화탄소경보기 <%= String.valueOf(covo.getCo_co()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_re()%>">냉장고 <%= String.valueOf(covo.getCo_re()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_et()%>">전자레인지 <%= String.valueOf(covo.getCo_et()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_gas()%>">가스레인지 <%= String.valueOf(covo.getCo_gas()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_rice()%>">전기밥솥 <%= String.valueOf(covo.getCo_rice()).replace("1", "o")%></p>
											<p class="p coDetail<%= covo.getCo_park()%>">주차장 <%= String.valueOf(covo.getCo_park()).replace("1", "o")%></p>
										</div>
										
										<br>
										
										<form class="d_form" action="/FireMoth/updateStay.do" method="get">
												<input type="hidden" name="co_id" value="<%=covo.getCo_id() %>">
												<input type="hidden" name="stay_id" value="<%=vo.getStay_id()%>">
												<input class="base_btn" type="submit" value="수정">
												
										</form>		
										
										<form class="d_form" action="/FireMoth/deleteStay.do" method="post">
												<input type="hidden" name="co_id" value="<%=covo.getCo_id() %>">
												<input type="hidden" name="stay_id" value="<%=vo.getStay_id()%>">
												<input class="base_btn" type="submit" value="삭제">
												
										</form>		
				
							
									<button class="base_btn d_form" onclick="location='/FireMoth/ListStay.do'">목록으로</button>

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
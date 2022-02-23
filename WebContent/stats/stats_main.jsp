<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.cmm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.stay.vo.StayVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
     <%
    
  		/*   Map<String, Integer> Cmap = new HashMap<String, Integer>(); */
    	HashMap<String, Integer> Cmap = (HashMap<String, Integer>)request.getAttribute("cirChart");
    	int[] Carray = (int[])request.getAttribute("chart");
    
    %>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://d3js.org/d3.v6.min.js"></script>
<script src="/FireMoth/stats/billboard.js"></script>
<script src="/FireMoth/stats/billboard.pkgd.js"></script>
<link rel="stylesheet" href="/FireMoth/stats/billboard.css">
<link rel="stylesheet" href="/FireMoth/stats/insight.css">
<link rel="stylesheet" href="/FireMoth/stats/insight.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/FireMoth/css/aside.css">
  <link rel="stylesheet" href="/FireMoth/css/header.css">
  <link rel="stylesheet" href="/FireMoth/css/button.css">
  <link rel="stylesheet" href="/FireMoth/stats/stats_main.css">
<title>매출통계</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
			
 $(function(){

	 //호스트 게스트 판별 후 로그아웃  
    $.ajax({
       url : '/FireMoth/LoginCheck.do',
       type : 'post',
       dataType : 'json',
       success : function(res){
          /*  alert(res.division); */
          if(res.division == "guest" || res.division == "host" ){
             $('.login').hide();
             code = '<a href="/FireMoth/memberJoin/memberLogin.jsp"' 
             code += 'onclick="session();" class="loginbox logout">로그아웃</a>';
             $('.mem').html(code);
          }
       },
       error : function(asd){
          /* alert("상태 : " + asd.status); */
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
    
    
		var chart = bb.generate({
		    bindto: "#chart",
		    data: {
		        type: "pie",
		        columns: [
		        					<%
		        					int j=0;
		        					for(String is : Cmap.keySet()){ //저장된 key값 확인
			        						j++;
			        						%>  
			        						[
			        							"<%=is%>"
			        							<%
			        							 out.print(",");
			        							%>
			        							<%=Cmap.get(is)%>
			        						]
			        						
			        						<%
												if(Cmap.size()>j) out.print(",");
		        							%>
		        						<%
			        					
			        					}
	        
		        					%>

		            ]
		    }
		});
    
    var chart1 = bb.generate({
	    bindto: "#chart1",
	  
	    axis: {
	    	  x: {
	    	    min: 1,
	    	    tick: {
	    		      culling: {
	    		          max: 1
	    		      }
	    		    }
	    	  }
	    	},
	    
	    	
	    	
	    	
	    data: {
	        
	    	
	    	
	    	
	    	type: "area-spline",
	        
	        
	        
	        columns: [
	           
	        			[
	        				"10월 매출",
	        				
	        			<%
	        					for(int i=0; i<Carray.length;i++){
	        			
	        			
	        			%>
	        	
	        					
	        			
	        						<%
	        							if(i>0)out.print(",");
	        						%>
	        					
	        					
	        					 <%=Carray[i] %>
	        						
	        					
	        			
	        			
	        			<%
	        	
	        			
	        					}
	        			
	        			
	        			%>
	        				]
	        			
	        			
	        	/*  ["10월 매출", 30,20,40,60,0,70,80,90,50] */
	        	
         
	                 ]
	    },
	    
	   
	    
	});
    
    
})	 
			
		
		
  </script>
  <style>
  	tspan{
	
		font-size: 1.2em;
	
	}
	.bb-legend-item-10월-매출{
		margin-top: 20px;
		font-size: 2.0em;
	}
  .bb-legend-item{
  	display: block; 
  	font-size: 1.5em;
  }
  </style>
</head>
<body>
	<div class="container">
		<div id="header">
			<div id="header_container">
			
				<div class="inr" id="inr1">
					<div class="mem">
						<a href="#" class="loginbox">로그인</a>
						<a href="#" class="loginbox">회원가입</a>
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
										<li><a href="/FireMoth/traffic/Train.jsp">기차</a></li>
										<li><a href="/FireMoth/traffic/Air.jsp">항공</a></li>
									</ul>
								</li>
								<li><a href="/FireMoth/MyTripList.do" class="category">나만의 여행지</a></li>
								<li><a href="/FireMoth/EventSelect.do" class="category">혜택/이벤트</a></li>
								<li><a href="/FireMoth/SelectAllNotice.do" class="category">공지사항</a></li>
								<li><a href="#" class="category">고객센터</a>
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
						<div class="aside_menu" id="aside_menu1"><a href="/FireMoth/ListStay.do" class="aside_menu_a">상품별 관리</a></div>
						<div class="aside_menu" id="aside_menu2"><a href="/FireMoth/hostName.do" class="aside_menu_a">상품 예약관리</a></div>
						<div class="aside_menu" id="aside_menu3"><a href="/FireMoth/MemberList.do" class="aside_menu_a">회원정보</a></div>
						<div class="aside_menu" id="aside_menu4"><a href="" class="aside_menu_a">매출통계</a></div>
					</div>
				</div>
				
				
				<div id="content_box">
					<div id="content_box_container">
						
						<h1 id="h1h1">10월 매출통계</h1>
						<br>
						
						<div class="stats_container">
							<div class="graph_container">
								<div class="graph1">
									<div id="chart1"></div>
								</div>
								
								<div class="graph2">
									<div id="chart"></div>
								</div>
							</div>
							
							<div class="stats_info_container">
								<div class="info">
									<label><h3>📌 10월 총매출</h3></label>
									<p class="p">120,000,000 ₩</p>
								</div>
								
								<div class="info">
									<label><h3>📌 최고 수익 발생일</h3></label>
									<p class="p">10월 26일</p>
								</div>
								
								<div class="info">
									<label><h3>📌 최고 수익 발생 상품</h3></label>
									<p class="p">강릉 바다가 보이는 강릉펜션</p>
								</div>
								
								<div class="infoinfo">
									<label><h3>📌 상품별 매출현황</h3></label>
									<%
										for(String is : Cmap.keySet()){
									%>
										<p class="price">✔&nbsp;<%=is%></p>
										<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;<%=Cmap.get(is) %>원</p>
									<%
										}
									%>
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

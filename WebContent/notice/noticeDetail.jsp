<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int notoce_no = Integer.parseInt(request.getParameter("nono"));
	System.out.println("여기는 제이에스피 " + notoce_no);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/FireMoth/css/aside.css">
<link rel="stylesheet" href="/FireMoth/css/header.css">
<title>공지사항 상세조회</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/FireMoth/notice/notice.js"></script>
<script>
	
	$(function() {
		nonono = "<%= notoce_no %>";
		console.log(nonono + "여기는 콘솔이다")
		/* $.ajax({
					url : '/FireMoth/LoginCheck.do',
					type : 'post',
					dataType : 'json',
					success : function(res) {
						alert(res.division);
						if (res.division == "guest" || res.division == "host") {
							$('.login').hide();
							code = '<a href="/FireMoth/memberJoin/memberLogin.jsp"'
							code += 'onclick="session();" class="loginbox logout">로그아웃</a>';
							$('.mem').html(code);
						}
					},
					error : function(asd) {
						alert("상태 : " + asd.status);
					}

				}) */
				
				
				//공지사항 상세 출력
				$.ajax({
					url : '/FireMoth/SelectNotice.do',
					type : 'get',
					dataType: 'json',
					data : {"nonono" : nonono},
					success : function(res){
						code  = '	<div id="notice_container">                           	        ';
					    code += '                                                                   ';
						code += '		<div id="notice_header">                                    ';
						code += '			<div id="notice_header1" class="notice_header_line">    ';
						code += '				<div class="notice_header_titlebox bb">                ';
						code += '					<p>제목</p>                                      ';
						code += '				</div>                                              ';
						code += '				<div id="real_title_input">                         ';
						code += '					<p>'+ res.notice_title +'</p>               ';
						code += '				</div>                                              ';
						code += '			</div>                                                  ';
						code += '			                                                        ';
						code += '			<div id="notice_header2" class="notice_header_line">    ';
						code += '				<div class="notice_header_titlebox bb">                ';
						code += '					<p>작성자</p>                                     ';
						code += '				</div>                                              ';
						code += '				<div class="notice_inputbox">                       ';
						code += '					<p>'+ res.admin_id +'</p>                   ';
						code += '				</div>                                              ';
						code += '				<div class="notice_header_titlebox aa">                ';
						code += '					<p>작성일</p>                                     ';
						code += '				</div>                                              ';
						code += '				<div class="notice_inputbox">                       ';
						code += '					<p>' + res.notice_date + '</p>                ';
						code += '				</div>                                              ';
						code += '			</div>                                                  ';
						code += '			                                                        ';
						code += '			<div id="notice_header3" class="notice_header_line">    ';
						code += '				<div class="notice_header_titlebox bb">                ';
						code += '					<p>글번호</p>                                     ';
						code += '				</div>                                              ';
						code += '				<div class="notice_inputbox">                       ';
						code += '					<p>' + res.notice_no + '</p>                  ';
						code += '				</div>                                              ';
						code += '				<div class="notice_header_titlebox aa">                ';
						code += '					<p>수정일</p>                                     ';
						code += '				</div>                                              ';
						code += '				<div class="notice_inputbox">                       ';
						code += '					<p>' + res.notice_mod + '</p>                 ';
						code += '				</div>                                              ';
						code += '			</div>                                                  ';
						code += '		</div>                                                      ';
						code += '		                                                            ';
						code += '		                                                            ';
						code += '		<div id="notice_content">                                   ';
						code += '			<p>'+ res.notice_content +'</p>                     ';
						code += '		</div>                                                      ';
						code += '	</div>                                                          ';
					
					
					
					$('#content_box_container').html(code);
					
					},
					error : function(xhr){
						alert("상태 : " + xhr.status);
					}
				})
				
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
#notice_container{
	border-top: 2px solid gray;
	border-bottom: 2px solid gray;
	font-size: 1.1em;
	width: 980px;
	height: auto;
	margin-left: 55px;
	margin-top: 50px;
}
#notice_container div{
}
#notice_header{
	text-align: center;
}
p{
	margin-top: 15px;
}
#notice_header{
	width: 980px;
	height: auto;
}
.notice_header_line{
	width: 980px;
	height: 55px;
	
	border-bottom : 1px solid gray;
	
	display: flex;
	align-items: stretch;
}
.notice_header_titlebox{
	width: 120px;
	border-: 1px solid gray;
	font-weight: bold;
	background-color: #e2f5f5;
	/* height: 100%; */
}
#real_title_input{
	width: 860px;
}
.notice_inputbox{
	width: 370px;
}
.aa{
	border-left: 1px solid gray;
	border-right: 1px solid gray;
}
.bb{
	border-right: 1px solid gray;
}
#notice_content{
	word-break:break-all;
	height: 500px;
	padding: 15px;
	padding-left: 25px;
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
						<img alt="로고" id="logoimg" src="/FireMoth/img/logo.PNG"> <a
							id="page_name" href="/FireMoth/jsp/index.jsp">Come&Stay</a>
					</div>
					<div class="serchform">
						<form name="search" action="/FireMoth/SearchStay.do" method="get"
							autocomplete="on">
							<input type="text" name="search" placeholder="Search.."
								class="search"> <input id="search_btnbtn" type="submit"
								value="">

							<div class="private_menu">
								<a href="#" class="private_menu_icon"
									id="menu_icon1"> <img alt="마이메뉴"
									src="/FireMoth/img/mymenu_icon.png"
									class="private_menu_icon_img" />
									<p>마이메뉴</p>
								</a> <a href="/FireMoth/GuestReserList.do" class="private_menu_icon" id="menu_icon2"> <img
									alt="예약내역" src="/FireMoth/img/document_icon.png"
									class="private_menu_icon_img" />
									<p>예약내역</p>
								</a> <a href="/FireMoth/CartList.do" class="private_menu_icon"
									id="menu_icon3"> <img alt="찜리스트"
									src="/FireMoth/img/shopping_cart_icon.png"
									class="private_menu_icon_img" />
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
					<div class="aside_menu" id="aside_menu1">
						<a href="#" class="aside_menu_a">공지사항</a>
					</div>
				</div>
			</div>

			<div id="content_box">
				<div id="content_box_container">
					
					
									
				</div>
			</div>
		</div>
		</nav>
		<footer id="foot">
		<div id="footer_container">
			<div id="footer_msg">
				<p>Come&Stay</p>
				<p>Tel. 042-555-666</p>
				<p>※Come&Stay는 통신판매중개자로서 통신판매의 당사자가 아니며 해당상품의 거래정보 및 거래등에 대해 책임을
					지지 않습니다.</p>
				<p></p>
				<p></p>
				<p></p>
			</div>
		</div>
		</footer>

	</div>

</body>

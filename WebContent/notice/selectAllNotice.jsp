<%@page import="kr.or.ddit.notice.vo.NoticeVO"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%

	List<NoticeVO> list = (List<NoticeVO>) request.getAttribute("allList");

	//System.out.println(list);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="/FireMoth/css/aside.css">

<link rel="stylesheet" href="/FireMoth/css/header.css">
<link rel="stylesheet" href="/FireMoth/css/button.css">

<title>공지사항</title>

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link

	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"

	rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="/FireMoth/notice/notice.js"></script>

<script>
	$(function(){

		$(document).on('click', '.title_box', function(){
			no = $(this).attr('no');
			/* alert(no); */
			selectNoticeServer(no);
		})
		
		$('#notice_button_box').hide();
		
		
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
	#content_box_container{
		padding: 20px;
		padding-left: 50px;
		height: 700px;
	}
	#content_box_container h2{
		font-size: 2.0em;
		font-weight: bold;
	}
	table{
		border-collapse: collapse;
		width: 980px;
		border-color: gray;
		text-align: center;
		font-size: 1.2em;
	}
	.title_box{
		cursor: pointer;
	}
	.left_border_none{
		border-left-color: white;
		width: 8%;
	}
	.right_border_none{
		border-right-color: white;
		width: 20%;
	}
	#notice_table  th{
		height: 55px;
		border-bottom: 2px solid gray;
		border-top: 2px solid gray;
		background-color: #e2f5f5;
	}
	#notice_table  td{
		/* border-top-color: white; */
		height: 50px;
	}
	#notice_search_box{
		margin-left: 455px;
	}
	#notice_search_filter{
		width: 120px;
		height: 37px;
		font-size: 1.05em;
		margin-right: 4px;
	}
	#notice_search_input{
		width: 290px;
		height: 33px;
		font-size: 1.05em;
	}
	#notice_search_button{
		margin-bottom: 0px;
	}
	#notice_button_box{
		margin-left: 672px;
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

					<h2>공지사항</h2>

					<br>
					<div id="notice_search_box">
					
						<select id="notice_search_filter">
							<option>제목</option>
							<option>내용</option>
						</select>
	
						<input type="text" name="notice_search" placeholder="검색어를 입력해주세요." id="notice_search_input">
						<input type="button" value="검색" id="notice_search_button" class="base_btn">
					</div>
					

					<br><br>

					

					<table border="1" id="notice_table">

						<tr>

							<th class="left_border_none">번호</th>

							<th>제목</th>

							<th class="right_border_none">등록일</th>

						</tr>

						<%

							for (int i = 0; i < list.size(); i++) {

								if (i >= 0) {

						%>

						<tr>

							<td class="left_border_none"><p><%=list.get(i).getNotice_no()%></p></td>

							<td><p no="<%=list.get(i).getNotice_no()%>" class="title_box"><%=list.get(i).getNotice_title()%></p></td>

							<td class="right_border_none"><p><%=list.get(i).getNotice_date()%></p></td>

						</tr>

						<%

								}

							}

						%>

					</table>

					

					<br>

					
					<div id="notice_button_box">
						<button onclick="location='notice/insertNotice.jsp'" class="base_btn">등록</button>
						<button onclick="location='notice/updateNotice.jsp'" class="base_btn">수정</button>
						<button onclick="location='notice/deleteNotice.jsp'" class="base_btn">삭제</button>				
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

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/FireMoth/css/only_headerpage.css">
  <link rel="stylesheet" href="/FireMoth/css/header.css">
  <!-- <link rel="stylesheet" href="/FireMoth/memberJoin/login.css"> -->
  <link rel="stylesheet" href="/FireMoth/memberJoin/idpwFind.css">
<title>ID/PW 찾기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script>
	$(function() {
		// 아이디 찾기 버튼 클릭
		$('#selectID').on('click', function() {
			fdatas = $('form').serialize()
				$.ajax({
					url : '/FireMoth/IdFind.do',
					data : fdatas,
					type : 'post',
					dataType : 'json',
					success : function(res) {
							code = "";
						if (res.flag == "성공") {
							$('.id').hide();
							code += '<div id="idresult">'+ res.result
							code += '<button id="loginGo" type="button" class="btn btn-primary btn-lg" >로그인</button>'
							code += '<button id="pwFindGo" type="button" class="btn btn-primary btn-lg" >비밀번호 찾기</button>'
							code += '</div>'
							$('form').html(code);
						}
						else if (res.flag == "실패") {
							alert("일치하는 정보가 없습니다.")
						}
					},
					error : function(asd) {
						alert("상태 : " + asd.status)
					}
				})
		})
		// 아이디 찾기 후 로그인 버튼 클릭
		$(document).on('click', '#loginGo', function() {

			location.replace('memberLogin.jsp');

		})
		// 아이디 찾기 전 패스워드 찾기 버튼 클릭(화면 이동)
		$('#pwfind').on('click', function() {

			selectPass();

		})

		// 아이디 찾기 후 패스워드 찾기 버튼 클릭(화면 이동)
		$(document).on('click', '#pwFindGo', function() {

			selectPass();

		})

		// 패스워드 찾기 버튼 클릭
		$(document)
				.on(
						'click',
						'#selectPW',
						function() {

							fdatas = $('form').serialize()
							alert(fdatas);
							$
									.ajax({
										url : '/FireMoth/PwFind.do',
										data : fdatas,
										type : 'post',
										dataType : 'json',
										success : function(res) {

											if (res.flag == "성공") {
												rpass = "";
												for (var i = 0; i < 8; i++) {
													rnum = parseInt(Math
															.random() * 2);
													if (rnum == 1) {
														rpass += String
																.fromCharCode(Math
																		.random() * 26 + 65);
													} else {
														rpass += String
																.fromCharCode(Math
																		.random() * 26 + 97);
													}
												}

												rpass = {
													"mem_id" : res.mem_id,
													"mem_tel" : res.mem_tel,
													"mem_pass" : rpass
												};

												$
														.ajax({
															url : '/FireMoth/PwChange.do',
															data : rpass,
															type : 'get',
															dataType : 'json',
															success : function(
																	res) {

																if (res.flag == "성공") {
																	$('#content_box_container form .pwselect')
																			.hide();

																	code = "";
																	code += '<div id="pwresult">새로운 비밀번호: '
																			+ rpass.mem_pass + '<br><br>'
																	code += '<button id="loginGo" type="button" class="btn btn-primary btn-lg" >로그인</button>'
																	code += '</div>'

																	$('#content_box_container form')
																			.html(
																					code);
																}

															},
															error : function(
																	asd) {
																alert("상태 : "
																		+ asd.status);
															}
														})

											} else if (res.flag == "실패") {
												alert("일치하는 정보가 없습니다.");
											}

										},
										error : function(asd) {
											alert("상태 : " + asd.status);
										}
									})
						})
			// 비밀번호 찾기 화면에서 아이디 찾기 버튼 클릭
			$(document).on('click','#selectidd', function(){
				 location.reload();

			})

	})


	function selectPass() {

		$('h2').text("비밀번호 찾기")
		$('#content_box_container form .idselect').hide();

		code = "";
		code += '<div class="pwselect">'

		code += '<div class="pw find">'
		code += '	<label class="control-label col-sm-2" for="name">아이디 </label>'
		code += '		<div class="pw find">'
		code += '			<input type="text" name="mem_id" >'
		code += '		</div>'
		code += '</div>'

		code += '<div class="pw find">'
		code += '	<label class="control-label col-sm-2" for="name">전화번호 </label>'
		code += '	<div class="pw find">'
		code += '		<input type="text" name="mem_tel">'
		code += '	</div>'
		code += '</div>'

		code += '<div class="pw find">'
		code += '	<label class="control-label col-sm-2" for="name">생년월일 </label>'
		code += '	<div class="pw find">'
		code += '		<input type="date" name="mem_bir">'
		code += '	</div>'
		code += '</div>'

		code += '<div class="form-group pw find">'
		code += '	<div class="col-sm-offset-2 col-sm-10 id find">'
		code += '		<button id="selectidd" type="button" class="btn btn-primary btn-lg"" >아이디 찾기</button>'
		code += '		<button id="selectPW" type="button" class="btn btn-primary btn-lg"" >패스워드 찾기</button>'
		code += '	</div>'
		code += '</div>'

		code += '</div>'

		$('#content_box_container form').html(code);

	}
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
		<div id="content_box">
			<div id="content_box_container">
				<div class="idselect">
					<br>
					<h2 class="f_h2">아이디 찾기</h2>
					<br>
					<form>
						<div id="aa">
							<div class="form-group">
								<label class="control-label col-sm-2" for="name">이름 </label>
								<div class="id find">
									<input type="text" name="mem_name">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-2" for="name">전화번호 </label>
								<div class="id find">
									<input type="text" name="mem_tel">
								</div>
							</div>
						</div>

						<div class="form-group id find">
							<div class="col-sm-offset-2 col-sm-10 id find">
								<button id="selectID" type="button" class="form-control f_btn">아이디
									찾기</button>
								<br>
								<button id="pwfind" type="button" class="form-control f_btn">비밀번호
									찾기</button>
							</div>
						</div>
				</div>

				</form>

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
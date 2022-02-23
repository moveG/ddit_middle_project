<%@page import="kr.or.ddit.cmm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.mytrip.vo.MyTripVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/FireMoth/css/aside.css">
<link rel="stylesheet" href="/FireMoth/css/header.css">
<title>나만의 여행지 등록</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<style>
.mytripList{
	display:inline-block;
	
	width: 100%;
	border: 1px solid black;
	
}
.mybutton{
	width: 92px;
    height: 30px;
    margin-top: 7px;
    border-radius: 5px;
    border:1px solid lightseagreen;
    background: lightseagreen;
    color : white;
    cursor: pointer;
    float: right;
    margin-right: 10px;
}

#suggestionimg{
	width: 30px;
    height: auto;
}

</style>
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
								<a href="/FireMoth/ListStay.do" class="private_menu_icon"
									id="menu_icon1"> <img alt="마이메뉴"
									src="/FireMoth/img/mymenu_icon.png"
									class="private_menu_icon_img" />
									<p>마이메뉴</p>
								</a> <a href="#" class="private_menu_icon" id="menu_icon2"> <img
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
					<div class="aside_menu" id="aside_menu1"><a href="/FireMoth/MyTripList.do" class="aside_menu_a">나만의 여행지</a></div>
					<div class="aside_menu" id="aside_menu2"><a href="#" class="aside_menu_a">추천 여행지</a></div>
					<div class="aside_menu" id="aside_menu3"><a href="/FireMoth/mytrip/myTripInsert.jsp" class="aside_menu_a">나만의 여행지 등록</a></div>
				</div>
			</div>

			<div id="content_box">
				<div id="content_box_container">

					<%
						List<MyTripVO> list = (List<MyTripVO>) request.getAttribute("list");
						long[] ficnt = (long[]) request.getAttribute("ficnt");
						List<AtchFileVO>[] atchList = (List<AtchFileVO>[])request.getAttribute("atchList");

						for (int i = 0; i < list.size(); i++) {
							MyTripVO vo = list.get(i);
					%>
						<div class="mytripList" >
							<p class="myTripno" style="display: none"><%=vo.getMytrip_no() %></p>
							<h3><%=vo.getMem_id() %>님의 여행지</h3>
							<p><%=vo.getMytrip_date() %></p>
							<p><b><%=vo.getMytrip_title() %></b></p>
							<p><%=vo.getMytrip_content() %></p>
						
					<%
						
						if(atchList != null){
							
							for(int v=0; v<ficnt[i]; v++){
								
					%>			
						<img class="myimg" src="<%= request.getContextPath() %>
						/filedownload.do?fileId=<%= vo.getAtch_file_id() %>
						&fileSn=<%= atchList[i].get(v).getFileSn() %>">
					<%		
								}
						
							
						}
					%>	
						<br>
						<img id="suggestionimg" src="/FireMoth/img/좋아요.png" style="display: inline-block;" >
						<p class="suggestion_no" style="display:inline-block;"><%=vo.getMytrip_rec() %></p>
						<input class="mybutton comment" type="button" value="댓글"> 
						<input class="mybutton suggestion" type="button" value="추천하기"> 
						
						<div class="bbang" ></div>
						
						</div>
					<%		
						}
					%>

<script>
/* function recommend(el){
	let no = $(el).data("no");
	console.log(no);
} */

$(function(){
	
	$('.suggestion').on('click', function(){
		let no = $(this).parent().find(".myTripno").text();
		mythis = this;
		
		
		
		
		 $.ajax({
			url : '/FireMoth/MyTripSuggestion.do',
			data : {"no" : no}, 
			type : 'post',
			dataType : 'json',
			success : function(res){
				if(res.flag == "성공"){
					console.log(res);
					$(mythis).parent().find(".suggestion_no").text(res.reno);
				}
			},
			error : function(asd){
				alert("상태 : " + asd.status);
			}
		}) 
	})
	
	$('.comment').on('click', function(){
		commentList(this);
		
	})
	
	$(document).on('click', '.commentSend', function(){
	
		no = $(this).parent().parent().find('.myTripno').text();
		cont = $('.myTrip_comment').val();
		
		$.ajax({
			url : '/FireMoth/CommentInsert.do',
			data : {"no" : no, "cont" : cont},
			type : 'post',
			dataType : 'json',
			success : function(res){
				
				if(res.flag == "성공"){
					alert("댓글 등록에 성공하였습니다.");
				
				}else{
					
					alert("댓글 등록에 실패하였습니다.");
					
				}
				
				
			},
			error : function(asd){
				
				alert("상태  : " + asd.status);
				
			}
			
		})
		
		
	})
	
})

function commentList(my){
		
		let no = $(my).parent().find(".myTripno").text();
		mythis = my;
		$.ajax({
			url : '/FireMoth/MytripComment.do',
			data : {"no" : no},
			dataType : 'json',
			type : 'post',
			success : function(res){
				console.log(res);
				code = "<div class='commentinput'>";
				code+= "<input class='myTrip_comment' type='text' placeholder='댓글 입력'>";
				code+= "<input class='commentSend' type='button' value='등록' >";
				$.each(res, function(i,v){
						
					code += "<div>";
					code += "<p style='display:none'>"+ v.mytripc_no + "</p>";
					code += "<span>"+ v.mem_id + "</span>";
					code += "<span>" + v.mytripc_content + "</span>";
					code += "<input type='button' value='수정' >";
					code += "<input type='button' value='삭제' >";
					code += "</div>";
				})
				
				code += "</div>";
				$(mythis).parent().find('.bbang').append(code);
			},
			error : function(asd){
				alert("상태 : " + asd.status);
				
			}
			
			
		})


}



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
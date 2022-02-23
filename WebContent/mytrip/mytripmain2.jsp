<%@page import="kr.or.ddit.cmm.vo.AtchFileVO"%>
<%@page import="kr.or.ddit.mytrip.vo.MyTripVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/FireMoth/css/aside.css">
<link rel="stylesheet" href="/FireMoth/css/header.css">
<link rel="stylesheet" href="/FireMoth/mytripcss/mytripmain.css">
<link rel="stylesheet" href="/FireMoth/css/button.css">
<title>나만의 여행지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
.fix_button{

	width: 40px;
    height: 25px;

}

.delete_button{
	width: 40px;
    height: 25px;
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
						<a href="#" class="aside_menu_a">나만의 여행지</a>
					</div>
					<div class="aside_menu" id="aside_menu2">
						<a href="#" class="aside_menu_a">추천 여행지</a>
					</div>
					<div class="aside_menu" id="aside_menu3">
						<a href="/FireMoth/MyTripStayCheck.do" class="aside_menu_a">나만의 여행지 등록</a>
				</div>
					</div>
			</div>

			<div id="content_box">
				<div id="content_box_container">

					<div id="mytrip_container">
						<h1 id="mytrip_h1">나만의 여행지</h1>
						<br>
						<p class="p mytrip_info_p">나만의 여행지를 소개해주세요!😊</p>
						<p class="p mytrip_info_p">소개된 여행지 중 마음에 드는 여행지의 숙소는 '따라가기'를
							통해 예약할수도 있어요👍</p>
						<br>

						<div class="mytrip_content_box">

							<div class="id_line">
								<div class="profile_img_div">
									<img alt="mytrip_profile" src="/FireMoth/img/nav_img4.jpg"
										class="profile_img" />
								</div>
								<div class="writer_id">
									<p class="p">작성자</p>
								</div>
							</div>

							<div class="img_line">
								<img alt="mytrip_img" src="/FireMoth/img/mytrip_img.jpg"
									class="mytrip_img" />
							</div>

							<div class="rec_line">
								<img alt="rec_img" src="/FireMoth/img/heart_img.PNG"
									class="rec_img" />
								<p class="p rec_num">추천수</p>
								<div class="rec_button_div_s">
									<button onclick="location='notice/insertNotice.jsp'"
										class="base_btn">추천</button>
									<button onclick="location='notice/updateNotice.jsp'"
										class="base_btn">따라가기</button>
								</div>
							</div>

							<div class="content_line">
								<p class="p">
									#제주도 #우도 #바다 #산책<br>
									<br>섬 전체가 하나의 거대한 관광자원인 제주도. 에메랄드빛 물빛이 인상적인 협재 해수욕장은 제주 대표
									여행지며, 파도가 넘보는 주상절리와 바다 위 산책로인 용머리 해안은 제주에서만 볼 수 있는 천혜의 자연경관으로
									손꼽힌다. 드라마 촬영지로 알려진 섭지코스는 꾸준한 사랑을 받고 있으며 한라봉과 흑돼지, 은갈치 등은 제주를
									대표하는 음식이다.
								</p>
							</div>

							<div class="coment_write_line">
								<div class="c_profile_img_div">
									<img alt="mytrip_profile" src="/FireMoth/img/nav_img4.jpg"
										class="c_profile_img" />
								</div>
								<input type="text" name="comment_write"
									placeholder="댓글을 입력해주세요." class="comment_input">
								<button type="submit" class="comment_btn">등록</button>
								<button type="reset" class="comment_btn">취소</button>
							</div>

							<div class="coment_show_line"></div>

						</div>
<script>
$(function(){
// 추천
$('.rec_button').on('click', function(){
	let no = $(this).parents('.mytrip_content_box').attr('idx');
	mythis = this;
	 $.ajax({
		url : '/FireMoth/MyTripSuggestion.do',
		data : {"no" : no},
		type : 'post',
		dataType : 'json',
		success : function(res){
			if(res.flag == "성공"){
				console.log(res);
				$(mythis).parents('.mytrip_content_box').find(".rec_num").text(res.reno);
			}
		},
		error : function(asd){
			alert("상태 : " + asd.status);
		}
	})
})
// 따라가기
$('.followbutton').on('click', function(){

	stay_id = $(this).val();

	$.ajax({
		url : '/FireMoth/MyTripFollow.do',
		data : {"stay_id" : stay_id},
		dataType : 'json',
		type : 'get',
		success : function(res){
			location.replace('/FireMoth/reservation/StayDetail.do?stay_id='+res.stay_id+'&atch_file_id='+res.atch_file_id);
		},
		error : function(asd){
			alert("해당상품은 찾을 수 없습니다.");
		}
	})
})

$('.fix_button').on('click', function(){

})
// 게시글 삭제
$('.delete_button').on('click', function(){
	let mythis = this;
	let mytrip_no = $(this).parents('.mytrip_content_box').attr('idx');

	if (confirm("정말 삭제하시겠습니까??") == true){    //확인

		 $.ajax({
			url : '/FireMoth/MyTripDelet.do',
			data : {"mytrip_no" : mytrip_no},
			dataType : 'json',
			type : 'get',
			success : function(res){
				alert(res.flag);
			},
			error : function(asd){
				alert("상태 : " + asd.status);
			}
		 })

	 }else{   //취소

	     return false;

	 }


})
// 댓글 등록
$('.send').on('click', function(){

		let mytrip_no = $(this).parents('.mytrip_content_box').attr('idx');
		let cont = $(this).parent().find('input').val();
		let mythis = this;

		$.ajax({
			url : '/FireMoth/CommentInsert.do',
			data : {"no" : mytrip_no, "cont" : cont},
			dataType : 'json',
			type : 'post',
			success : function(res){
				$(mythis).parent().find('input').val("");
				replyList(mythis);
				if(res.flag == "성공"){
					alert("댓글 등록에 성공하였습니다.");
				$(mythis).parents('.mytrip_content_box').find('.coment_show_line').css('display', 'none');
					displayCheck(mythis);
				}else{
					alert("댓글 등록에 실패하였습니다.");
				}

			},
			error : function(asd){
				alert("상태 : " + asd.status);
			}
		})
	})
// 취소 버튼
$('.reset').on('click', function(){
	$(this).parent().find('input').val("");
})


// 댓글 버튼
$('.pComment').on('click', function(){
	
	mdisplay = $(this).parents('.mytrip_content_box').find('.coment_show_line').css('display');
	
	if(mdisplay != "none"){
		$(this).parents('.mytrip_content_box').find('.coment_show_line').css('display', 'none');
	}else{
		
	$('.coment_show_line').css('display', 'none');
	
	displayCheck(this);
	}
	
	
})

// 댓글 삭제
$(document).on('click', '.replayDelete', function(){

	let mem_id = $(this).parent().find('span').data('value');
	let mytripc_no = $(this).attr('idx');
	let mythis = this;

	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		$.ajax({
			url : "/FireMoth/CommentDelete.do",
			data : {"mem_id" : mem_id, "mytripc_no" : mytripc_no},
			dataType : 'json',
			type : 'post',
			success : function(res){
			 	
				if(res.flag == "성공"){
					$(mythis).parents('.babamba').find('.baba').hide();
				}

			},
			error : function(asd){
				alert("상태 : " + asd.status);
			}
		})

	 }else{   //취소

	     return false;

	 }


})

// 댓글 수정 버튼 클릭
$(document).on('click', '.replyFix', function(){
	
	let mytripc_no = $(this).attr('idx');
	
	let content = $(this).parents('.babamba').find('.content').text();
	
	code = "<input class='replyTo replyUp' type='text' value='"+ content + "'>";
	code += "<input type='button' class='replyTo replyUpdate' idx='"+ mytripc_no + "' value='수정' name='replyUpdate'>";
	code += "<input type='button' class='replyTo replayReset' idx='"+ mytripc_no + "' value='취소' name='replayReset'>"
	$(this).parents('.babamba').find('.baba').hide();
	$(this).parents('.babamba').append(code);
})

// 댓글 수정 취소버튼 클릭
$(document).on('click', '.replayReset', function(){
	
	$(this).parents('.babamba').find('.replyTo').hide();
	$(this).parents('.babamba').find('.baba').show();
})


// 댓글 수정
$(document).on('click', '.replyUpdate', function(){
	mythis = this;	
	let cont = $('.replyUp').val();
	let mytripc_no = $(this).attr('idx');
	
	console.log(cont);
	console.log(mytripc_no);
	
	$.ajax({
		url : '/FireMoth/ReplyUpdate.do',
		data : {"cont" : cont, "mytripc_no" : mytripc_no},
		dataType : 'json',
		type : 'post',
		success : function(res){
			
			if(res.flag == "성공"){
				$(mythis).parents('.babamba').find('.replyTo').hide();
				$(mythis).parents('.babamba').find('.content').text(cont);
				$(mythis).parents('.babamba').find('.baba').show();
			}
			
			
		},
		error : function(asd){
			alert("상태 : " + asd.status);
		}
	})
	
})




})

// 댓글 div display 체크
function displayCheck(mythis){
	
	data = $(mythis).parents('.mytrip_content_box').find('.coment_show_line').css('display');
	if(data == "none"){
		$(mythis).parents('.mytrip_content_box').find('.coment_show_line').css('display', 'block');
		replyList(mythis);
	}else{
		$(mythis).parents('.mytrip_content_box').find('.coment_show_line').css('display', 'none');
	}

}

// 댓글 리스트
function replyList(my) {

	let mytrip_no = $(my).parents('.mytrip_content_box').attr('idx');
		mthis = my;
		$.ajax({
			url : '/FireMoth/MytripComment.do',
			data : {"mytrip_no" : mytrip_no},
			type : 'post',
			dataType : 'json',
			success : function(res){

				$(mthis).parents('.mytrip_content_box').find('.babamba').remove();
				code="";
				$.each(res, function(i, v){
					code += "<div class='babamba'>";
					code += "<div class='cc_line'>"
					code += "<span class='baba' data-value='"+v.mem_id +"' >" + v.mem_id  + " : "+"</span>" + "<span class='baba content'>" + v.mytripc_content + "</span>";
					code += "</div>"
					
					if(v.mem_id == v.memId){
					code += "<div class='c_line'>"
					code += "<input type='button' class='baba replyFix' idx='"+ v.mytripc_no + "' value='댓글수정' name='replyFix'>";
					code += "<input type='button' class='baba replayDelete' idx='"+ v.mytripc_no + "' value='댓글삭제' name='replyDelete'>";
					code += "</div>"
					}
					
					
					code += "</div>";
				})

				$(mthis).parents('.mytrip_content_box').find('.coment_show_line').append(code);

			},
			error : function(asd){
				alert("상태 : " + asd.status);
			}
		})
}
</script>




						<!-- 여기서 부터 -->
						<%
							List<MyTripVO> list = (List<MyTripVO>) request.getAttribute("list");
							long[] ficnt = (long[]) request.getAttribute("ficnt");
							List<AtchFileVO>[] atchList = (List<AtchFileVO>[]) request.getAttribute("atchList");
							String mem_id = (String)request.getAttribute("mem_id");
							for (int i = 0; i < list.size(); i++) {
								MyTripVO vo = list.get(i);
						%>
						<div class="mytrip_content_box" idx=<%=vo.getMytrip_no()%>>

							<div class="id_line" >
								<div class="profile_img_div">
									<img alt="mytrip_profile" src="/FireMoth/img/event_img2.jpg"
										class="profile_img" />
								</div>
								<div class="writer_id">
									<p class="p"><%=vo.getMem_id()%></p>
								</div>

						<%
							if(vo.getMem_id().equals(mem_id)){
						%>
						<div class="cc">
							<input type="button" class="bb fix_button" value="수정">
							<input type="button" class="bb delete_button" value="삭제">
						</div>
						<%
							}

						%>
								
							</div>

							<div class="img_line">
								<%
									if (atchList != null) {

											for (int v = 0; v < ficnt[i]; v++) {
								%>
								<img alt="mytrip_img"
									src="<%=request.getContextPath()%>
						/filedownload.do?fileId=<%=vo.getAtch_file_id()%>
						&fileSn=<%=atchList[i].get(v).getFileSn()%>"
									class="mytrip_img" />
								<%
									}

										}
								%>

							</div>

							<div class="rec_line">
								<img alt="rec_img" src="/FireMoth/img/heart_img.PNG"
									class="rec_img" />
								<p class="p rec_num"><%=vo.getMytrip_rec()%></p>
								<div class="rec_button_div">
									<input type="button" class="base_btn rec_button" value="추천">


									<button type="button" name="stay_id" value="<%=vo.getStay_id() %>" class="base_btn followbutton">따라가기</button>


								</div>
							</div>

							<div class="content_line">
								<p class="p"><%=vo.getMytrip_title()%><br>
									<br><%=vo.getMytrip_content()%></p>
								<br>
								<div class="c_start_div">
									<p class="pComment pp">댓글 모두보기</p> 
								</div>
							</div>


							<div class="coment_write_line">
								<div class="c_profile_img_div">

									<img alt="mytrip_profile" src="/FireMoth/img/event_img2.jpg"
										class="c_profile_img" />
								</div>
								<input type="text" name="comment_write"
									placeholder="댓글을 입력해주세요." class="comment_input">
								<button type="submit" class="comment_btn send">등록</button>
								<button type="reset" class="comment_btn reset">취소</button>
							</div>

							<div class="coment_show_line" idx="33" style="display:none"></div>

						</div>
						<%
							}
						%>
						<!-- 여기까지 지우기 -->
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
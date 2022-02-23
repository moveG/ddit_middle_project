<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="/FireMoth/css/only_headerpage.css">
<link rel="stylesheet" href="/FireMoth/css/header.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/FireMoth/memberJoin/join.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script>

$(function(){
   pwdvalue = null;

   ghcheck = '<%=request.getParameter("type") %>';


   alert(ghcheck);



   $('#id').on('keyup', function(){

      idvalue=$(this).val();

      // 정규식 체크
      idreg = /^[a-z][a-zA-Z0-9]{3,11}$/;

      if(!(idreg.test(idvalue))){
         $(this).css('border', '3px solid red')
         $('#idcheck').prop('disabled', true).css('background', 'lightblue').css('border', '1px solid lightblue');
      }
      else{
         $(this).css('border', '3px solid blue')
         $('#idcheck').prop('disabled', false).css('background', 'lightseagreen');;
      }

   })



   $('#idcheck').on('click', function(){

      idvalue = $('#id').val();
      console.log(idvalue);

      // 공백체크
      if(idvalue.length < 1){
         // alert("id를 입력하세요");
         $('#idspan').html('ID를 입력하세요.')
         return false;
      }

      $.ajax({
         url : "/FireMoth/MemberCheck.do",
         type : 'get',
         data : {'id' : idvalue},
         success : function(res){

            if(res.flag == "이미 사용중인 ID 입니다."){
               $('#idspan').html(res.flag).css('color', 'red');
               $('#id').css('border', '2px solid red');
            }

            $('#idspan').html(res.flag).css('color', 'red');
         },
         error : function(xhr){
            alert('상태 : ' + xhr.status);
         },
         dataType : 'json'
      })


   })

   $('#zipbtn').on('click', function(){

      window.open('zipsearch.html', "우편번호 찾기", "width=500 height=auto");

   })


   //////////////////////////////////////정규식 체크//////////////////////////////////////////////////
   $('#name').on('keyup', function(){

      namevalue = $(this).val().trim()
      namereg = /^[가-힣]{2,10}$/;

      if(namereg.test(namevalue)){
         $(this).css('border', '2px solid blue');
      }
      else{
         $(this).css('border', '2px solid red');
      }

   })

   // 패스워드 검사
   $('#pwd').on('keyup', function(){

      pwdvalue = $(this).val().trim()
      pwdreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*-_=+]).{8,20}$/

      if(pwdreg.test(pwdvalue)){
         $(this).css('border', '2px solid blue');
      }
      else{
         $(this).css('border', '2px solid red');
      }

   })

   // 패스워드 확인
   $('#pwdcheck').on('keyup', function(){

      pwdCheck = $(this).val().trim()
      if(pwdCheck == pwdvalue){
         $(this).css('border', '2px solid blue');
         $('#pwspan1').text("동일한 비밀번호 입니다.").css('color', 'blue');
      }
      else{

         $(this).css('border', '2px solid red');
         $('#pwspan1').text("비밀번호가 동일하지 않습니다.").css('color', 'red');

      }

   })

   // 전화번호 검사
   $('#tel').on('keyup', function(){
      telvalue = $(this).val().trim()
      telreg = /^\d{2,3}\d{3,4}\d{4}/

      if(telreg.test(telvalue)){
         $(this).css('border', '2px solid blue');
      }
      else{
         $(this).css('border', '2px solid red');
      }

   })

   // 이메일 검사
      $('#email').on('keyup', function(){
      emailvalue = $(this).val().trim()
      emailreg = /^[a-zA-Z0-9+_!@#$%^&*-~]+@[a-zA-Z0-9-_]+(\.[a-zA-Z]+){1,2}$/

      if(emailreg.test(emailvalue)){
         $(this).css('border', '2px solid blue');
      }
      else{
         $(this).css('border', '2px solid red');
      }

   })

   //   $('#send').on('click', function(){}) //type = button 일때 // onsubmit="return false;가 없을때  사용
   // 회원 가입 버튼
   $('form').on('submit', function(){


      fdatas = $('form').serialize()


      if(ghcheck == "guest"){

      $.ajax({
          url : '/FireMoth/GuestInsert.do',
         type : 'post',
         data : fdatas,
         success : function(res){
            alert("회원가입" + " " + res.flag);
            if(res.flag == "성공") location.replace('memberLogin.jsp');

            if(res.flag == "실패") alert("정보를 확인하고 다시 시도해 주세요.");

         },
         error : function(asd){
           alert("상태 : " + asd.status);
         },
         dataType : 'json'


       })
      }
      else if(ghcheck == "host"){

         $.ajax({
            url : '/FireMoth/HostInsert.do',
            type : 'post',
            data : fdatas,
            success : function(res){
               alert("회원가입" + " " + res.flag);
               if(res.flag == "성공") location.replace('memberLogin.jsp');

               if(res.flag == "실패") alert("정보를 확인하고 다시 시도해 주세요.");
            },
            error : function(asd){
               alert("상태 : " + asd.status);
            },
            dataType : 'json'


         })

      }
   })


   $('#check').on('click', function(){
      var params = {answer : $("#answer").val()};

      $.ajax({
         url : "/FireMoth/ChkAnswer.do",
         data : params,
         type : "get",
         success : function(data){
            if(data.result == "200"){
               $('#send').prop('disabled', false).css('background', 'lightseagreen');
               alert('확인 되었습니다.')
            }
            else{
               alert('입력 문구를 다시 확인해 주세요.')

            }

         },
         dataType : "json"
      });
   })



});


function getImg(){

   var rand = Math.random();
   var url = '/FireMoth/CaptChaImg.do?rand='+rand
   document.querySelector('#ccImg').setAttribute('src', url);

}

</script>
<style>
.btn-sm{
	width: 83px;
    height: 35px;
    border-radius: 5px;
    border:1px solid lightseagreen;
    background: lightseagreen;
    color : white;
    cursor: pointer;
    margin-left: 10px;
    margin-top: 2px;
}

#send{
	width: 83px;
    height: 35px;
    border-radius: 5px;
    border:1px solid lightblue;
    background: lightblue;
    color : white;
    cursor: pointer;
    margin-left: 10px;
    margin-top: 2px;
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
		<div id="content_box">
			<div id="content_box_container">
				<div id="joinjoin_box">
					<div id="joinjoinjoin_box">
						   <h2>회원가입</h2>
						   <br>
						   <form class="form-horizontal" onsubmit="return false;" >

						      <div class="form-group" >
						         <label  class="control-label col-sm-2" for="id">아이디</label>
						         <div class="col-sm-2">
						            <input type="text" name="mem_id" class="form-control" id="id"
						               placeholder="Enter id">
						         </div>
						         <div class="join_btn_box">
							         <input type="button" class="btn-success btn-sm" id="idcheck"
							            value="중복검사"> <span id="idspan"></span>
						         </div>
						      </div>

						      <div class="form-group">
						         <label class="control-label col-sm-2" for="name">이름</label>
						         <div class="col-sm-2">
						            <input type="text" name="mem_name" class="form-control" id="name"
						               placeholder="Enter name">
						         </div>
						      </div>

						      <div class="form-group">
						         <label class="control-label col-sm-2" for="bir">생년월일</label>
						         <div class="col-sm-2">
						            <input type="date" name="mem_bir" class="form-control" id="bir"
						               placeholder="Enter bir">
						         </div>
						      </div>

						      <div class="form-group">
						         <label class="control-label col-sm-2" for="pwd">비밀번호</label>
						         <div class="col-sm-2">
						            <input type="password" name="mem_pass" class="form-control" id="pwd"
						               placeholder="Enter password">
						               <br>
						               <span style="color: red" id='pwspan'>패스워드는 대문자,소문자,숫자를 조합하여 8~20자까지 가능합니다.</span>
						         </div>
						      </div>

						      <div class="form-group">
						         <label class="control-label col-sm-2" for="pwdcheck">비밀번호 확인</label>
						         <div class="col-sm-2">
						            <input type="password" name="mem_passCheck" class="form-control" id="pwdcheck"
						               placeholder="Enter password"> <span id='pwspan1'></span>
						         </div>
						      </div>

						      <div class="form-group">
						         <label class="control-label col-sm-2" for="tel">전화번호</label>
						         <div class="col-sm-2">
						            <input type="text" name="mem_tel" class="form-control" id="tel"
						               placeholder="Enter hp">
						         </div>
						      </div>

						      <div class="form-group">
						         <label class="control-label col-sm-2" for="email">이메일</label>
						         <div class="col-sm-2">
						            <input type="text" name="mem_email" class="form-control" id="email"
						               placeholder="Enter email">
						         </div>
						      </div>

						      <div class="form-group">
						         <label class="control-label col-sm-2" for="zip">우편번호</label>
						         <div class="col-sm-2">
						            <input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호">
						         </div>
						         <input type="button" class="btn btn-success btn-sm" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						      </div>

						      <div class="form-group">
						         <label class="control-label col-sm-2" for="add">주소</label>
						         <div class="col-sm-3">
						            <!-- <input type="text" name="mem_add" class="form-control" id="add"
						               placeholder="Enter add"> -->
						            <input type="text" name="mem_add" id="sample6_address" class="form-control" placeholder="주소">
						         </div>
						      </div>

						      <div class="form-group">
						         <label class="control-label col-sm-2" for="add">상세주소</label>
						         <div class="col-sm-3">
						            <!-- <input type="text" name="mem_add" class="form-control" id="add"
						               placeholder="Enter add"> -->
						            <input type="text" name="mem_add1" id="sample6_detailAddress" class="form-control" placeholder="상세주소">
						         </div>
						      </div>

						      <div class="form-group">
						         <label class="control-label col-sm-2" for="add">참고항목</label>
						         <div class="col-sm-3">
						            <!-- <input type="text" name="mem_add" class="form-control" id="add"
						               placeholder="Enter add"> -->
						            <input type="text" name="mem_add2" id="sample6_extraAddress" class="form-control" placeholder="참고항목">
						         </div>
						      </div>

						    <div id="chptCha">
						      <label class="control-label col-sm-2" for="captcha" style="display:block">자동 회원가입 방지</label>
							      <div id="aa">
								      <div class="form-group" style="overflow: hidden" id="btnbtnbtnbtnbtn">
								            <img id="ccImg"alt="캡챠이미지" src="/FireMoth/CaptChaImg.do" title="캡챠이미지">
								            <div id="ccaudio" style="display: none"></div>
								      </div>

								      <div class="form-group chatCha" style="padding: 3px">
								         <input id="reload" type="button" class="btn btn-success btn-sm" onclick="JavaScript:getImg()" value="새로고침"/>
								      </div>
							       </div>

						      <div class="form-group" style="padding: 3px" id="okbtnbox">
						         <input id="answer" class="form-control" type="text" value="">
						         <input class="btn btn-success btn-sm"  id="check" type="button" value="확인"/>
						      </div>
						    </div>


						      <div class="form-group">
						         <div class="col-sm-offset-2 col-sm-10">
						            <button id="send"  type="submit" disabled>회원가입</button>
						            <span id="joinspan"></span>
						         </div>
						      </div>
						   </form>
					</div>
				</div>


   <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

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
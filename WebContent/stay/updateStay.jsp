
<%@page import="kr.or.ddit.stay.vo.CoDetailVO"%>
<%@page import="kr.or.ddit.cmm.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.stay.vo.StayVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    		String host_no = (String)request.getAttribute("host_no");
    		StayVO vo = (StayVO)request.getAttribute("stay");
    		List<AtchFileVO> filevo = (List<AtchFileVO>)request.getAttribute("atchFileList");
    		CoDetailVO covo = (CoDetailVO)request.getAttribute("codetail");
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/FireMoth/css/aside.css">
  <link rel="stylesheet" href="/FireMoth/css/header.css">
<title>마이페이지-호스트</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  
  
  
  <script>
  $(function(){

		 //호스트 게스트 판별 후 로그아웃  
	    $.ajax({
	       url : '/FireMoth/LoginCheck.do',
	       type : 'post',
	       dataType : 'json',
	       success : function(res){
	         /*   alert(res.division); */
	          if(res.division == "guest" || res.division == "host" ){
	             $('.login').hide();
	             code = '<a href="/FireMoth/memberJoin/memberLogin.jsp"' 
	             code += 'onclick="session();" class="loginbox logout">로그아웃</a>';
	             $('.mem').html(code);
	          }
	       },
	       error : function(asd){
	        /*   alert("상태 : " + asd.status); */
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
label{
	display: inline-block;
	width: 150px;
	height: 40px;
}
#form_con{
	width: 600px;
	border: 2px solid lightgray;
	padding: 10px;
	border-radius: 10px;
	/* display: flex;
	justify-content: center; */
}
#formform{
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
							
							<a href="" class="private_menu_icon" id="menu_icon1">
								<img alt="마이메뉴" src="/FireMoth/img/mymenu_icon.png" class="private_menu_icon_img"/>
								<p>마이메뉴</p>
							</a>
							
							<a href="#" class="private_menu_icon" id="menu_icon2">
								<img alt="예약내역" src="/FireMoth/img/document_icon.png" class="private_menu_icon_img"/>
								<p>예약내역</p>
							</a>
							
							<a href="#" class="private_menu_icon" id="menu_icon3">
								<img alt="/FireMoth/CartList.do" src="/FireMoth/img/shopping_cart_icon.png" class="private_menu_icon_img"/>
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
						<div class="aside_menu" id="aside_menu4"><a href="/FireMoth/CirChart.do" class="aside_menu_a">매출통계</a></div>
					</div>
				</div>
				
				<div id="content_box">
					<div id="content_box_container">


					<h1>숙소 수정하기</h1>

					<form action="/FireMoth/updateStay.do" method="post"
						enctype="multipart/form-data">

	
						 <input type="hidden" value="99" name="HOST_NO"><br>
						<input type="hidden" value="<%=vo.getStay_id() %>" name="STAY_ID">
						<input type="hidden" value="<%=covo.getCo_id() %>" name="CO_ID">
						<input type="hidden" value="<%=vo.getAtch_file_id() %>"
							name="atchFileId"> <label>이름:</label> <input type="text"
							name="STAY_NAME" value="<%=vo.getStay_name()%>"><br>

						<label>가격: </label> <input type="text" name="STAY_PRICE"
							value="<%=vo.getStay_price()%>"><br> <label>기존 주소:</label> <input
							type="text" name="STAY_ADD" value="<%=vo.getStay_add()%>"
							disabled><br> <label>우편번호:</label> <input
							type="text" id="sample6_postcode" class="form-control"
							placeholder="우편번호"> <input type="button"
							class="btn btn-success btn-sm"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>



						<label>주소:</label> <input type="text" name="STAY_ADD1"
							value="<%=vo.getStay_add()%>" id="sample6_address"
							class="form-control" placeholder="주소"><br> 

						<label>상세주소:</label>
						<input type="text" name="STAY_ADD2" id="sample6_detailAddress"
							class="form-control" placeholder="상세주소"><br>
							

						<label>참고항목:</label>
						<input type="text" name="STAY_ADD3" id="sample6_extraAddress"
							class="form-control" placeholder="참고항목"> <br> 
							
							<label>소개 : </label>
							<textarea rows="5" cols="" name="STAY_INFO"
							><%=vo.getStay_info()%></textarea><br> 




						<label>수용인원:  </label><input type="text" name="STAY_PNUM" value="<%=vo.getStay_pnum() %>"><br> 기존 첨부파일
						<%
											if(filevo != null){
												for(AtchFileVO fileVO : filevo){
													
										%>
						<div>
							<img id ="deimg"
								src="<%=request.getContextPath()%>/filedownload.do?fileId=<%=fileVO.getAtchFileId()%>&fileSn
														=<%=fileVO.getFileSn()%>">


						</div>


						<%			
												}
												
											}
										
									
										%>

						새로운 첨부파일 : <input type="file" name="atchFile" multiple><br><br>




						편의시설 수정:<br> <input type="checkbox" name="co_hair" value="1">헤어드라이기<br>
						<input type="checkbox" name="co_bath" value="1">욕조<br>
						<input type="checkbox" name="co_bidet" value="1">비데<br>
						<input type="checkbox" name="co_water" value="1">온수<br>
						<input type="checkbox" name="co_wash" value="1">샤워기<br>
						<input type="checkbox" name="co_bed" value="1">침대<br>
						<input type="checkbox" name="co_internet" value="1">무선인터넷
						<br> <input type="checkbox" name="co_tem" value="1">냉
						난방<br> <input type="checkbox" name="co_emer" value="1">화재경보기<br>
						<input type="checkbox" name="co_co" value="1">일산화질소경보기<br>
						<input type="checkbox" name="co_re" value="1">냉장고<br>
						<input type="checkbox" name="co_et" value="1">전자레인지<br>
						<input type="checkbox" name="co_gas" value="1"> 가스레인지 혹은
						인덕션<br> <input type="checkbox" name="co_rice" value="1">
						밥솥<br> <input type="checkbox" name="co_park" value="1">
						주차장<br> <input type="submit" value="숙소 수정">
					</form>






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
</body>
</html>
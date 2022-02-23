<%@page import="kr.or.ddit.reser.vo.ReservationVO"%>
<%@page import="kr.or.ddit.reser.vo.StayVO"%>
<%@page import="kr.or.ddit.reser.vo.CoVO"%>
<%@page import="kr.or.ddit.cmm.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<AtchFileVO> atchList = (List<AtchFileVO>) request.getAttribute("atchList");
	ReservationVO rvo = (ReservationVO) request.getAttribute("rvo3");
	String stay_id = (String) request.getAttribute("stay_id");
	CoVO vo = (CoVO) request.getAttribute("coList"); 
	StayVO svo = (StayVO) request.getAttribute("stayDetail");
	int cart_no = (Integer) request.getAttribute("cartNo");
	int rbutton = (Integer) request.getAttribute("rbutton");
	boolean flag = true;
	
	if(rvo == null){
		flag = false;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="../js/jquery.serializejson.min.js"></script>

		<title>숙소 상세정보</title>
		
		<script>
			var adult = 0;
			var child = 0;
			var baby = 0;
			var price = 0;
			var people = 0;
			var pnum = <%= svo.getStay_pnum()%>;
			var reser_ckin = 0;
			var reser_ckout = 0;
			var ckin = 0;
			var ckout = 0;
			var stay_id = "<%= stay_id %>";
			var rbutton = "<%= rbutton %>";
			var rnum = 0;
			var currentTime = new Date();
			var year = currentTime.getFullYear();
			var month = ('0' + (currentTime.getMonth() + 1)).slice(-2);
			var day = ('0' + currentTime.getDate()).slice(-2);
			var currentTime = year + '-' + month  + '-' + day;
			var reser_no = 0;
			
			peopleServer = function(){
				price = (adult + child + baby) * <%= svo.getStay_price()%>;
				people = adult + child + baby;
				if(people > pnum){
					alert("숙소 인원보다 많습니다.");
					adult = 0;
					child = 0;
					baby = 0;
					$('#adult option:eq(0)').prop('selected', true);
					$('#child option:eq(0)').prop('selected', true);
					$('#baby option:eq(0)').prop('selected', true);
								
					$('#price1').html("");
					$('#price2').val("");
				}else{
					$('#price1').html(price);
					$('#price2').val(price);
				}
			}
			
			reserListServer = function(){
				$.ajax({
					url : '/FireMoth/reservation/ReserList.do',
					type : 'get',
					data : {"stay_id" : stay_id},
					dataType : 'json',
					success : function(res){
						code = "";
						$.each(res, function(i, v){
							code += "사용불가 시간" + v.ckin + " ~ " + v.ckout;
						})
						$('#reserList').html(code);
					},
					error : function(asd){
						alert("상태 : " + asd.status);
					}
				})
			}
			
			$(function(){
				//편의시설 숨기기
				$('.coDetail0').hide();
				$('#cbutton').hide();
				reserListServer();
				<% 
				if(flag != false){
				%>
					$('#reserTable').hide();
					$('#rbutton').hide();
					$('#cbutton').show();
					rnum = <%= rvo.getReser_no() %>;
				<%
				}else{
				%>
					$('#reserTable').show();
					$('#rbutton').show();
					$('#cbutton').hide();
				<% 
				}
				%>
				
				//인원수 계산
				$('#adult').change(function(){
					adult= parseInt($(this).val());
					peopleServer();
				})
				$('#child').change(function(){
					child= parseInt($(this).val());
					peopleServer();
				})
				$('#baby').change(function(){
					baby = parseInt($(this).val());
					peopleServer();
				})
								
				//예약
				$('#rbutton').on('click', function(){
					rdatas = $('#reserFrom').serialize();

					$.ajax({
						url : '/FireMoth/reservation/ReserStay.do',
						type : 'post',
						data : rdatas,
						dataType : 'json',
						success : function(res){
							if(res.flag == "성공"){
								alert("예약성공!");
								$('#reserTable').hide();
								$('#rbutton').hide();
								$('#cbutton').show();
								rvo = res.num;
								reserListServer();
							}else{
								alert("예약실패!");
							}
						},
						error : function(asd){
							alert("상태 : " + asd.status);
						}
					})
				})
				
				//중복체크
				$('#reser_ckin').on('change', function(){
					ckin = $(this).val();
					
					if(ckin <= currentTime){
						alert("예약이 불가능한 시간입니다.");
					}
				})
				$('#reser_ckout').on('change', function(){
					ckout = $(this).val();
					
					if(ckout <= currentTime){
						alert("예약이 불가능한 시간입니다.");
					}
				})
				$('#ckbutton').on('click', function(){
					$.ajax({
						url : '/FireMoth/reservation/ReserCheck.do',
						type : 'get',
						data : {"reser_ckin" : ckin,
							   "reser_ckout" : ckout,
							       "stay_id" : stay_id},
						dataType : 'json',
						success : function(res){
							if(res.flag == "중복"){
								alert("중복된 예약이 존재합니다.");
							}else{
								alert("예약이 가능합니다.");
							}
						},
						error : function(asd){
							alert("상태 : " + asd.status);
						}
					})
				})
				
				//취소
				$('#cbutton').on('click', function(){
					$.ajax({
						url : '/FireMoth/reservation/ReserCancel.do',
						type : 'get',
						data : {"reser_no" : rnum},
						dataType : 'json',
						success : function(res){
							if(res.flag == "성공"){
								alert("예약을 취소했습니다.");
								$('#reserTable').show();								
								$('#rbutton').show();
								$('#cbutton').hide();
								reserListServer();
							}else{
								alert("예약 취소에 실패했습니다.");
							}
						},
						error : function(asd){
							alert("상태 : " + asd.status);
						}
					})
				})
			})
		</script>
		<style>
			#reserList{
				width : 80%;
				height : 100px;
				border : 3px solid red;
			}
		</style>
	</head>
	<body>
		<div>
			<p>숙소명 : <%= svo.getStay_name() %></p>
			<p>숙소주소 : <%= svo.getStay_add()%></p>
			<p>숙소인원 : <%= svo.getStay_pnum()%></p>
			<p>숙소정보 : <%= svo.getStay_info()%></p>
			<p>숙소가격 : <%= svo.getStay_price()%></p>
		</div>
		<div>
			<p>
			<%
				if(atchList != null){
					for(AtchFileVO fileVO : atchList){
			%>			
						<img src="<%= request.getContextPath() %>/filedownload.do?fileId=<%= fileVO.getAtchFileId() %>&fileSn=<%= fileVO.getFileSn() %>">
			<%			
					}
				}
			%>
			</p>
			<p class="coDetail<%= vo.getCo_hair()%>">헤어드라이어</p>
			<p class="coDetail<%= vo.getCo_bath()%>">욕조</p>
			<p class="coDetail<%= vo.getCo_bidet()%>">비데</p>
			<p class="coDetail<%= vo.getCo_water()%>">온수</p>
			<p class="coDetail<%= vo.getCo_wash()%>">세탁기</p>
			<p class="coDetail<%= vo.getCo_bed()%>">침대</p>
			<p class="coDetail<%= vo.getCo_internet()%>">무선인터넷</p>
			<p class="coDetail<%= vo.getCo_tem()%>">냉난방</p>
			<p class="coDetail<%= vo.getCo_emer()%>">화재경보기</p>
			<p class="coDetail<%= vo.getCo_co()%>">일산화탄소경보기</p>
			<p class="coDetail<%= vo.getCo_re()%>">냉장고</p>
			<p class="coDetail<%= vo.getCo_et()%>">전자레인지</p>
			<p class="coDetail<%= vo.getCo_gas()%>">가스레인지</p>
			<p class="coDetail<%= vo.getCo_rice()%>">전기밥솥</p>
			<p class="coDetail<%= vo.getCo_park()%>">주차장</p>
		</div>
		<form id="reserFrom" onsubmit="return false;">
			<table id="reserTable" border="1">
				<tr>
					<td>성인</td>
					<td>
					<select class="pnum" id="adult" name="people_a">
						<option value="0" selected>0</option>
						<%
						int onum = svo.getStay_pnum();
						
						for(int i = 1; i <= onum; i++){
						%>
							<option value="<%= i %>"><%= i %></option>
						<%	
						}
						%>
					</select>
					</td>
				</tr>
				<tr>
					<td>어린이</td>
					<td>
					<select class="pnum" id="child" name="people_c">
						<option value="0" selected>0</option>
						<%
						for(int i = 1; i <= onum; i++){
						%>
							<option value="<%= i %>"><%= i %></option>
						<%	
						}
						%>
					</select>
					</td>
				</tr>	
				<tr>
					<td>아기</td>
					<td>
					<select class="pnum" id="baby" name="people_b">
						<option value="0" selected>0</option>
						<%
						for(int i = 1; i <= onum; i++){
						%>
							<option value="<%= i %>"><%= i %></option>
						<%	
						}
						%>
					</select>
					</td>
				</tr>
				
				<tr>
					<td>가격</td>
					<td>
					<p id="price1"></p>
					</td>
				</tr>
				<tr>
					<td>체크인</td>
					<td><input type="date" name="reser_ckin" id="reser_ckin"></td>
				</tr>
				<tr>
					<td>체크아웃</td>
					<td><input type="date" name="reser_ckout" id="reser_ckout"></td>
				</tr>
				<tr>
					<td>중복체크</td>
					<td><input type="button" id="ckbutton" value="중복체크"></td>
				</tr>
			</table>
			
			<input type="hidden" name="stay_id" value="<%= stay_id %>">
			<input type="hidden" name="cart_no" value="<%= cart_no %>">
			<input type="hidden" name="reser_price" id="price2">
			<input type="hidden" name="mem_id" value="a001">
			
			<button id="rbutton" type="submit">예약</button>
			<button id="cbutton" type="submit">취소</button>
		</form>
		<br>
		<div id="reserList"></div>
	</body>
</html>
loginCheckServer = function(){
	//로그인
	$.ajax({
		url : '/FireMoth/LoginCheck.do',
		type : 'post',
		dataType : 'json',
		success : function(res){
			
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
}

peopleCountServer = function(){
	if((adult + child + baby) > pnum){
		alert("최대 인원보다 많이 예약할 수 없습니다.");
		adult = 0;
		child = 0;
		baby = 0;
		$('#adult option:eq(0)').prop('selected', true);
		$('#child option:eq(0)').prop('selected', true);
		$('#baby option:eq(0)').prop('selected', true);
	}
}

duplicateCheckServer = function(){
	if(sdd == "" || edd == ""){
		alert("기간 설정이 미완료인 상태입니다.");
	}else{
		$.ajax({
			url : '/FireMoth/reservation/ReserCheck.do',
			type : 'get',
			data : {"reser_ckin" : sdd,
				   "reser_ckout" : edd,
				       "stay_id" : stay_id},
			dataType : 'json',
			success : function(res){
				if(res.flag == "중복"){
					alert("중복된 기간이 존재합니다.");
					$('#reserFrom')[0].reset();
					$('#price1').html("");
				}else{
					alert("예약이 가능합니다.");
				}
			},
			error : function(asd){
				alert("상태 : " + asd.status);
			}
		})
	}	
}

cartInsertServer = function(){
	$.ajax({
		url : '/FireMoth/CartInsert.do',
		data : {"stay_id" : stay_id},
		dataType : 'json',
		success : function(res){
			alert(res.flag);
		},
		error : function(a){
			alert("상태 : " + a.status);
		}
	})
}

reserInsertServer = function(){
	if(sdd == "" || edd == ""){
		alert("기간 설정이 미완료인 상태입니다.");
	}else{
		$.ajax({
			url : '/FireMoth/reservation/ReserCheck.do',
			type : 'get',
			data : {"reser_ckin" : sdd,
				   "reser_ckout" : edd,
				       "stay_id" : stay_id},
			dataType : 'json',
			success : function(res){
				if(res.flag == "중복"){
					alert("중복된 기간이 존재합니다.");
					$('#reserFrom')[0].reset();
					$('#price1').html("");
				}else{
					$.ajax({
						url : '/FireMoth/reservation/ReserStay.do',
						type : 'post',
						data : rdatas,
						dataType : 'json',
						success : function(res){
							if(res.flag == "성공"){
								alert("예약 완료!");
								$('#reserTable').hide();
								$('#reserOk').show();
								$('#rbutton').hide();
								$('#ckbutton').hide();
								$('#jbutton').hide();
								$('#cbutton').show();
								
								rnum = res.num;

								location.replace("/FireMoth/Payment.do?rnum=" + rnum);
							}else{
								alert("예약 실패!");
							}
						},
						error : function(asd){
							alert("상태 : " + asd.status);
						}
					})
				}
			},
			error : function(asd){
				alert("상태 : " + asd.status);
			}
		})
	}	
}

reserCancelServer = function(){
	if(confirm("예약을 취소하시겠습니까?") == true){	//확인
		$.ajax({
			url : '/FireMoth/reservation/ReserCheck.do',
			type : 'get',
			data : {"reser_no" : rnum},
			dataType : 'json',
			success : function(res){
				location.reload();
			},
			error : function(asd){
				alert("상태 : " + asd.status);
			}
		})
		
		$.ajax({
			url : '/FireMoth/reservation/ReserCancel.do',
			type : 'get',
			data : {"reser_no" : rnum},
			dataType : 'json',
			success : function(res){
				if(res.flag == "성공"){
					alert("예약취소 성공!");
					$('#reserTable').show();
					$('#reserOk').hide();
					$('#rbutton').show();
					$('#jbutton').show();
					$('#ckbutton').show();
					$('#cbutton').hide();
					$('#reserFrom')[0].reset();
					$('#price1').html("");
				}else{
					alert("예약취소 실패!");
				}
			},
			error : function(asd){
				alert("상태 : " + asd.status);
			}
		})
		
		location.reload();
	}else{//취소
	     return false;
	}
}
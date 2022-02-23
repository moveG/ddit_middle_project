memberCheckServer = function(){
	$.ajax({
		url : '/FireMoth/HostCheck.do',
		type : 'get',
		data : {"stay_id" : stay_id,
				"mem_id" : mem_id},
		dataType : 'json',
		success : function(res){
			if(res.flag == "호스트"){
				$('.rpButton').show();
			}else{
				$('.rpButton').hide();
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

reserCheckServer = function(){
	$.ajax({
		url : '/FireMoth/ReserCheck.do',
		type : 'get',
		data : {"stay_id" : stay_id,
				"mem_id" : mem_id},
		dataType : 'json',
		success : function(res){
			if(res.flag == "아직"){
				$('#reviewInsertButton').hide();
			}else{
				$('#reviewInsertButton').show();
			}
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

reviewListServer = function(){
	$.ajax({
		url : '/FireMoth/ReviewList.do',
		type : 'get',
		data : {"stay_id" : stay_id},
		dataType : 'json',
		success : function(res){
			code = '<div id="reviewTitle">'
			code += '<h3 id="rTitle">리뷰 게시판</h3>';
			code += '<p id="spacep"></p>';
			code += '<button type="button" class="btn2" id="reviewInsertButton">작성</button>';
			code += '</div>';
			
			$.each(res, function(i, v){
				code += '<div class="reviewDetail" id="review' + v.review_no + '">';
				code += '<div class="reviewContent" style="margin-top:0px;margin-bottom:0px;padding-bottom:0px;padding-top:0px;">';
				code += '작성자 : ' + v.mem_id +'<br>';
				code += '내용 : ' + v.review_content +'<br>';
				code += '</div>';
				code += '<div class="reviewDate"style="margin-top:0px;padding-top:0px;padding-bottom:0px;margin-bottom:0px;">';
				code += '작성일 : ' + v.review_mod +'<br>';
				code += '</div>';
				code += '<div id="wbtn' + v.review_no + '" class="reviewButton reviewButton' + v.review_no + '">';
				code += '<button type="button" class="btn2" id="reviewUpdateButton" idx="' + v.review_no + '">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;';
				code += '<button type="button" class="btn2" id="reviewDeleteButton" idx="' + v.review_no + '">삭제</button><br>';
				code += '</div>';
				code += '<div id="reviewReply' + v.review_no + '" value="' + v.review_no + '"></div>';
				code += '</div>';
				
				review_no = v.review_no;
				
				$.ajax({
					url : '/FireMoth/WriterCheck.do',
					type : 'get',
					data : {  "stay_id" : stay_id,
							   "mem_id" : mem_id,
							"review_no" : review_no},
					dataType : 'json',
					success : function(res){
						if(res.flag == "작성자"){
							$('#wbtn' + review_no).show();
						}else{
							$('#wbtn' + review_no).hide();
						}
					},
					error : function(xhr){
						alert("상태 : " + xhr.status);
					}
				})
				
				$.ajax({
					url : '/FireMoth/ReviewReply.do',
					type : 'get',
					data : {"review_no" : review_no},
					dataType : 'json',
					success : function(ress){
						code2 = '<div id="replyContent" style="margin-left:0px;padding-left:0px;padding-right:0px;margin-right: 0px;"><p id="rea_start">└&nbsp;&nbsp;</p><p id="rea_content">' + ress.reviewa_content + '</p></div>';
						code2 += '<div id="replyDate" style="margin-right:0px;padding-right:0px;margin-right:0px;padding-right:0px;padding-top: 0px;padding-bottom: 0px;margin-bottom: 0px;margin-top: 0px;">작성일 : ' + ress.reviewa_date + '</div>';
						code2 += '<div class="reviewButton rpButton replyButton' + ress.review_no + '" style="padding-right:0px;margin-right:0px;margin-right:0px;padding-right:0px;margin-right:0px;padding-right:0px;">';
						code2 += '<button type="button" class="btn2" id="replyUpdateButton" idx="' + ress.review_no + '">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;';
						code2 += '<button type="button" class="btn2" id="replyDeleteButton" idx="' + ress.review_no + '">삭제</button><br>';
						code2 += '</div>';
						$('#reviewReply' + v.review_no).html(code2);
						memberCheckServer();
					},
					error : function(xhr){
						code2 = '<p class="noAnswer">└ 미답변 상태입니다.</p>';
						code2 += '<div class="reviewButton rpButton replyInsertButton' + v.review_no + '" style="margin-right:0px;padding-right:0px;margin-right:0px;padding-right:0px;">';
						code2 += '<button type="button" class="btn2 replyInsertButton" id="replyInsertButton" idx="' + v.review_no + '">작성</button>';
						code2 += '</div>';
						$('#reviewReply' + v.review_no).html(code2);
						memberCheckServer();
					}
				})
			})
			
			$('#stayReview').html(code);
			
			reserCheckServer();
			memberCheckServer();
		},
		error : function(asd){
			alert("상태 : " + asd.status);
		}
	})
}

replyDeleteButtonServer = function(){
	if(confirm("답글을 삭제하시겠습니까?") == true){	//확인
		$.ajax({
			url : '/FireMoth/DeleteReply.do',
			type : 'get',
			data : {"review_no" : review_no},
			dataType : 'json',
			success : function(res){
				alert(res.flag);
				
				code2 = '<p class="noAnswer">└ 미답변 상태입니다.</p>';
				code2 += '<div class="reviewButton rpButton replyInsertButton' + res.review_no + '" style="margin-right:0px;padding-right:0px;"style="margin-right:0px;padding-right:0px;margin-right:0px;padding-right:0px;">';
				code2 += '<button type="button" class="btn2 replyInsertButton" id="replyInsertButton" idx="' + res.review_no + '">작성</button>';
				code2 += '</div>';
				$('#reviewReply' + res.review_no).html(code2);
				reviewListServer();
				memberCheckServer();
				
				/*$('#replyInsertButton').hide();
				$('#replyUpdateButton').hide();
				$('#replyDeleteButton').hide();
				$('.replybutton').hide();*/
				/*reviewListServer();
				memberCheckServer();*/
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			}
		})
	}else{//취소
	     return false;
	}
}

reviewDeleteButtonServer = function(){
	if(confirm("리뷰를 삭제하시겠습니까?") == true){	//확인
		$.ajax({
			url : '/FireMoth/DeleteReview.do',
			type : 'get',
			data : {"review_no" : review_no},
			dataType : 'json',
			success : function(res){
				/*alert(res.flag);*/
				
				$('#review' + res.review_no).remove();
				
				reviewListServer();
				memberCheckServer();
				reserCheckServer();
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			}
		})
	}else{//취소
	     return false;
	}
}

replyUpdateButtonServer = function(){
	/*$('#replyUpdateButton' + review_no).hide();
	$('#replyDeleteButton' + review_no).hide();*/
	
	code = '<form id="replyUpdateForm" onsubmit="return false;">';
	code += '<textarea rows="10" cols="85" name="reviewa_content">';
	code += '</textarea>';
	code += '<br><br>';
	code += '<input type="hidden" name="review_no" value="' + review_no + '">';
	code += '<button type="button" class="btn2" id="replyOKButton" idx="' + review_no + '">완료</button>&nbsp;&nbsp;&nbsp;&nbsp;';
	code += '<button type="button" class="btn2" id="replyCancelButton" idx="' + review_no + '">취소</button><br>';
	code += '</form>';
	
	$('.replyButton' + review_no).html(code);
}

reviewUpdateButtonServer = function(){
	/*$('#reviewUpdateButton' + review_no).hide();*/
	/*$('#reviewDeleteButton' + review_no).hide();*/
	
	code = '<form id="reviewUpdateForm" onsubmit="return false;">';
	code += '<textarea rows="10" cols="85" name="review_content">';
	code += '</textarea>';
	code += '<br><br>';
	code += '<input type="hidden" name="review_no" value="' + review_no + '">';
	code += '<button type="button" class="btn2" id="reviewOKButton" idx="' + review_no + '">완료</button>&nbsp;&nbsp;&nbsp;&nbsp;';
	code += '<button type="button" class="btn2" id="reviewCancelButton" idx="' + review_no + '">취소</button><br>';
	code += '</form>';
	
	$('.reviewButton' + review_no).html(code);
}

replyOKButtonServer = function(){
	$.ajax({
		url : '/FireMoth/UpdateReply.do',
		type : 'post',
		data : rudatas,
		dataType : 'json',
		success : function(res){
			alert(res.flag);
			reviewListServer();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

reviewOKButtonServer = function(){
	$.ajax({
		url : '/FireMoth/UpdateReview.do',
		type : 'post',
		data : rvdatas,
		dataType : 'json',
		success : function(res){
			alert(res.flag);
			reviewListServer();
			memberCheckServer();
			reserCheckServer();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

replyInsertButtonServer = function(){
	code = '<form id="replyInsertForm" onsubmit="return false;">';
	code += '<textarea rows="10" cols="85" name="reviewa_content">';
	code += '</textarea>';
	code += '<br><br>';
	code += '<input type="hidden" name="review_no" value="' + review_no + '">';
	code += '<button type="button" class="btn2" id="replyInsertOKButton" idx="' + review_no + '">완료</button>&nbsp;&nbsp;&nbsp;&nbsp;';
	code += '<button type="button" class="btn2" id="replyCancelButton" idx="' + review_no + '">취소</button><br>';
	code += '</form>';

	$('.replyInsertButton' + review_no).html(code);
}

replyInsertOKButtonServer = function(){
	$.ajax({
		url : '/FireMoth/InsertReply.do',
		type : 'post',
		data : ridatas,
		dataType : 'json',
		success : function(res){
			alert(res.flag);
			reviewListServer();
			memberCheckServer();
			reserCheckServer();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		}
	})
}

reviewInsertButtonServer = function(){
	/*$('#reviewInsertButton').hide();
	$('.reviewDetail').hide();*/
	
	code = '<div id="reviewInsertBox" class="reviewDetail">';
	code += '<form id="reviewInsertForm" onsubmit="return false;">';
	code += '<textarea id="review_content" rows="10" cols="92" name="review_content">';
	code += '</textarea>';
	code += '<br>';
	code += '<input type="hidden" name="reser_no" value="' + reser_no + '">';
	code += '<button type="button" class="btn2" id="reviewInsertOKButton" idx="' + reser_no + '">완료</button>&nbsp;&nbsp;&nbsp;&nbsp;';
	code += '<button type="button" class="btn2" id="reviewCancelButton" idx="' + reser_no + '">취소</button><br>';
	code += '</form>';
	code += '</div>';
	
	$('#reviewTitle').after(code);
}

reviewInsertOKButtonServer = function(){
	$.ajax({
		url : '/FireMoth/InsertReview.do',
		type : 'post',
		data : rvidatas,
		dataType : 'json',
		success : function(res){
			reviewListServer();
			memberCheckServer();
			reserCheckServer();
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
			reviewListServer();
			memberCheckServer();
			reserCheckServer();
		}
	})
}

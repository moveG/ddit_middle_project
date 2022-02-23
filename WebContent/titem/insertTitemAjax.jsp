<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <script src="../js/jquery-3.6.0.min.js"></script>
   
   <script>
  
   
   
   $.ajax({
		
		url : '/FireMoth/InsertTitem.do',
		type : 'post',
		success : function(res){
		       
		        alert("등록 성공"+res.flag);
		
			},
		error : function(xhr){
			alert("상태 : "+xhr.status);
			
		},
		dataType : 'json'
		
	})
		
	
	
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <script src="../js/jquery-3.6.0.min.js"></script>
   
   <script>
  
   
   
   $.ajax({
		
		url : '/bultest/insertStay.do',
		type : 'post',
		success : function(res){
		       
		      
		
			},
		error : function(a){
			alert("상태 : "+a.status);
			
		},
		dataType : 'json'
		
	})
		
	
	
</script>
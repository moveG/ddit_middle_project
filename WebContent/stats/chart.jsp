<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
  		/*   Map<String, Integer> Cmap = new HashMap<String, Integer>(); */
    	HashMap<String, Integer> Cmap = (HashMap<String, Integer>)request.getAttribute("cirChart");
    
    
    %>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://d3js.org/d3.v6.min.js"></script>

<script src="/FireMoth/billboard/billboard.js"></script>
<script src="/FireMoth/billboard/billboard.pkgd.js"></script>
<link rel="stylesheet" href="/FireMoth/billboard/billboard.css">
<link rel="stylesheet" href="/FireMoth/billboard/insight.css">
<link rel="stylesheet" href="/FireMoth/billboard/insight.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/jquery.serializejson.min.js"></script>


<script>



	


$(function(){

	var chart = bb.generate({
	    bindto: "#chart",
	    data: {
	        type: "area-spline",
	        columns: [
	           
	        	
	        	 ["10월 매출", 30,20,40,60,0,70,80,90,50]
	        	
	            ]
	    }
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
})	


</script>
<style>

	#chart{
	
		width : 1000px;
		height: 400px;
		margin : auto;
	}


	tspan{
	
		font-size: 5.0em;
	
	}

</style>



<title>Insert title here</title>
</head>
<body>
	<div id="chart"></div>
</body>
</html>
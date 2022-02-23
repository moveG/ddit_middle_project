<%@page import="kr.or.ddit.reser.vo.ReservationVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReservationVO> list = (List<ReservationVO>) request.getAttribute("rList");

%>

[
<%
	for(int i = 0; i < list.size(); i++){
		ReservationVO vo = list.get(i);
		if(i > 0) out.print(",");
%>
		{
			"ckin"     : "<%= vo.getReser_ckin() %>",
			"ckout"  : "<%= vo.getReser_ckout() %>"
		}
<% 		
	}
%>
]
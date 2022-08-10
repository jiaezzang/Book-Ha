<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//String result = (String)request.getAttribute("result");
	int flag = (Integer)request.getAttribute("flag");
	
	String result = "";
	
	if(flag == 0) {
		result = "DB Insert Complete";
		response.sendRedirect("/review_list.do");
	} else {
		result = "<script>history.back();</script>";
	}
%>
<%= result %>
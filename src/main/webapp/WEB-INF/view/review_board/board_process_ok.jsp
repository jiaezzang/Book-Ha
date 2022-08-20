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

<!-- jQuery UI CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

<!-- Toastr -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="../js/toastr.js"></script>

<script>
$(document).ready(function() {
	
	toastr.success('MariaDB 업로드를 성공하였습니다.', '작업 성공!');
	
};
</script>
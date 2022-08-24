<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding( "utf-8" );

	int flag = (Integer)request.getAttribute( "flag" );
	
	String result = "";
	
	int seq = 0;
	if(request.getAttribute("seq") != null) {
		seq = (int)request.getAttribute("seq");
	}
	
	if( flag == 0 ){
		result = "성공";
		if(seq == 0) {
			response.sendRedirect("/share_list.do");
		} else {
			response.sendRedirect("/share_view.do?seq=" + seq);
		}	
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
		toastr.succeses('MariaDB를 업데이트했습니다.', '성공!');
	};
</script>
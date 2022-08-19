<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding( "utf-8" );

	int flag = (Integer)request.getAttribute( "flag" );
	
	String result = "";
	if( flag == 0 ){
		result = "삭제 성공";
		response.sendRedirect("/share_list.do");		
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
		toastr.succeses('게시글을 삭제하였습니다.', '게시글 삭제');
	};
</script>
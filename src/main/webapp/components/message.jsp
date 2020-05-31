<%
  
String message=(String)session.getAttribute("message");
if(message!=null)
{
	%>
	<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <%=message %>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
	
	
	<%
	session.removeAttribute("message");
	
}


%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flights</title>
</head>
<body>
<%	out.print("Welocme to your account, ");
	/*  out.print(session.getAttribute("name"));*/
    out.print("!");%>
       
<br>
<form method="post" action="fligths.jsp">
<table>
	<tr>    
	<td>from</td><td><input type="text" name="from"></td>
	</tr>
	<tr>
	<td>to</td><td><input type="text" name="to"></td>
	</tr>
	<tr>    
	<td>start date</td><td><input type="text" name="start_date"></td>
	</tr>
	<tr>
	<td>end date</td><td><input type="text" name="end_date"></td>
	</tr>
	</table>
	<button type="submit">find one way</button>
	<button type="submit" formaction="round_trip.jsp">find round trip</button>
	</form>	
<br>	

       <form  method='post'>
       <input type="submit" value="history" name ="button" /> 
       <input type="submit" value="waitlist" name ="button" /> 
       <input type="submit" value="future" name ="button" /> 
       <input type="submit" value="logout" name ="button" /> 
       </form>

       <% String x = request.getParameter("button");
   if("history".equals(x))
   {
		response.sendRedirect("history.jsp");	
   }else if("future".equals(x)){
	   out.print("future");
   }else if("waitlist".equals(x)){
		response.sendRedirect("my_waitlist.jsp");	
	}else if("logout".equals(x)){
		session.setAttribute("name", null);
		response.sendRedirect("index.jsp");	
	}
	%> 
 
</body>
</html>
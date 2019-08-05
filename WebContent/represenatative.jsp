<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Represenantive</title>
</head>
<body>
<%	out.print("Represenative Account of "); 
	out.print(session.getAttribute("name"));
%>
       
<br>
<form method="post">
<table>
	<tr>    
	<td>Flight</td><td><input type="text" name="flight"></td>
	</tr>
	<tr>
	<td>Account</td><td><input type="text" name="account"></td>
	</tr>
	<tr>    
	<td>Type</td><td><input type="text" name="type"></td>
	</tr>
	</table>
       <input type="submit" value="add" name ="button" /> 
       <input type="submit" value="edit" name ="button" /> 
       <input type="submit" value="delete" name ="button" /> 
       <input type="submit" value="logout" name ="button" /> 
	</form>	
<br>	

       <% String x = request.getParameter("button");
   if("add".equals(x)) {
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the HelloWorld.jsp
			String account = request.getParameter("account");
			String flight = request.getParameter("flight");
			String type = request.getParameter("type");
			
			
			
	 		//Make an insert statement for the Sells table:
			String insert = "INSERT INTO CustomInfo(type, Flight_num, AccountID)"
					+ "VALUES (?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, flight.toLowerCase());
			ps.setString(2, flight.toLowerCase());
			ps.setString(3, account.toLowerCase());
			//Run the query against the DB
			ps.executeUpdate(); 
			
			
			out.print("Reservation Added!");
			
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();

			
		} catch (Exception ex) {
			
			out.print("Flight/Account Not Found!");
		}
   }else if("edit".equals(x)){
	   out.print("future");
   }else if("delete".equals(x)){
		response.sendRedirect("my_waitlist.jsp");	
	}else if("logout".equals(x)){
		session.setAttribute("name", null);
		response.sendRedirect("index.jsp");	
	}
	%> 
 
</body>
</html>
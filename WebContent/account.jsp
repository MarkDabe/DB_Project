<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flights</title>
</head>
<body>
<%	out.print("Welocme to your account, ");
    out.print(session.getAttribute("name"));
    out.print("!");%>
       
<br>
<form method="post">
<table>
	<tr>    
	<td>from</td><td><input type="text" name="from" placeholder="JFK"></td>
	</tr>
	<tr>
	<td>to</td><td><input type="text" name="to" placeholder="LAX"></td>
	</tr>
	<tr>    
	<td>take off time</td><td><input type="text" name="take_off_time" placeholder="2019-08-21 11:11:00"></td>
	</tr>
	<tr>
	<td>landing time</td><td><input type="text" name="landing_time" placeholder="2019-08-22 11:11:00"></td>
	</tr>
	</table>
   	   <td>flexible date</td><td><input type="checkbox" name="felixble_date" value="felxible_date"></td>
       <input type="submit" value="find_oneway" name ="button" /> 
       <input type="submit" value="find_roundtrip" name ="button" /> 
	</form>	
       <form  method='post'>
       <input type="submit" value="history" name ="button" /> 
       <input type="submit" value="waitlist" name ="button" /> 
       <input type="submit" value="future" name ="button" /> 
       <input type="submit" value="logout" name ="button" /> 
       </form>

  <% 
    String x = request.getParameter("button");
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
	}else if("find_oneway".equals(x)){
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the HelloWorld.jsp
			String from = request.getParameter("from");
			String to = request.getParameter("to");
			String takeoff = request.getParameter("take_off_time");
			String landing = request.getParameter("landing");
			

			String str = String.format("SELECT * FROM AirReservationSystem7.Flight WHERE Depart = '%1$s' AND Arrive = '%2$s'", from, to);
					

			ResultSet result = stmt.executeQuery(str);		
		
			if(result.next()){
				
				result.beforeFirst();
				//Make an HTML table to show the results in:
				out.print("<table>");

				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");	
				out.print("Flight_num");
				out.print("</td>");
                out.print("<td>");	
				out.print("price");
				out.print("</td>");
                out.print("<td>");	
				out.print("Take_off_time");
				out.print("</td>");
                out.print("<td>");	
				out.print("Landing_time");
				out.print("</td>");
                out.print("<td>");	
				out.print("Num_stops");
				out.print("</td>");
                out.print("<td>");	
				out.print("Airline");
				out.print("</td>");
                out.print("<td>");	
				out.print("type");
				out.print("</td>");
                out.print("<td>");	
				out.print("Available");
				out.print("</td>");
                out.print("<td>");	
				out.print("Depart");
				out.print("</td>");
                out.print("<td>");	
				out.print("Arrive");
				out.print("</td>");
				out.print("</tr>");

				//parse out the results
				while (result.next()) {
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					out.print(result.getString("Flight_num"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("price"));
					out.print("</td>");
				    out.print("<td>");	
					out.print(result.getString("Take_off_time"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Landing_time"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Num_stops"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Airline"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("type"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Available"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Depart"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Arrive"));
					out.print("</td>");
					out.print("</tr>");

				}
				
				out.print("</table>");
				
				
			}else{
				out.print("No Flights Found!");
			}
		
		
			con.close();
			
			
		} catch (Exception ex) {
			out.print(ex);
		}
	}else if("find_roundtrip".equals(x)){
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the HelloWorld.jsp
			String from = request.getParameter("from");
			String to = request.getParameter("to");
			String takeoff = request.getParameter("take_off_time");
			String landing = request.getParameter("landing");
			

			String str = String.format("SELECT * FROM AirReservationSystem7.Flight WHERE (Depart = '%1$s' AND Arrive = '%2$s') OR (Depart = '%2$s' AND Arrive = '%1$s')", from, to);
					

			ResultSet result = stmt.executeQuery(str);		
		
			if(result.next()){
				
				result.beforeFirst();
				//Make an HTML table to show the results in:
				out.print("<table>");

				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");	
				out.print("Flight_num");
				out.print("</td>");
                out.print("<td>");	
				out.print("price");
				out.print("</td>");
                out.print("<td>");	
				out.print("Take_off_time");
				out.print("</td>");
                out.print("<td>");	
				out.print("Landing_time");
				out.print("</td>");
                out.print("<td>");	
				out.print("Num_stops");
				out.print("</td>");
                out.print("<td>");	
				out.print("Airline");
				out.print("</td>");
                out.print("<td>");	
				out.print("type");
				out.print("</td>");
                out.print("<td>");	
				out.print("Available");
				out.print("</td>");
                out.print("<td>");	
				out.print("Depart");
				out.print("</td>");
                out.print("<td>");	
				out.print("Arrive");
				out.print("</td>");
				out.print("</tr>");

				//parse out the results
				while (result.next()) {
					//make a row
					out.print("<tr>");
					//make a column
					out.print("<td>");
					out.print(result.getString("Flight_num"));
					out.print("</td>");
					out.print("<td>");
					out.print(result.getString("price"));
					out.print("</td>");
				    out.print("<td>");	
					out.print(result.getString("Take_off_time"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Landing_time"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Num_stops"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Airline"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("type"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Available"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Depart"));
					out.print("</td>");
	                out.print("<td>");	
					out.print(result.getString("Arrive"));
					out.print("</td>");
					out.print("</tr>");

				}
				
				out.print("</table>");
				
				
			}else{
				out.print("No Flights Found!");
			}
		
		
			con.close();
			
			
		} catch (Exception ex) {
			out.print(ex);
		}
	}
	
	%> 
 
</body>
</html>
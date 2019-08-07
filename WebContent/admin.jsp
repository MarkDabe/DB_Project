<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>
<body>
<%	out.print("Admin Account"); %>
       
<br>
<form method="post">
<table>
	<tr>    
	<td>Airport</td><td><input type="text" name="airport" placeholder="JFK"></td>
	</tr>
</table>
       <input type="submit" value="find_flights" name ="button"/> 

</form>	

<form>
<table>
	<tr>    
	<td>Flight</td><td><input type="text" name="flight" placeholder="821"></td>
	</tr>
	<tr>    
	<td>Customer</td><td><input type="text" name="customer" placeholder="jeeho"></td>
	</tr>
</table>
      <input type="submit" value="find_reservations" name ="button"/> 
</form>

<% String x = request.getParameter("button");
   if("find_flights".equals(x)) {
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the HelloWorld.jsp
			String airport = request.getParameter("airport");
			

			String str = String.format("SELECT * FROM AirReservationSystem7.Flight WHERE Depart = '%1$s' UNION SELECT * FROM AirReservationSystem7.Flight WHERE Arrive = '%1$s'", airport);
					
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
			
			
			
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();

			
		} catch (Exception ex) {
			
			out.print("Flight/Account Not Found!");
		}
   }else if("find_reservations".equals(x)){
	   
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			String str = "SELECT AirReservationSystem7.Flight.Flight_num AS Flight_num, price, Take_off_time, Landing_time, Num_stops, Airline, AirReservationSystem7.Flight.type AS type, AirReservationSystem7.CustomInfo.TicketID, Depart, Arrive FROM AirReservationSystem7.CustomInfo inner join AirReservationSystem7.Flight on AirReservationSystem7.CustomInfo.Flight_num=AirReservationSystem7.Flight.Flight_num" ;
			
			String customer = request.getParameter("customer");
			String flight = request.getParameter("flight");
			
			
			if(customer != null && !"".equals(customer)){
				if(str.contains("WHERE")){
					
					str = str + " AND " + String.format("AirReservationSystem7.CustomInfo.AccountID='%1$s'", customer);
		
				}else{
					str = str + " WHERE " + String.format("AirReservationSystem7.CustomInfo.AccountID='%1$s'", customer);

				}
			}
			
			
			if(flight != null && !"".equals(flight)){
				
				if(str.contains("WHERE")){
					
					str = str + " AND " + String.format("AirReservationSystem7.CustomInfo.Flight_num='%1$s'", flight);
		
				}else{
					str = str + " WHERE " + String.format("AirReservationSystem7.CustomInfo.Flight_num='%1$s'", flight);

				}
				
			}
			
			
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
				out.print("TicketID");
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
					out.print(result.getString("TicketID"));
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
				out.print("No Reservations Found!");
			}
		
			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
			
		} catch (Exception ex) {
			out.print(ex);
		}

   }else if("delete".equals(x)){
		response.sendRedirect("my_waitlist.jsp");	
	}else if("logout".equals(x)){
		session.setAttribute("name", null);
		response.sendRedirect("index.jsp");	
	}
	%> 
 
</body>
</html>
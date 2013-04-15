<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Servlets.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>TICKET INFORMATION</title>
		<style>
			h1 {
				color: white;
				text-align:center;
				font-style: italic;
				text-shadow: 1px 1px 1px #000;
				}
			#travelers
		{
			font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;	
			border-collapse:collapse;
		}
	#travelers td, #travelers th
		{
			font-size:1em;
			border:1px solid #2E2EFE;
			padding:3px 7px 2px 7px;
		}
		
	#travelers caption 
		{
			font-size:1.3em;
			text-align:center;
			padding-top:5px;
			padding-bottom:4px;
			background-color:#2E2EFE;
			color:#ffffff;
		}	
	
	#travelers tr.alt td 
		{
			color:#000000;
			background-color:#A9A9F5;
		}	
			
		</style>
	</head>
<body background = "background.jpeg">
	<table class="head" width="100%" border="2">
		<tr>
			<td colspan="2" style="background-color: blue;">
				<h1>Airline Management System</h1>
			</td>
		</tr>
	</table>	<br><br>
<%
String[] vals = null;



if(request.getParameter("result") != null)
{
	System.out.println("----Hello---"+request.getParameter("result"));
	vals = ((String)request.getParameter("result")).split("\\$");
}
																
HashMap<String, String> airlineMap = new HashMap<String,String>();
airlineMap.put("UAALS","United AirLines");
airlineMap.put("SWALS","Southwest AirLines");

%>

<table id="travelers" align="center" width="90%" border="0">
	<caption align="top"> <i>Travelers List  </i>      </caption>
	<tr>
		<td align="center" colspan="3"><b> Airlines : </b><i><%= airlineMap.get(vals[vals.length-2]) %></i> </td>
		<td align="center" colspan="3"><b>Journey Date : </b><i><%=vals[vals.length-1]%></i></td>
	</tr>
	<tr >
		<th>No. of Customers</th>
		<th>Customer Id</th>
		<th>First Name</th>
		<th>Last Name</th>
		<th>Ticket No.</th>
		<th>Nationality</th>
	</tr>
	<%for(int i=0,count=1; i<vals.length-2; count++){ %>
	<tr class="alt" align="center">
		<td><%=count%> </td>
		<td><%=vals[i++]%> </td>
		<td><%=vals[i++]%> </td>
		<td><%=vals[i++]%> </td>
		<td><%=vals[i++]%> </td>
		<td><%=vals[i++]%> </td>
	</tr>
	<%} %>
</table>
	<br><br>
	<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>
</body>
</html>
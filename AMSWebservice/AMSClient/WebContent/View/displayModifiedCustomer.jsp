<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Servlets.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modified Customer Information</title>
<style type="text/css">
	h1 {
			color: white;
			text-align:center;
			font-style: italic;
			text-shadow: 1px 1px 1px #000;
		}
	h2 {	text-align:center;
			font-style: italic;
			text-shadow: 1px 1px 1px #000;
		}
	h5
		{
			font-style: italic;
			text-shadow: 1px 1px 1px #000;
		}
	#customers
		{
			font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;	
			border-collapse:collapse;
		}
	#customers td, #customers th
		{
			font-size:1em;
			border:1px solid #2E2EFE;
			padding:3px 7px 2px 7px;
		}
		
	#customers th 
		{
			font-size:1.3em;
			text-align:center;
			padding-top:5px;
			padding-bottom:4px;
			background-color:#2E2EFE;
			color:#ffffff;
		}	
	
	#customers tr.alt td 
		{
			color:#000000;
			background-color:#A9A9F5;
		}
		
		
</style>
</head>
<body background = "background.jpeg">
	<div class="wrapper">
<%
String personValues = "";
String[] vals = new String[10];

if(request.getParameter("personValues") != null)
{
	personValues = request.getParameter("personValues");
	vals = personValues.split("\\$");
}
%>
	<table class="head" width="100%" border="2">
		<tr>
			<td colspan="2" style="background-color: blue;">
				<h1>Airline Management System</h1>
			</td>
		</tr>
	</table>	
		<h2 >Customer Page</h2>
		<br>
		<h4>Here is your updated information.</h4>
		<br>
		
		
		
		
	<table id="customers" align="center" width="65%" border="0">
		<tr align="center">
			<th>    CUSTOMER MODIFIED INFORMATION     </th>
		</tr>
		
		<tr>
			<td>Id : <%=vals[0] %></td>
		</tr>
		<tr class="alt">
			<td>FirstName : <%=vals[1]  %></td>
		</tr>
		<tr>
			<td>LastName : <%=vals[2] %></td>
		</tr>
		<tr class="alt">
			<td>Address : <%=vals[3]  %></td>
		</tr>
		<tr>
			<td>DOB : <%=vals[4] %></td>
		</tr>
		<tr class="alt">
			<td>City : <%=vals[5]  %></td>
		</tr>
		<tr>
			<td>State : <%=vals[6]  %></td>
		</tr>
		<tr class="alt">
			<td>Zip : <%=vals[7]  %></td>
		</tr>
		<tr>
			<td>Phone No. : <%=vals[8]  %></td>
		</tr>
		<tr class="alt">
			<td>eMail Id : <%=vals[9]  %></td>
		</tr>
	</table>
	
	<br>
	<br>
	<div class="push"></div>
		</div>
		<br><br>
		
		<div class="footer" align="center"><h5>This is a copyright of Team1</h5></div> 
</body>
</html>
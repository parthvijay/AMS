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
	#customers th.asd 
		{
			font-size:1em;
			text-align:center;
			padding-top:5px;
			padding-bottom:4px;
			background-color:#A9A9F5;
			color:black;
		}	
	
	#customers caption.second
		{
			font-size:1.4em;
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
	
	<table class="head" width="100%" border="2">
		<tr>
			<td colspan="2" style="background-color: blue;">
				<h1>Airline Management System</h1>
			</td>
		</tr>
	</table>	
	
<%
	String[] vals = null;
	if(request.getParameter("result") != null)
	{
	System.out.println("In ::: "+ request.getParameter("result"));
	vals = ((String)request.getParameter("result")).split("\\|");
	}


	String[] CustomerPers = null;
	String[] CustomerTravelInfo = null;
	if(vals.length != 0)
	{
		CustomerPers = vals[0].split("\\$");
		CustomerTravelInfo = vals[1].split("\\$");
	}

	for(String p : CustomerPers)
		System.out.println(p);
		
	System.out.println("---Teh Travel info.----");	
	for(String p : CustomerTravelInfo)
		System.out.println(p);
	
%>
<br><br>
<table id="customers" align="center" width="90%" border="0">
	<tr align="center">
		<th>  <i>CUSTOMER MODIFIED INFORMATION </i>      </th>
	</tr>
	<tr>
		<td>Customer Id : <%=CustomerPers[0] %></td>
	</tr>
	<tr class="alt">
		<td >FirstName : <%=CustomerPers[1] %></td>
	</tr>
	<tr>
		<td>LastName : <%=CustomerPers[2] %></td>
	</tr>
	<tr class="alt">
		<td>Address : <%=CustomerPers[3] %></td>
	</tr>
	<tr>
		<td>DOB : <%=CustomerPers[9] %></td>
	</tr>
	<tr class="alt">
		<td>City : <%=CustomerPers[4] %></td>
	</tr>
	<tr>
		<td>State : <%=CustomerPers[7] %></td>
	</tr>
	<tr class="alt">
		<td>Zip : <%=CustomerPers[8] %></td>
	</tr>
	<tr>
		<td>Phone No. : <%=CustomerPers[5] %></td>
	</tr>
	<tr class="alt">
		<td>eMail Id : <%=CustomerPers[6] %></td>
	</tr>
	<tr>
		<td>Nationality : <%=CustomerPers[10] %></td>
	</tr>
	<tr class="alt">
		<td>Passport No: <%=CustomerPers[11] %></td>
	</tr>
</table>

<br></br>
<br></br>

<table id="customers" align="center" width="90%" border="0">
	
	<caption class="second"> <i>Customer Tour Information</i></caption>
	<tr>
		<th class="asd">Tour No. </th>
		<th class="asd">Source</th>
		<th class="asd">Destination</th>
		<th class="asd">Dept Date</th>
		<th class="asd">Arrival Date</th>
		<th class="asd">Status</th>
	</tr>
	
<%for(int i=0,count=1; i<CustomerTravelInfo.length; count++){ %>
	<tr>
		<td><%=count%> </td>
		<td><%=CustomerTravelInfo[i++]%> </td>
		<td><%=CustomerTravelInfo[i++]%> </td>
		<td><%=CustomerTravelInfo[i++]%> </td>
		<td><%=CustomerTravelInfo[i++]%> </td>
		<td><%=CustomerTravelInfo[i++]%> </td>
	</tr>
<%} %>
</table>


</body>
</html>
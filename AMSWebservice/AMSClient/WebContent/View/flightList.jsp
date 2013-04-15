<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
   <%@page import="Connection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>Flight List</title>
			<style>
				h1 {
					color: white;
					text-align:center;
					font-style: italic;
					text-shadow: 1px 1px 1px #000;
				}
				h1.new {
					color: black;
					text-align:center;
					font-style: italic;
					text-shadow: 1px 1px 1px #000;
				}
				.label{
   	 				font-family:Verdana, Arial, Helvetica, sans-serif;
    				font-size: 14px;
    				color:#0066FF;
				}
				.tableBorder{
    				border:solid 1px #0066FF;
    				margin-top:100px;
				}
				.message{
    				font-family:Verdana, Arial, Helvetica, sans-serif;
    				font-size:20px;
    				font-weight:bold;
    				color:#0066FF;
				}
				* {
					margin: 0;
				}
				html, body {
					height: 100%;
				}
				
				#flights {
					
					font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;	
					border-collapse:collapse;
				}
				#flights td, #flights th {
				font-size:1em;
				border:1px solid #2E2EFE;
				padding:3px 7px 2px 7px;
				}
		
				#flights th 
				{
				font-style: italic;
				font-size:1.1em;
				text-align:center;
				padding-top:5px;
				padding-bottom:4px;
				background-color:#2E2EFE;
				color:#ffffff;
				}	
	
				#flights tr.alt td 
				{
				color:#000000;
				background-color:#E2EAFF;
				}
			</style>
	</head>
	<script language="JavaScript" type="text/JavaScript">
		window.onload = function()
		{
			if('${showflights}' == "true")
				document.getElementById("div1").style.display = 'block';
			else
				document.getElementById("div1").style.display = 'none';
			if('${userSession}' ==  "" || '${userSession}' ==  null)
				self.location = "login.jsp";
		}
		
		function setParent(alid, aircraft, date)
		{
			window.opener.setFlight(alid, aircraft, date);
	        window.close();
		}
	</script>
	
	<script language="JavaScript" type="text/JavaScript" src="datetimepicker.js">
	</script>
	
	<body background = "background.jpeg">
		<table class="head" width="100%" border="2">
			<tr>
				<td colspan="2" style="background-color: blue;">
					<h1>Airline Management System</h1>
				</td>
			</tr>
		</table>	
		<form method="post" action="flightList">
			
			
			<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="600px" style="margin: 6.5em  auto;">
				<tr>
        			<td colspan="6" bgcolor="#0066FF">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
        			<td align="center" colspan="2"><span class="message">Flight List</span></td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">Date: </td>
					<td align="left" width="60%"><input id="demo1" name="date" type="text" size="20" value="${date}"><a href="javascript:NewCal('demo1','ddmmyyyy')">&nbsp;<img src="cal.gif" width="16" height="16" border="0" alt="Pick a date"></a></td>
				</tr>
				<tr>
    				<td></td>
    			</tr>
    			<tr>
    				<td></td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">Source: </td>
					<td align="left" width="60%"><input type="text" name="source" size="20" maxlength="20" value="${source}"/></td>
				</tr>
				<tr>
    				<td></td>
    			</tr>
    			<tr>
    				<td></td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">Destination: </td>
					<td align="left" width="60%"><input type="text" name="destination" size="20" maxlength="20" value="${destination}"/></td>
				</tr>
				<tr>
    				<td></td>
    			</tr>
    			<tr>
    				<td></td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right">&nbsp;</td>
					<td align="left">
						<input id="submit" type="submit" name="submit" value="Get Flights"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="hidden" name="flightlist" value="FL"/>
					</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
			</table>
			
			<h1 class="new"><i>Flight List</i></h1>
			<br><br>
			<div id="div1">
			<table id="flights" align="center" width="80%" border="1">
				<tr>
					<th>Aircraft</th>
					<th>Depature Date</th>
					<th>Arrival Date</th>
					<th>Departure Time</th>
					<th>Arrival Time</th>
					<th>Source</th>
					<th>Destination</th>
					<th>Status</th>
				</tr>
				<c:forEach var="f" items="${flights}">
				<tr align="center" class="alt">
					<td><a style="color:blue;" href="javascript:setParent('${f.alid}', '${f.aircraft}', '${f.deptdate}');">${f.aircraft}</a></td>
					<td>${f.deptdate}</td>
					<td>${f.arrvdate}</td>
					<td>${f.depttime}</td>
					<td>${f.arrvtime}</td>
					<td>${f.source}</td>
					<td>${f.destination}</td>
					<td>${f.status}</td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</form>
		<br><br>
		<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>
	</body>
</html>

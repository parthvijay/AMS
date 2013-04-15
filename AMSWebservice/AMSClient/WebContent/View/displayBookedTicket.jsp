<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<title>Booked Ticket</title>
	<style type="text/css">
		h1 {
			color: white;
			text-align:center;
			font-style: italic;
			text-shadow: 1px 1px 1px #000;
			}
		#ticket{
			font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;	
			border-collapse:collapse;
			}
		#ticket th {	
			text-align:left;
			border:1px solid #2E2EFE;
			padding:3px 7px 2px 7px;
			}
		#ticket caption.new {
			font-size:1.3em;
			text-align:center;
			padding-top:5px;
			padding-bottom:4px;
			background-color:#2E2EFE;
			color:#ffffff;
			}	
		
		#ticket tr.alt th {
			color:#000000;
			background-color:#A9A9F5;
			}
	</style>
</head>

<script language="JavaScript" type="text/JavaScript">
	window.onload = function() {
		if ('${userSession}' == "" || '${userSession}' == null)
			selcustomer_ticket.location = "login.jsp";
	}

	function closeWindow() {
		window.close();
	}
	
</script>
<body background = "background.jpeg">
	<table class="head" width="100%" border="2">
		<tr>
			<td colspan="2" style="background-color: blue;">
				<h1>Airline Management System</h1>
			</td>
		</tr>
	</table><br>
<h1>Ticket Details</h1><br><br>
	<form>
			<table id="ticket" align="center" width="80%" border="0">
				<caption class="new"><i>Ticket Details</i></caption>
				<tr class="alt">
					<td>Air Lines</td><td>${customer_ticket.alid}</td>
				</tr>
				<tr>
					<td>Aircraft</td><td>${customer_ticket.aircraft}</td>
				</tr>
				<tr class="alt">
					<td>Ticket Number</td><td>${customer_ticket.ticketnum}</td>
				</tr>
				<tr>
					<td>Nationality</td><td>${customer_ticket.nationality}</td>
				</tr>
				<tr class="alt">
					<td>Passport</td><td>${customer_ticket.passport}</td>
				</tr>
				<tr>
					<td>Departure Date</td><td>${customer_ticket.date}</td>
				</tr>
				<tr class="alt">
					<td>Status</td><td>${customer_ticket.status}</td>
				</tr>
				
			</table>
			
			<br><br>
			
			<input type="button" value="Close" onclick="javascript:window.close();">
	</form>
	<br><br>
	<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>
</body>
</html>

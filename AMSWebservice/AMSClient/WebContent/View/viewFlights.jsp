<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>My Flights</title>
		<style type="text/css">
			h1 {
				color: white;
				text-align:center;
				font-style: italic;
				text-shadow: 1px 1px 1px #000;
				}
			h2.head {
				color: #0066FF;
				text-align:center;
				font-style: italic;
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
<script type="text/javascript" src="jquery-1.7.1.js"></script>
	
	<body background = "background.jpeg">
		<table class="head" width="100%" border="2">
			<tr>
				<td colspan="2" style="background-color: blue;">
					<h1>Airline Management System</h1>
				</td>
			</tr>
		</table>
		<br>
		<br>
		<form method="post" action="customers">
			<h2 class="head">My Flights</h2>
			
			<div id="div1">
			<table id="flights" align="center" width="80%" border="1">
				<tr>
					<th>Air Lines</th>
					<th>Aircraft</th>
					<th>Ticket Number</th>
					<th>Departure Date</th>
					<th>Passport</th>
					<th>Nationality</th>
					<th>Ticket Status</th>
				</tr>
				<c:forEach var="c" items="${sessionScope.customers}">
				<tr align="center" class="alt">
					<td>${c.alid}</td>
					<td><a style="color:blue;" href="javascript:getAFlight('${c.alid}', '${c.aircraft}', '${c.date}');">${c.aircraft}</a></td>
					<td>${c.ticketnum}</td>
					<td>${c.date}</td>
					<td>${c.passport}</td>
					<td>${c.nationality}</td>
					<td>${c.status}</td>
				</tr>
				</c:forEach>
			</table>
			</div>
			<br><br>
			<div id="div2">
			<h2 class="head">Flight Information</h2>
			
			<table id="flights" align="center" width="90%" border="1">
				<tr>
					<th>Air Lines</th>
					<th>Aircraft</th>
					<th>Source</th>
					<th>Destination</th>
					<th>Departure Date</th>
					<th>Departure Time</th>
					<th>Arrival Date</th>
					<th>Arrival Time</th>
					<th>Flight Status</th>
				</tr>
				<tr align="center" class="alt">
					<td>${flight.alid}</td>
					<td>${flight.aircraft}</td>
					<td>${flight.source}</td>
					<td>${flight.destination}</td>
					<td>${flight.deptdate}</td>
					<td>${flight.depttime}</td>
					<td>${flight.arrvdate}</td>
					<td>${flight.arrvtime}</td>
					<td>${flight.status}</td>
				</tr>
			</table>
			</div>



		<input id="pageVal" type="hidden" name="pageVal"/>
		<input id="submit" type="submit" name="submit" value="submit"/>
		
			<input id="alid" type="hidden" name="alid"/>
			<input id="date" type="hidden" name="date"/>
			<input id="aircraft" type="hidden" name="aircraft"/>
			
		</form>
		

<script language="JavaScript" type="text/JavaScript">

	$(window).load(function(){
		$("#submit").hide();
		$("div2").hide();
		if('${userSession}' ==  "" || '${userSession}' ==  null)
			self.location = "customerLogin.jsp";
		if('${divn}' == "GF")
			$("div2").show();
	});
	
	function getAFlight(alid, aircraft, date)
	{
		$("#pageVal").val('GF');
		$("#alid").val(alid);
		$("#date").val(date);
		$("#aircraft").val(aircraft);
		$("#submit").click();
	}

	</script>
	<br><br>
	<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>
	</body>
</html>

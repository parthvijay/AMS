<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<link href="bootstrap.css" rel="stylesheet">
	<style type="text/css">
		h1 {
			color: white;
			text-align:center;
			font-style: italic;
			text-shadow: 1px 1px 1px #000;
			}
		h5 {
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
		.wrapper {
			min-height: 100%;
			height: auto !important;
			height: 100%;
			margin: 0 auto -4em;
			}
		.footer, .push {
			height: 4em;
			}
	</style>

<script language="JavaScript" type="text/JavaScript">
		window.onload = function()
		{
			document.getElementById("submit").style.display = 'none';
			document.getElementById("aircraft").disabled = true;
			if('${userSession}' ==  "" || '${userSession}' ==  null)
				self.location = "login.jsp";
		}
		
		function getFlight()
		{
			open("flightList.jsp","","width=900,height=400,scrollbars,resizable,toolbar,status");
		}
		
		function setFlight(alid, aircraft, date)
		{
			document.getElementById("aircraft").value = aircraft;
			document.getElementById("air_craft").value = aircraft;
			document.getElementById("alid").value = alid;
			document.getElementById("date").value = date;
			window.focus();
		}
		
		function isEmpty(str)
		{
			if(str == null || str == "")
				return true;
			else
				return false;
		}

		function validatePage()
		{
			var passport = document.getElementsByName("passport")[0].value;
			var nationality = document.getElementsByName("nationality")[0].value;
			var aircraft = document.getElementsByName("air_craft")[0].value;

			if(isEmpty(passport))alert("Please enter Passport Number.");
			else if(isEmpty(nationality))alert("Please enter your Nationality.");
			else if(isEmpty(aircraft))alert("Please select a Flight.");
			else document.getElementById("submit").click();
		}
		
	</script>
	
<body background = "background.jpeg">
	<div class="wrapper">
		<table class="head" width="100%" border="2">
			<tr>
				<td colspan="2" style="background-color: blue;">
					<h1>Airline Management System</h1>
				</td>
			</tr>
		</table>	
		
	<form method="post" action="bookATicket">
		<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="700px" style="margin: 6.8em  auto;">
			<tr>
        		<td colspan="3" bgcolor="#0066FF">&nbsp;</td>
    		</tr>
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
    		<tr>
        		<td align="center" colspan="2"><span class="message">New Ticket</span></td>
    		</tr>
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
			<tr>
				<td class="label" align="right" width="20%">Passport Number: </td>
				<td align="left" width="60%"><input type="text" name="passport" size="20" maxlength="6" value="${customer.passport}"/></td>
			</tr>
			<tr>
    		<td></td>
    		</tr>
    		<tr>
    		<tr>
    		<td></td>
    		</tr>
			<tr>
				<td class="label" align="right" width="20%">Nationality: </td>
				<td align="left" width="60%"><input type="text" name="nationality" size="20" maxlength="20" value="${customer.nationality}"/></td>
			</tr>
			<tr>
    		<td></td>
    		</tr>
    		<tr>
    		<tr>
    		<td></td>
    		</tr>
			<tr>
				<td class="label" align="right" width="20%">Flight: </td>
				<td align="left" width="60%"><input id="aircraft" type="text" name="aircraft" size="20" maxlength="9"/></td>
				<td><a style="color:blue;" href="javascript:getFlight();">Get Flight</a></td>
			</tr>
			<tr>
    		<td></td>
    		</tr>
    		<tr>
    		<tr>
    		<td></td>
    		</tr>	
			<tr>
				<td class="label" align="right">Status: </td>
				<td align="left" width="60%">
					<select name="status" width="500px">
						<option value="Ticket Issued">Ticket Issued</option>
			  			<option value="Ticket Blocked">Ticket Blocked</option>
				  		<option value="New Booking">Pending</option>
					</select>
				</td>
			</tr>	
			<tr>
    		<td></td>
    		</tr>
    		<tr>
    		<tr>
    		<td></td>
    		</tr>
			<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
			<tr>
				<td class="label" align="right">&nbsp;</td>
				<td align="left"><button  type="button" class="btn btn-small btn-primary" value="Book Ticket" onclick="validatePage();">Book Ticket</button>	
					<input id="submit" type="submit" name="submit" value="submit"/>
					<input type="hidden" name="alid" id="alid"/>
					<input type="hidden" name="date" id="date"/>
					<input id="air_craft" type="hidden" name="air_craft"/>
					<input type="hidden" name="cid" value="${customer.cid}"/>
				</td>
			</tr>	
			<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
		</table>
		<br>
		<br>
	</form>
	
		<div class="push"></div>
	</div>
		<div class="footer" align="center"><h5>This is a copyright of Team1</h5></div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
h1 {
color: white;
text-align:center;
font-style: italic;
text-shadow: 1px 1px 1px #000;
}
h2{
text-align:center;
font-style: italic;
text-shadow: 1px 1px 1px #000;
}
h5
{
font-style: italic;
text-shadow: 1px 1px 1px #000;
}
#nav {
	width: 100%;
	float: left;
	margin: 0 0 3em 0;
	padding: 0;
	list-style: none;
	background-color: #f2f2f2;
	border-bottom: 1px solid #ccc; 
	border-top: 1px solid #ccc; }
#nav li {
	float: left; }
#nav li a {
	display: block;
	padding: 8px 15px;
	text-decoration: none;
	font-weight: bold;
	color: #069;
	border-right: 1px solid #ccc; }
#nav li a:hover {
	color: #c00;
	background-color: #fff; }

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
			document.getElementById("div1").style.display = 'none';
			document.getElementById("div2").style.display = 'none';
			document.getElementById("div3").style.display = 'none';
			document.getElementById("div4").style.display = 'none';
			document.getElementById("col1").style.display = 'none';
			if('${userSession}' ==  "" || '${userSession}' ==  null)
				self.location = "login.jsp";
			if('${error}' != "" && '${error}' != null)
			{
				document.getElementById("col1").style.display = 'block';
				document.getElementById("div3").style.display = 'block';
			}
			else
				document.getElementById("div1").style.display = 'block';
				
		}
		
		function pageDisplay(div)
		{
			document.getElementById("div1").style.display = 'none';
			if(div == "NB")
			{
				document.getElementById("div2").style.display = 'block';
			}
			else if(div == 'EB')
			{
				document.getElementById("div2").style.display = 'none';
				document.getElementById("div4").style.display = 'block';
			}
			else if(div == 'CC')
			{
				document.getElementById("col1").style.display = 'none';
				document.getElementById("div2").style.display = 'none';
				document.getElementById("div3").style.display = 'block';
			}
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
		
				<h2 align="center">Staff Page</h2>
				<ul class = "a" id="nav">
					<li><a href="javascript:pageDisplay('NB')">Book a New Ticket</a> </li>
					<li><a href="existingBookings.jsp">Existing Booking</a> </li>
				</ul>
		<form method="post" action="staffHome">
			
			<div id="div1">
				<p>Welcome, <b>${currentuser}</b><br>
					<br>
				   We welcome you to our Airline Management System. What would you like to do?<br> 
				   <br>
				   If you want to book a new ticket, please click on the link named "Book a Ticket" or if you want to look into 
				   existing booking, please click on the link named "Existing Booking".  <br>
				</p>
				
			</div>

			<div id="div2">
				<a href="newCustomer.jsp">New Customer</a> <br><br><br>
				<a href="javascript:pageDisplay('CC')">Existing Customer</a>
			</div>

			<div id="div3">
				<table cellspacing="10">
					<tr><td>Enter Customer Id: </td>
					<td><input type="text" name="cid" size="9" maxlength="9" value="${cid}"/></td><td style="color:red;">${error}</td></tr>
				</table><br>
					<p id="col1">Click <a style="color:blue;text-decoration:none;" href="newCustomer.jsp">here</a> to create a New Customer.</p>
			<br>
			<input id="submit" type="submit" name="submit" value="submit"/>					
			</div>

			<div id="div4">
				Existing Booking
			</div>
		</form>
		<div class="push"></div>
		</div>
		<br><br>
		<div class="footer" align="center"><h5>This is a copyright of Team1</h5></div> 
	</body>
</html>
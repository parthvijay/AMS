<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Home</title>
	<link href="bootstrap.css" rel="stylesheet">
		<style type="text/css">
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
			ul.list {
	    		list-style-image: url('images.jpg');
				}
		</style>

<script language="JavaScript" type="text/JavaScript">
		window.onload = function()
		{
			
			if('${userSession}' ==  "" || '${userSession}' ==  null)
				self.location = "login.jsp";
			
		}
</script>

</head>
<body background = "background.jpeg">
	<table class="head" width="100%" border="2">
			<tr>
				<td colspan="2" style="background-color: blue;">
					<h1>Airline Management System</h1>
				</td>
			</tr>
		</table><br>
	<h2 align="center">Admin Page</h2>
	
<p>Welcome, <b>${currentuser}</b></p>
	<br>
	<ul class="list">
		<li><a href="createEmp.jsp">Create a new Employee</a></li><br><br><br>
		<li><a href="searchEmp.jsp">Search ,Edit, Delete employees</a></li><br><br><br>
		<li><a href="modifyFlight.jsp">Update Flight Details</a></li><br><br><br>
		<li><a href="addNewFlight.jsp">Add New Flight</a></li>
	</ul>
	<br><br>
	<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>

</body>
</html>
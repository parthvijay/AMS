<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Login</title>
		<link href="bootstrap.css" rel="stylesheet">
		<style type="text/css">
			h1 {
				color: white;
				text-align:center;
				font-style: italic;
				text-shadow: 1px 1px 1px #000;
				}
			h2.new{
				text-align: center;
				font-style: italic;
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
	</table><br><br>
	<h2 class="new"><i>Customer Login</i></h2>
	<form method="post" action="customers">
			<div id="errordiv">
				<b>Invalid Credentials.</b>
			</div>
			<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="400px" style="margin: 6.5em  auto;">
				<tr>
        			<td colspan="2" bgcolor="#0066FF">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<td align="center" colspan="2"><span class="message">Please Login Here</span></td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<td class="label" align="right" width="20%">Username:    </td>
					<td align="left" width="60%"><input type="text" name="username" size="20" maxlength="20" value="${username}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Password: </td>
					<td align="left" width="60%"><input type="password" name="password" size="20" maxlength="20" value="${password}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right">&nbsp;</td>
					<td align="left">
						<button id="login" class="btn btn-small btn-primary" type="button">Login</button>
						<input id="submit" type="submit" name="submit" value="submit"/>
					</td>	
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
			</table>
		</form>
		<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br>
		<script language="JavaScript" type="text/JavaScript">
		
	$(window).load(function(){
		$("#submit").hide();
		if('${error}' != "true")
			$("#errordiv").hide();
		if('${userSession}' !=  "" && '${userSession}' !=  null)
			self.location = "customerHome.jsp";
	});

		
		$("#login").click(function(){
			if(!$("input[name=username]").val())
				alert("Please enter Username.");
			else if(!$("input[name=password]").val())
				alert("Please enter Password.");
			else $("#submit").click();
		});
		
	</script>
</body>
</html>
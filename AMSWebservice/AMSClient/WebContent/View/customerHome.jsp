<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<script type="text/javascript" src="jquery-1.7.1.js"></script>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Customer Home</title>
	<link href="bootstrap.css" rel="stylesheet">
	<style type="text/css">
		h1 {
				color: white;
				text-align:center;
				font-style: italic;
				text-shadow: 1px 1px 1px #000;
		   }
		h2 {
				text-align:center;
				font-style: italic;
				text-shadow: 1px 1px 1px #000;
	    	}
	    h5
			{
				font-style: italic;
				text-shadow: 1px 1px 1px #000;
			}
	    ul.list {
	    			list-style-image: url('images.jpg');
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

<body background = "background.jpeg">
		<table class="head" width="100%" border="2">
			<tr>
				<td colspan="2" style="background-color: blue;">
					<h1>Airline Management System</h1>
				</td>
			</tr>
		</table>	
	<form method="post" action="customers">
		<h2>Customer Home</h2>

		<div id="divMessage">${message}</div><br><br>
			
			<div id="divMain">
				<p>Welcome, <b>${currentuser}</b></p><br>
				<ul class="list">
					<li><a href="javascript:pageFunction('VP');">View Profile</a> <br><br><br></li>
					<li><a href="javascript:pageFunction('CP');">Change Password</a> <br><br><br></li>
					<li><a href="javascript:pageFunction('BF');">Book Flight</a> <br><br><br></li>
					<li><a href="javascript:pageFunction('VF');">View Flight</a> <br><br><br></li>
				</ul>
			</div>

			<div id="divCP">
				<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 6.5em  auto;">
					<tr>
        				<td colspan="2" bgcolor="#0066FF">&nbsp;</td>
    				</tr>
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
    				<tr>
        				<td align="center" colspan="2"><span class="message">Change Password</span></td>
    				</tr>
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
					<tr>
						<td class="label" align="right" width="40%">New Password: </td>
						<td align="left" width="60%"><input type="password" name="newpassword" size="20" maxlength="20"/></td>
					</tr>
					<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
					<tr>
						<td class="label" align="right" width="40%">Re-enter New Password: </td>
						<td align="left" width="60%"><input type="password" name="repassword" size="20" maxlength="20"/></td>
					</tr>
					<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
					<tr>
						<td class="label" align="right">&nbsp;</td>
						<td align="left"><button class="btn btn-small btn-primary" id="changepassword" type="button">Change Password</button></td>
					</tr>
					<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
				</table><br><br>
			</div>

			<div id="div3"></div>

			<div id="div4"></div>

			<input id="pageVal" type="hidden" name="pageVal"/>
			<input id="submit" type="submit" name="submit" value="submit"/>

	</form>	
		<h5 align="center">This is a copyright of Team1 (CMPE 273, Spring 2012)</h5>
</body>
<script language="JavaScript" type="text/JavaScript">
		
	$(window).load(function(){
		$("#submit").hide();
		if('${userSession}' ==  "" || '${userSession}' ==  null)
			self.location = "customerLogin.jsp";
		if('${error}' == "true" && '${divn}' == "CP")
			pageFunction('${divn}');
		else 
		{
			if('${divn}' == "VP")
				open("viewProfile.jsp","","width=900,height=400,scrollbars,resizable,toolbar,status");
			else if('${divn}' == "VF")
				open("viewFlights.jsp","","width=900,height=400,scrollbars,resizable,toolbar,status");
			$("div:not(#divMain)").hide();
		}
		$("#divMessage").show();
	});
	
	$("#changepassword").click(function(){
		if(!$("input[name=newpassword]").val())
			alert("Please enter New Password.");
		else if(!$("input[name=repassword]").val())
			alert("Please Re-enter New Password.");
		else if($("input[name=newpassword]").val() != $("input[name=repassword]").val())
			alert("New Password does not match.");
		else $("#submit").click();
	});
	
	function pageFunction(div)
	{
		$("#pageVal").val(div);
		if(div == "BF")
		{
			$("#submit").click();
		}
		else if(div == "VF")
		{
			$("#submit").click();
		}
		else if(div == "VP")
		{
			$("#submit").click();
		}
		else if(div == "CP")
		{
			$("div").hide();
			$("#divCP").show();
		}
	}

</script>

</html>
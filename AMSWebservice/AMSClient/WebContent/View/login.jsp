<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>Airline Management System</title>
		
		<link href="bootstrap.css" rel="stylesheet">
    	
    	
		<style type="text/css">
			h1 {
				color: white;
				text-align:center;
				font-style: italic;
				text-shadow: 1px 1px 1px #000;
				}
			h5 {
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
	</head>
	
<body background = "background.jpeg">
	<div class="wrapper">
		<table class="head" width="100%" border="2">
			<tr>
				<td colspan="2" style="background-color: blue;">
					<h1>Airline Management System</h1>
				</td>
			</tr>
		</table>	
		<br>
		<br>
	<form method= "post" action="login">		
		<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 4em  auto;">
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
        		<td class="label" align="right" width="20%">Username:    </td>
        		<td align="left" width="60%"><input type="text" name="username" placeholder="Username" maxlength="20" required="required" /></td>
    		</tr>
    		<tr>
    		<td></td>
    		</tr>
    		<tr>
    		<tr>
    		<td></td>
    		</tr>
    		<tr>
        		<td class="label" align="right">Password:</td>
        		<td align="left"><input type="password" name="password" placeholder="**********" maxlength="20" /></td>
    		</tr>
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
			<tr>
        		<td class="label" align="right">&nbsp;</td>
        		<td align="left"><button class="btn btn-small btn-primary" type="submit" name = "submit" >Submit </button></td>
    		</tr>                   
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>  
		</table>
	</form>
		<div class="push"></div>
	</div>
		<div class="footer" align="center"><h5>This is a copyright of Team1 (CMPE 273, Spring 2012)</h5></div> 
</body>
<script language="JavaScript" type="text/JavaScript">
		window.onload = function()
		{
			if('${userSession}' !=  "" && '${userSession}' !=  null)
				self.location = "staffhome.jsp";
		}
		
</script>
</html>
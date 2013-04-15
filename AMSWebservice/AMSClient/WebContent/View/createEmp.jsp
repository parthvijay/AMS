<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Create Employee</title>
	<link href="bootstrap.css" rel="stylesheet">
		<style type="text/css">
			h1 {
				color: white;
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
		</style>

<script language="JavaScript" type="text/JavaScript">
	window.onload = function() {
			
		document.getElementById("after").style.display = 'none';
		document.getElementById("staff").style.display = 'none';
		if ('${userSession}' == "" || '${userSession}' == null)
			self.location = "login.jsp";

		if ('${error}' != "" && '${error}' != null) {
			document.getElementById("initial").style.display = 'block';
			document.getElementById("after").style.display = 'none';
			document.getElementById("staff").style.display = 'none';
		}

		if ('${msg}' == "staff") {
			document.getElementById("staff").style.display = 'block';
		}
		
		if ('${msg}' == "nop") {
			document.getElementById("after").style.display = 'block';
		}
		
		
	}
	
	function validateForm()
	{
	var x=document.forms["createEmp"]["firstname"].value;
	var y=document.forms["createEmp"]["ssn"].value;
	if (x==null || x=="")
	  {
	  alert("First name must be filled out");
	  return false;
	  }
	if (y==null || y==""){
		alert("SSN should not be null");
		  return false;
	}
	if (y.length != 9){
		alert("SSN is not valid : Should be of length 9");
		  return false;
	}
	else {
		for(var i=0; i<y.length; i++)
	     {
	       var char1 = y.charAt(i);
	       var cc = char1.charCodeAt(0);

	       if((cc>47 && cc<58))
	       {
				
	       }
	        else {
	        alert('Input should be numeric');
	        return false;
	        }
	     }
	    return true;  
	}
	
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
	<form name="createEmp" method="post" action="createEmp" >
		<input type="hidden" name="chkEmployee" value="employee">
		<div id="initial">
			<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 4em  auto;">
				<tr>
        			<td colspan="2" bgcolor="#0066FF">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<td align="center" colspan="2"><span class="message"><i>New Employee</i></span></td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">Employee Name:</td>
					<td align="left" width="60%"><input type="text" name="firstname" size="20" maxlength="20" /></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">SSN:</td>
					<td align="left" width="60%"><input type="text" name="ssn" size="20" maxlength="9" /></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right">&nbsp;</td>
					<td align="left"><button class="btn btn-small btn-primary" type="submit" name="onSubmit" onclick="return validateForm()">Submit</button></td>
					<p h4>
					<h4 style="color: red;">${error}</h4>
					</p>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
			</table>
		</div>

		<div id="after">
			<table>
				<tr>
					<td><p>
							Click <a style="color: blue; text-decoration: none;"
								href="newEmploy1.jsp">here</a> to create a New Employee.
						</p>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="staff">
			<table>
				<tr>
					<td><p>
							Click <a style="color: blue; text-decoration: none;"
								href="newStaff.jsp">here</a> to update the staff details.
						</p>
					</td>
				</tr>
			</table>
		</div>
		</form><br><br>
		<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>
</body>
</html>
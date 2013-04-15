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
body 
{
background-color:#FFFFF0
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
			if('${error}' != "true")
				document.getElementById("errordiv").style.display = 'none';
			if('${userSession}' ==  "" || '${userSession}' ==  null)
				self.location = "login.jsp";
		}
		
		function isEmpty(str)
		{
			if(str == null || str == "")
				return true;
			else
				return false;
		}
		
		function isValidDate(date)
		{
		    var matches = /^(\d{2})[-\/](\d{2})[-\/](\d{4})$/.exec(date);
		    if (matches == null) return false;
		    var d = matches[2];
		    var m = matches[1] - 1;
		    var y = matches[3];
		    var composedDate = new Date(y, m, d);
		    return composedDate.getDate() == d &&
		            composedDate.getMonth() == m &&
		            composedDate.getFullYear() == y;
		}	
		
		function validatePage()
		{
			var firstname = document.getElementsByName("firstname")[0].value;
			var lastname = document.getElementsByName("lastname")[0].value;
			var dob = document.getElementsByName("dob")[0].value;
			var ssn = document.getElementsByName("ssn")[0].value;
			var phone = document.getElementsByName("phone")[0].value;
			var email = document.getElementsByName("email")[0].value;
			var address = document.getElementsByName("address")[0].value;
			var city = document.getElementsByName("city")[0].value;
			var state = document.getElementsByName("state")[0].value;
			var zip = document.getElementsByName("zip")[0].value;
			
			if(isEmpty(firstname))alert("Please enter first name.");
			else if(isEmpty(lastname))alert("Please enter last name.");
			else if(isEmpty(dob))alert("Please enter date of birth.");
			else if(!isValidDate(dob))alert("Please enter date of birth in MM-DD-YYYY format.");
			else if(isEmpty(ssn))alert("Please enter ssn.");
			else if(isNaN(ssn) || (ssn.length != 9))alert("Please enter valid SSN.");
			else if(isEmpty(phone))alert("Please enter phone number.");
			else if((phone.length != 10) || isNaN(phone))alert("Please enter valid phone number.");
			else if(isEmpty(email))alert("Please enter email.");
			else if(isEmpty(address))alert("Please enter address.");
			else if(isEmpty(city))alert("Please enter city.");
			else if(isEmpty(state))alert("Please enter state.");
			else if(isEmpty(zip))alert("Please enter zip code.");
			else if(isNaN(zip) || (zip.length != 5))alert("Please enter valid zip code.");
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
			</table>	<br>
			<table class="Customer" width="100%" border="0">
			<tr>
				<td align="center"><h2>New Customer</h2></td>
			</tr>
		</table>
			<form method="post" action="newCustomer">
			<div id="errordiv">
			<b>Error creating new customer. Please contact System Administrator.</b>
			</div>
			<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 3em  auto;">
			<tr>
        		<td colspan="3" bgcolor="#0066FF">&nbsp;</td>
    		</tr>
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
    		<tr>
        		<td align="center" colspan="2"><span class="message">Fill Customer Information Here</span></td>
    		</tr>
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
    		<tr>
        		<td class="label" align="right" width="20%">First Name:    </td>
        		<td align="left" width="60%"><input type="text" name="firstname" placeholder="First Name" maxlength="20" size="20" value="${person.firstname}"/></td>
    		</tr>
    		<tr>
    			<td></td>
    		</tr>
    		<tr>
    			<td></td>
    		</tr>
    		<tr>
        		<td class="label" align="right">Last Name: </td>
        		<td align="left"><input type="text" name="lastname" size="20" placeholder="Last Name" maxlength="20" value="${person.lastname}"/></td>
    		</tr>
    		<tr>
    			<td></td>
    		</tr>
    		<tr>
    			<td></td>
    		</tr>
    		<tr>
    			<td class="label" align="right">Date of Birth: </td>
				<td align="left"><input type="text" name="dob" size="20" placeholder="MM-DD-YYYY"maxlength="10" value="${person.dob}"/></td>
			</tr>
			<tr>
    			<td></td>
    		</tr>
    		<tr>
    			<td></td>
    		</tr>
    		<tr>
    			<td class="label" align="right">SSN: </td>
				<td align="left"><input type="text" name="ssn" size="20" placeholder="xxx-xxx-xxxx" maxlength="9" value="${person.ssn}" /></td>
			</tr>
			<tr>
    			<td></td>
    		</tr>
    		<tr>
    			<td></td>
    		</tr>
			<tr>
    			<td class="label" align="right">Phone No: </td>
        		<td align="left"><input type="text" name="phone" size="20" placeholder="(xxx) xxx-xxxx" maxlength="10" value="${person.lastname}"/></td>
        	</tr>
        	<tr>
    			<td></td>
    		</tr>
    		<tr>
    			<td></td>
    		</tr>
			<tr>
				<td class="label" align="right">Email: </td>
				<td align="left"><input type="text" name="email" size="20" placeholder="abc@xyz.com"maxlength="80" value="${person.email}"/></td>
			</tr>
			<tr>
    			<td></td>
    		</tr>
    		<tr>
    			<td></td>
    		</tr>
			<tr>
				<td class="label" align="right">Address: </td>
				<td align="left"><input type="text" name="address" size="20" maxlength="80" value="${person.address}"/></td>
			</tr><tr>
    			<td></td>
    		</tr>
    		<tr>
    			<td></td>
    		</tr>
			<tr><td class="label" align="right">City: </td>
				<td align="left"><input type="text" name="city" size="20" maxlength="20" value="${person.city}"/></td>
			</tr>
			<tr>
    			<td></td>
    		</tr>
    		<tr>
    			<td></td>
    		</tr>
			<tr>
				<td class="label" align="right">State: </td>
				<td align="left"><input type="text" name="state" size="20" maxlength="20" value="${person.state}"/></td>
			</tr>
			<tr>
    			<td></td>
    		</tr>
    		<tr>
    			<td></td>
    		</tr>
			<tr><td class="label" align="right">Zip Code: </td>
				<td align="left"><input type="text" name="zip" size="20" placeholder="xxxxx" maxlength="5" value="${person.zip}"/></td>
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
        		<td align="left"><input type="button" name="submit" value="Create Customer" onclick="validatePage();"/></td>
        		<td>			<input id="submit" type="submit" name="submit" value="submit"/>	</td>
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
</html>
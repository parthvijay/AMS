<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>New Employee</title>
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
	</head>
	<script language="JavaScript" type="text/JavaScript">
		window.onload = function()
		{
			
			document.getElementById("submit").style.display = 'none';
			document.getElementById("staff").style.display = 'none';
			if('${error}' != "true")
				document.getElementById("errordiv").style.display = 'none';
			if('${userSession}' ==  "" || '${userSession}' ==  null)
				self.location = "login.jsp";
			
			if('${msg}' == "staff")
				document.getElementById("staff").style.display = 'block';
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
		
		
		function isEmail(email) {
			 
			   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
			   var address = email;
			   if(reg.test(address) == false) {
			 
			       return false;
			   }
			   else 
				   return true;
			}
		
		function isNaN(str){
			for(var i=0; i<str.length; i++)
		     {
		       var char1 = str.charAt(i);
		       var cc = char1.charCodeAt(0);

		       if((cc>47 && cc<58))
		       {
					
		       }
		        else {
		        alert('Input values for SSN, Zip and Phone should be numeric');
		        return false;
		        }
		     }
		    return true; 
		}
		
		function isAlpha(str){
			for(var i=0; i<str.length; i++)
		      {
		        var char1 = str.charAt(i);
		        var cc = char1.charCodeAt(0);

		        if((cc>47 && cc<58) || (cc>64 && cc<91) || (cc>96 && cc<123))
		        {

		        }
		         else {
		         alert('Input is not alphanumeric');
		         return false;
		         }
		      }
		     return true;   
		}
		
		function isVal(str){
			if (str == "Admin" || str == "CSR" || str == "Pilot" || str == "AirHostess"){
				return false;
			}
			else
				return true;
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
			var myalid=document.getElementById("myalid");
			var alid = myalid.options[myalid.selectedIndex].text;
			var mylist=document.getElementById("myList");
			var position=mylist.options[mylist.selectedIndex].text;

			var hiredate = document.getElementsByName("hiredate")[0].value;
			

			if(isEmpty(firstname))alert("Please enter first name.");
			else if(isEmpty(lastname))alert("Please enter last name.");
			else if(isEmpty(dob))alert("Please enter date of birth.");
			else if(!isValidDate(dob))alert("Please enter date of birth in MM-DD-YYYY format.");
			else if(isEmpty(ssn))alert("Please enter ssn.");
			else if(!isNaN(ssn) || (ssn.length != 9))alert("Please enter valid SSN of length 9");
			else if(isEmpty(phone))alert("Please enter phone number.");
			else if((phone.length != 10) || !isNaN(phone))alert("Please enter valid phone number.");
			else if(isEmpty(email))alert("Please enter email.");
			else if(!isEmail(email))alert("Invalid email Id");
			else if(isEmpty(address))alert("Please enter address.");
			else if(isEmpty(city))alert("Please enter city.");
			else if(isEmpty(state))alert("Please enter state.");
			else if(isEmpty(zip))alert("Please enter zip code.");
			else if(!isNaN(zip) || (zip.length != 5))alert("Please enter valid zip code.");
			else if(isEmpty(alid)) alert("Airline Id is not valid");
			else if(isEmpty(position)) alert("Invalid input for position");
			else if (isEmpty(hiredate)) alert("Please enter hiredate");
			else if (!isValidDate(hiredate))alert("Please enter the hiredate in MM-DD-YYYY format");
			else {document.getElementById("submit").click();}
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
		<form method="post" action="newEmploy">
			<div id="errordiv">
			<!-- <b>Error creating new customer. Please contact System Administrator.</b> -->
			<br><br>
			</div>
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
					<td class="label" align="right" width="30%">First Name: </td>
					<td align="left" width="60%"><input type="text" name="firstname" size="20" maxlength="20" value="${person.firstname}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">Last Name: </td>
					<td align="left" width="60%"><input type="text" name="lastname" size="20" maxlength="20" value="${person.lastname}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">Date of Birth: </td>
					<td align="left" width="60%"><input type="text" name="dob" size="20" maxlength="10" value="${person.dob}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">SSN: </td>
					<td align="left" width="60%"><input type="text" name="ssn" size="20" maxlength="9" value="${person.ssn}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">Phone: </td>
					<td align="left" width="60%"><input type="text" name="phone" size="20" maxlength="10" value="${person.phone}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">Email: </td>
					<td align="left" width="60%"><input type="text" name="email" size="20" maxlength="80" value="${person.email}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">Address: </td>
					<td align="left" width="60%"><input type="text" name="address" size="20" maxlength="80" value="${person.address}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">City: </td>
					<td align="left" width="60%"><input type="text" name="city" size="20" maxlength="20" value="${person.city}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">State: </td>
					<td align="left" width="60%"><input type="text" name="state" size="20" maxlength="2" value="${person.state}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">Zip Code: </td>
					<td align="left" width="60%"><input type="text" name="zip" size="20" maxlength="5" value="${person.zip}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">Alid : </td>
					<td align="left" width="60%"><select id="myalid" name="alid" style="width: 145px;">
						<option></option>
						<option>AAALS</option>
						<option>AKALS</option>
						<option>SWALS</option>
						<option>DALS</option>
						<option>UAALS</option>
						</select>
					</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">Position:</td>
					<td align="left" width="60%"> <select id="myList" name="position" style="width: 145px;">
						<option></option>
						<option>Admin</option>
						<option>CSR</option>
						<option>Air Hostess</option>
						<option>Pilot</option>
						</select>
					</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="30%">hiredate: </td>
					<td align="left" width="60%"><input type="text" name="hiredate" size="20" maxlength="10" value="${staff.hiredate}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
    				<td class="label" align="right">&nbsp;</td>
    				<td align="left">
    					<input type="button" value="Create Employee" onclick="validatePage();"/> 	
						<input id="submit" type="submit" name="submit" value="submit"/>	
					</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
			</table><br><br>

			
			
					<h4 style="color: blue;">${error}</h4>
				
					
			<div id="staff">
			<table>
				<tr>
					<td><p>
							Click <a style="color: blue; text-decoration: none;"
								href="adminHome.jsp">here</a> to go Back to Admin page.
						</p>
					</td>
				</tr>
			</table>
		</div>
		</form><br><br>
		<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Connection.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Search Employee</title>
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
<script language="JavaScript" type="text/JavaScript">
	window.onload = function() {

		document.getElementById("details").style.display = 'block';
		document.getElementById("modify").style.display='none'; 
		document.getElementById("error").style.display = 'none';
		document.getElementById("submit").style.display = 'none';
		//document.getElementById("delEmpId").style.display = 'none';
		{
			if ('${userSession}' == "" || '${userSession}' == null)
				self.location = "login.jsp";

			if ('${msg}' == "nop") {
				document.getElementById("error").style.display = 'block';
				document.getElementById("search").style.display = 'block';
				document.getElementById("details").style.display = 'none';

			}
		}

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
		var name = document.getElementsByName("name")[0].value;
		var airline = document.getElementsByName("airline")[0].value;
	

		//if(isEmpty(name))alert("Please enter a Name.");
		//else if(isEmpty(airline))alert("Please enter the airline");
		//else 
		document.getElementById("submit").click();

		//document.getElementById("details").style.display = 'block';
		//document.getElementById("search").style.display = 'block';
	}
	
	function isEmpty(str)
	{
		if(str == null || str == "")
			return true;
		else
			return false;
	}
	
	function chkdetails() {
		
			document.getElementById("details").style.display = 'block';
			document.getElementById("search").style.display = 'block';
	}
	
	function deleteEmp(empId, val){
		alert("====Hello====");
		document.getElementById("pageval").value = val;
		document.getElementById("EmpId").value = empId;
		   var retVal = confirm("Do you want to delete ?");
		   //alert(empId);
		   if( retVal == true ){
			   document.getElementById("submit").click(); 
			   //location.href = "searchEmp?pageval=DEL&EmpId=" + empId;
			   //var url = "searchEmp?pageval="+val+"&EmpId="+empId;
			   //window.location=url;
			    
		   }
	}
	function modify(sid,fname,lname,address,city,state,zip,phone,email,hiredate,dob,airline,alid,status,position)
		{
		
		
		//alert("Inside javascript : modify()"+sid+fname+lname+address+city+state+zip+phone+email+hiredate+dob+airline+alid+status+position);
		document.getElementById("details").style.display='none';
		document.getElementById("modify").style.display='block';
		
		document.getElementById("eid").value=sid;
		document.getElementById("firstname").value=fname;
		document.getElementById("lastname").value=lname;
		document.getElementById("address").value=address;
		document.getElementById("city").value=city;
		document.getElementById("state").value=state;
		document.getElementById("zip").value=zip;
		document.getElementById("phone").value=phone;
		document.getElementById("email").value=email;
		document.getElementById("hiredate").value=hiredate;
		document.getElementById("dateofbirth").value=dob;
		document.getElementById("airlinename").value=airline;
		document.getElementById("airlineid").value=alid;
		document.getElementById("position1").value=position;
		document.getElementById("status").value=status;
		
		//alert(document.getElementById("position1").value);
		
		//alert("Edit button clicked "+sid+" "+fname+" "+lname+" "+address+" "+city+" "+state+" "+zip+" "+phone+" "+email+" "+hiredate+" "+dob+" "+airlines);
		}
	
	function save1(val)
	{
		//alert(msg);
		document.getElementById("pageval").value = val;
		//alert(val);
		
		var firstname = document.getElementsByName("firstname")[0].value;
		var lastname  = document.getElementsByName("lastname")[0].value;
		var address  = document.getElementsByName("address")[0].value;
		var city  = document.getElementsByName("city")[0].value;
		var state  = document.getElementsByName("state")[0].value;
		var zip  = document.getElementsByName("zip")[0].value;
		var phone  = document.getElementsByName("phone")[0].value;
		var email  = document.getElementsByName("email")[0].value;
		var hiredate  = document.getElementsByName("hiredate")[0].value;
		var dateofbirth  = document.getElementsByName("dateofbirth")[0].value;
		var airlinename  = document.getElementsByName("airlinename")[0].value;
		var airlineid  = document.getElementsByName("airlineid")[0].value;
		var status  = document.getElementsByName("status")[0].value;
		var position  = document.getElementsByName("position")[0].value;
		
		if(isEmpty(firstname))alert("Please enter first name.");
		else if(isEmpty(lastname))alert("Please enter your last name.");
		else if(isEmpty(address))alert("Please enter the address.");
		else if(isEmpty(city))alert("Please enter the city");
		else if(isEmpty(state))alert("Please enter the state");
		else if(isEmpty(zip))alert("Please enter the zip.");
		else if(isEmpty(phone))alert("Please enter the phone.");
		else if(isEmpty(email))alert("Please enter the email.");
		else if(isEmpty(hiredate))alert("Please enter the hiredate.");
		else if(isEmpty(dateofbirth))alert("Please enter the date of birth.");
		else if(isEmpty(airlinename))alert("Please enter the airline name.");
		else if(isEmpty(airlineid))alert("Please enter the airline id.");
		else if(isEmpty(status))alert("Please enter the job status.");
		else if(isEmpty(position))alert("Please enter the job position.");
		else 
			{
			//alert("Form validated");
			document.getElementById("submit").click();
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
	<form name = "myform" method="post" action="searchEmp">

		<input id="pageval" type="hidden" name="pageval"/>
		<input type="hidden" name="searchEmp" value="employee">
		<div id="search">
		<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 4em  auto;">
			<tr>
        		<td colspan="2" bgcolor="#0066FF">&nbsp;</td>
    		</tr>
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
    		<tr>
        		<td align="center" colspan="2"><span class="message"><i>Search Employee</i></span></td>
    		</tr>
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
			<tr>
				<td class="label" align="right" width="20%">First Name:</td>
				<td align="left" width="60%"><input type="text" name="name" value="${name}" size="20" maxlength="20"></td>
			</tr>
			<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
			<tr>
				<td class="label" align="right" width="20%">Enter Airline:</td>
				<td align="left" width="60%"><input type="text" name="airline" value="${airline}" size="20" maxlength="20"></td>
			</tr>
			<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
			<tr>
				<td class="label" align="right">&nbsp;</td>
				<td align="left">
					<input type="button" name="click" value="Search" onclick="validatePage()">
					<input id="submit"type="submit" name="submit" value="Submit">
				</td>
			</tr>	
			<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
		</table>
		</div>
		<div id="error">
			<p>
			<h4 style="color: red;">${error}</h4>
			</p>
		</div>
		<div id="details">
			<h2 class="head">Employee Information</h2><br>
			<p h4>
			<h4 style="color: red;">${error}</h4>
			</p>
			<table id="flights" align="center" width="100%" border="1">
				<tr>
					<th>Employee Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Address</th>
					<th>City</th>
					<th>State</th>
					<th>Zip</th>
					<th>Phone</th>
					<th>email</th>
					<th>Hire_Date</th>
					<th>Date_Of_Birth</th>
					<th>Airline</th>
					<th>Alid</th>
					<th>Status</th>
					<th>Position</th>
					<th>Edit</th>
					<th>Edit</th>
				</tr>

			<%
				DisplayStaff[] staffs = null;
				if (request.getAttribute("searchStaff") != null) {
					staffs = (DisplayStaff[]) request.getAttribute("staffS");
			%>
			
				<%
					for (int i=0;i<staffs.length;i++) { %>
				<tr align="center" class="alt">
					<td><%=staffs[i].getSid()%></td>
					<td><%=staffs[i].getFirstname()%></td>
					<td><%=staffs[i].getLastname()%></td>
					<td><%=staffs[i].getAddress()%></td>
					<td><%=staffs[i].getCity()%></td>
					<td><%=staffs[i].getState()%></td>
					<td><%=staffs[i].getZip()%></td>
					<td><%=staffs[i].getPhone()%></td>
					<td><%=staffs[i].getEmail()%></td>
					<td><%=staffs[i].getHiredate()%></td>
					<td><%=staffs[i].getDob()%></td>
					<td><%=staffs[i].getAirline()%></td>
					<td><%=staffs[i].getAlid()%></td>
					<td><%=staffs[i].getStatus()%></td>
					<td><%=staffs[i].getPosition()%></td>
					<td>
						<input type="text" id="delEmpId" name="EmpId" value="<%=staffs[i].getSid()%>" style="visibility:hidden" />
						<input type="button" name="Delete" value="Delete" onclick="deleteEmp(<%=staffs[i].getSid()%>, 'DEL')">
					</td>
					<td>
						<input type="button" name="Edit" value="Edit" onclick="modify(<%=staffs[i].getSid()%>, '<%=staffs[i].getFirstname()%>','<%=staffs[i].getLastname()%>',
					 '<%=staffs[i].getAddress()%>' ,'<%=staffs[i].getCity()%>' ,'<%=staffs[i].getState()%>','<%=staffs[i].getZip()%>','<%=staffs[i].getPhone()%>',
					 '<%=staffs[i].getEmail()%>','<%=staffs[i].getHiredate()%>','<%=staffs[i].getDob()%>','<%=staffs[i].getAirline()%>','<%=staffs[i].getAlid()%>','<%=staffs[i].getStatus()%>','<%=staffs[i].getPosition()%>')">
					</td>
				</tr>
			
			<%
				}
			%>

			<% 
				}
			%>
			</table><br/><br/>
		</div>
		
		<div id="modify">
		
	<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 4em  auto;">
		<tr>
        	<td colspan="2" bgcolor="#0066FF">&nbsp;</td>
    	</tr>
    	<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
    	<tr>
        	<td align="center" colspan="2"><span class="message">New Modify Division</span></td>
    	</tr>
    	<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
    	<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
		<tr>
			<td class="label" align="right" width="20%">Firstname: </td>
			<td align="left" width="60%"><input type ="text" id="firstname" name="firstname" size="20" maxlength="20"></td>
		</tr>
		<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
		<tr>
			<td class="label" align="right" width="20%">Lastname: </td>
			<td align="left" width="60%"><input type ="text" id="lastname" name="lastname" size="20" maxlength="20"></td>
		</tr>
		<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
		<tr>
			<td class="label" align="right" width="20%">Address: </td>
			<td align="left" width="60%"><input type ="text" id="address" name="address" size="20"></td>
		</tr>
		<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
		<tr>
			<td class="label" align="right" width="20%">City: </td>
			<td align="left" width="60%"><input type ="text" id="city" name="city" size="20"></td>
		</tr>
		<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
		<tr>
			<td class="label" align="right" width="20%">State: </td>
			<td align="left" width="60%"><input type ="text" id="state" name="state" size="20"></td>
		</tr>
		<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
		<tr>
			<td class="label" align="right" width="20%">Zip: </td>
			<td align="left" width="60%"><input type ="text" id="zip" name="zip" maxlength="5" size="20"></td>
		</tr>
		<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
		<tr>
			<td class="label" align="right" width="20%">Phone: </td>
			<td align="left" width="60%"><input type ="text" id="phone" name="phone" size="20" maxlength="10"></td>
		</tr>
		<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
		<tr>
			<td class="label" align="right" width="20%">Email: </td>
			<td align="left" width="60%"><input type ="text" id="email" name="email" size="20"></td>
		</tr>
		<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
		<tr>
			<td class="label" align="right" width="20%">Airline Id: </td>
			<td align="left" width="60%">
				<select name="airlineid" id="airlineid">
					<option value="UAALS">UAALS</option>
				  	<option value="SWALS">SWALS</option>
				  	<option value="DALS">DALS</option>
				  	<option value="AAALS">AAALS</option>
				  	<option value="AKALS">AKALS</option>
				</select>	
			</td>
		</tr>
		<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
		<tr>
			<td class="label" align="right" width="20%">Position: </td>
			<td align="left" width="60%">
				<select name="position" id="position1">
					<option value="Admin">Admin</option>
				  	<option value="CSR">CSR</option>
				  	<option value="Pilot">Pilot</option>
				  	<option value="Air Hostess">Air Hostess</option>
				</select>			
			</td>
		</tr>
		<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
    	<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr>
		<tr>
			<td class="label" align="right">&nbsp;</td>
			<td align="left">
				<input type ="button" id="save" value="Save" onclick="save1('save');">
			</td>
		</tr>
		<tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	</tr> 
    	
		</table>
		<table>
		<tr><td><input type ="text" style="visibility:hidden" id="eid" name="eid" size="20" maxlength="9"></td></tr>
		<tr><td><input type ="text" id="hiredate" style="visibility:hidden" name="hiredate" size="20"></td></tr>
		<tr><td><input type ="text" style="visibility:hidden" id="dateofbirth" name="dateofbirth" size="20"></td></tr>
		<tr><td><input type ="text" id="airlinename" name="airlinename" size="20" style="visibility:hidden" ></td></tr>
			<tr><td><input type ="text" id="status" name="status" size="20" style="visibility:hidden"></td></tr>
		
		</table>
		</div>
	</form>
	<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>
</body>
</html>
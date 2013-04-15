<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>Customer Profile</title>
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
<script type="text/javascript" src="jquery-1.7.1.js"></script>
	
	<body background = "background.jpeg">
		<table class="head" width="100%" border="2">
			<tr>
				<td colspan="2" style="background-color: blue;">
					<h1>Airline Management System</h1>
				</td>
			</tr>
		</table>	<br><br><br>
		<form method="post" action="customers">
			<div id="divRead">
			<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 3em  auto;">
				<tr>
        			<td colspan="2" bgcolor="#0066FF">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<th align="center" colspan="2"><span class="message"><i>Customer Profile</i></span></th>
    			</tr>	
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">First Name: </td>
					<td align="center" width="60%"> ${sessionScope.person.firstname}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">Last Name: </td>
					<td align="center" width="60%"> ${sessionScope.person.lastname}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%" id="ssn" >SSN:  </td>
					<td align="center" width="60%">${sessionScope.person.ssn}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>	
					<td class="label" align="center" width="20%" id="dob">Date of Birth:  </td>
					<td align="center" width="60%">${sessionScope.person.dob}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">Email:  </td>
					<td align="center" width="60%">${sessionScope.person.email}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">Phone:  </td>
					<td align="center" width="60%">${sessionScope.person.phone}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">PassPort:  </td>
					<td align="center" width="60%">${sessionScope.customer.passport}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">Nationality:  </td>
					<td align="center" width="60%">${sessionScope.customer.nationality}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">Address:  </td>
					<td align="center" width="60%">${sessionScope.person.address}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">City:  </td>
					<td align="center" width="60%">${sessionScope.person.state}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">State:  </td>
					<td align="center" width="60%">${sessionScope.person.state}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="center" width="20%">Zip Code: </td>
					<td align="center" width="60%">${sessionScope.person.zip}</td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right">&nbsp;</td>
					<td align="left"><input id="edit" align="right" type="button" value="  Edit  "/></td>
				</tr>	
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
			</table>
			<br><br>
				<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>
			</div>

			<div id="divEdit">
			<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="450px" style="margin: 3em  auto;">
				<tr>
        			<td colspan="2" bgcolor="#0066FF">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<th align="center" colspan="2"><span class="message"><i>Edit Here</i></span></th>
    			</tr>	
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			
				<tr>
					<td class="label" align="right" width="20%">First Name: </td>
					<td align="left" width="60%"><input type="text" name="firstname" size="20" maxlength="20" value="${sessionScope.person.firstname}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Last Name: </td>
					<td align="left" width="60%"><input type="text" name="lastname" size="20" maxlength="20" value="${sessionScope.person.lastname}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Email: </td>	
					<td align="left" width="60%"><input type="text" name="email" size="20" maxlength="80" value="${sessionScope.person.email}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Phone: </td>	
					<td align="left" width="60%"><input type="text" name="phone" size="20" maxlength="10" value="${sessionScope.person.phone}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Passport: </td>	
					<td align="left" width="60%"><input type="text" name="passport" size="20" maxlength="80" value="${sessionScope.customer.passport}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Nationality: </td>	
					<td align="left" width="60%"><input type="text" name="nationality" size="20" maxlength="80" value="${sessionScope.customer.nationality}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Address: </td>
					<td align="left" width="60%"><input type="text" name="address" size="20" maxlength="80" value="${sessionScope.person.address}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">City: </td>	
					<td align="left" width="60%"><input type="text" name="city" size="20" maxlength="20" value="${sessionScope.person.city}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">State: </td>
					<td align="left" width="60%"><input type="text" name="state" size="20" maxlength="20" value="${sessionScope.person.state}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Zip Code: </td>
					<td align="left" width="60%"><input type="text" name="zip" size="20" maxlength="5" value="${sessionScope.person.zip}"/></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right">&nbsp;</td>
					<td>
						<input id="save" type="button" value="Save"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="cancel" type="button" value="cancel"/>
					</td>
					<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
			</table>
				<br><br>
				<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>
			</div>

		<input id="pageVal" type="hidden" name="pageVal"/>
		<input id="submit" type="submit" name="submit" value="Edit"/>
			
		</form>
		

<script language="JavaScript" type="text/JavaScript">

	$(window).load(function(){
		$("#submit").hide();
		if('${userSession}' ==  "" || '${userSession}' ==  null)
			self.location = "customerLogin.jsp";
		$("#divEdit").hide();
	});
	
	$("#edit").click(function(){
		$("#divRead").hide();
		$("#ssn").hide();
		$("#dob").hide();
		$("#divEdit").show();
	});
	
	$("#save").click(function(){
		$("#pageVal").val('save');
		if(!$("input[name=firstname]").val())alert("Please enter first name.");
		else if(!$("input[name=lastname]").val())alert("Please enter last name.");
		else if(!$("input[name=phone]").val())alert("Please enter phone number.");
		else if(($("input[name=phone]").val().length != 10) || isNaN($("input[name=phone]").val()))alert("Please enter valid phone number.");
		else if(!$("input[name=email]").val())alert("Please enter email.");
		else if(!$("input[name=address]").val())alert("Please enter address.");
		else if(!$("input[name=city]").val())alert("Please enter city.");
		else if(!$("input[name=state]").val())alert("Please enter state.");
		else if(!$("input[name=zip]").val())alert("Please enter zip code.");
		else if(isNaN($("input[name=zip]").val()) || ($("input[name=zip]").val().length != 5))alert("Please enter valid zip code.");
		else if(!$("input[name=passport]").val())alert("Please enter passport number.");
		else if(!$("input[name=nationality]").val())alert("Please enter your Nationality.");
		else $("#submit").click();
	});		
	
	$('#cancel').click(function(){
		self.location = "viewProfile.jsp";
		});	
	</script>
		
	</body>
</html>

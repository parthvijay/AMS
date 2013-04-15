<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>New Staff</title>
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
			if ('${msg}' == "staff") {
				document.getElementById("staff").style.display = 'block';
			}
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
		
		function isEmail(str)
		{
		var atpos=str.indexOf("@");
		var dotpos=str.lastIndexOf(".");
		if (atpos<1 || dotpos<atpos+2 || dotpos+2>=str.length)
		  {
		  alert("Not a valid e-mail address");
		  return false;
		  }
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
		
		function favBrowser()
		{
		var mylist=document.getElementById("myList");
		var value=mylist.options[mylist.selectedIndex].text;
		}
		
		function isAlp(str){
			for(var i=0; i<str.length; i++)
		      {
		        var char1 = str.charAt(i);
		        var cc = char1.charCodeAt(0);

		        if((cc>64 && cc<91) || (cc>96 && cc<123))
		        {

		        }
		         else {
		         alert('Input is not alphabetic');
		         return false;
		         }
		      }
		     return true;   
		}
		
		function isVal(str){
			if (str.toString() == "Admin" || str.toString() == "CSR" || str.toString() == "Pilot" || str.toString() == "Air Hostess"){
				return false;
			}
			else
				return true;
		}
		
		function validatePage()
		{
			var myalid=document.getElementById("myalid");
			var alid = myalid.options[myalid.selectedIndex].text;
			
			var mylist=document.getElementById("myList");
			var position=mylist.options[mylist.selectedIndex].text;
			
			var hiredate = document.getElementsByName("hiredate")[0].value;

			if(isEmpty(alid)) alert("Airline Id is not valid");
			else if(isEmpty(position)) alert("Invalid input for position");
			else if (isEmpty(hiredate)) alert("Please enter hiredate");
			else if (!isValidDate(hiredate))alert("Please enter the hiredate in MM-DD-YYYY format");
			else document.getElementById("submit").click();
		}
	</script>
<body>
	<form method="post" action="newStaff">
		<input type="hidden" name="newStaff" value="staff" />
		<h1>Update Staff Details</h1>
		<div id="errordiv">
			<!-- <b>Error creating new customer. Please contact System Administrator.</b> -->
			<br>
			<br>
		</div>
		<table>
			<tr>
				<td>Alid : </td>
				<td><select id="myalid" name="alid">
						<option></option>
						<option>AAALS</option>
						<option>AKALS</option>
						<option>SWALS</option>
						<option>DALS</option>
						<option>UAALS</option>
						</select></td>
			</tr>
			<tr>
				<td>Position:</td>
				<td> <select id="myList" name="position">
						<option></option>
						<option>Admin</option>
						<option>CSR</option>
						<option>Air Hostess</option>
						<option>Pilot</option>
						</select></td>
			</tr>
			<tr>
				<td>Hiredate:</td>
				<td><input type="text" name="hiredate" size="10" maxlength="10"
					value="${staff.hiredate}" />
				</td>
			</tr>
		</table>
		<br>
		<br> <input type="button" value="Create Staff"
			onclick="validatePage();" /> <input id="submit" type="submit"
			name="submit" value="submit" />
		<div id="staff">
			<table>
				<tr>
					<td><p>
							Click <a style="color: blue; text-decoration: none;"
								href="newStaff.jsp">here</a> to update the staff details.
						</p></td>
				</tr>
			</table>
	</form>
</body>
</html>


</body>
</html>
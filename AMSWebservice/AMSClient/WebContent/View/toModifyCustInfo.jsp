<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Servlets.*, java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Modify Customer</title>
			<style type="text/css">
				h1 {
				color: white;
				text-align:center;
				font-style: italic;
				text-shadow: 1px 1px 1px #000;
				}
				h2.h
				{
				font-style: italic;
				color: #0066FF;
				text-align:center;
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
			</style>
</head>
  <script language="JavaScript" type="text/JavaScript">
  
	  window.onload = function()
	  {
	      document.getElementById("submit").style.display = 'none';
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
          var phone = document.getElementsByName("phone")[0].value;
          var email = document.getElementsByName("email")[0].value;
          var address = document.getElementsByName("address")[0].value;
          var city = document.getElementsByName("city")[0].value;
          var state = document.getElementsByName("state")[0].value;
          var zip = document.getElementsByName("zip")[0].value;
          
          if(isEmpty(phone))alert("Please enter phone number.");
          else if((phone.length != 10) || isNaN(phone))alert("Please enter valid phone number.");
          else if(isEmpty(email))alert("Please enter email.");
          else if(isEmpty(address))alert("Please enter address.");
          else if(isEmpty(city))alert("Please enter city.");
          else if(isEmpty(state))alert("Please enter state.");
          else if(isEmpty(zip))alert("Please enter zip code.");
          else if(isNaN(zip) || (zip.length != 5))alert("Please enter valid zip code.");
          else document.getElementById("submit").click();     
      }

      function close()
      {
    	  window.close();
      }
      </script>
        
        

<body background = "background.jpeg">
	<table class="head" width="100%" border="2">
		<tr>
			<td colspan="2" style="background-color: blue;">
				<h1>Airline Management System</h1>
			</td>
		</tr>
	</table>	
		<br><br>
<%
String[] vals = null;

if(request.getParameter("result") != null)
{
    vals = ((String)request.getParameter("result")).split("\\$");
}

%>

<CENTER>
 <form method="post" action="modifyCustomerInfo">
     <h2 class="h">Customer Info. Modification</h2>
     <table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 6.5em  auto;">
		 <tr>
        	<td colspan="2" bgcolor="#0066FF">&nbsp;</td>
    	 </tr>
    	 <tr>
        	<td colspan="2" class="label">&nbsp;</td>
    	 </tr>
         <tr>
         	<td class="label" align="right" width="20%">First Name : </td>
         	<td align="left" width="60%"><input type="text" name="firstname" size="20" maxlength="20" disabled="disabled" value='<%=vals[1] %>' ></td> 
         </tr>
         <tr>
        	<td colspan="2" class="label">&nbsp;</td>
        </tr>
         <tr>
         	<td class="label" align="right" width="20%">Last Name : </td>
         	<td align="left" width="60%"><input type="text" name="lastname" size="20" maxlength="20" disabled="disabled" value='<%=vals[2] %>' ></td>
         </tr>
         <tr>
        	<td colspan="2" class="label">&nbsp;</td>
        </tr>
         <tr>
         	<td class="label" align="right" width="20%">Date of Birth : </td>
         	<td align="left" width="60%"><input type="text" name="dob" size="10" maxlength="10" disabled="disabled" value=<%=vals[9] %> ></td>
         </tr>
         <tr>
        	<td colspan="2" class="label">&nbsp;</td>
        </tr>
         <tr>
         	<td class="label" align="right" width="20%">Phone : </td>
         	<td align="left" width="60%"><input type="text" name="phone" size="10" maxlength="10" value=<%=vals[5] %> ></td>
         </tr>
         <tr>
        	<td colspan="2" class="label">&nbsp;</td>
        </tr>
         <tr>
         	<td class="label" align="right" width="20%">Email : </td>
         	<td align="left" width="60%"><input type="text" name="email" size="20" maxlength="80" value='<%=vals[6] %>' ></td>
         </tr>
         <tr>
        	<td colspan="2" class="label">&nbsp;</td>
        </tr>
         <tr>
         	<td class="label" align="right" width="20%">Address : </td>
         	<td align="left" width="60%"><input type="text" name="address" size="20" maxlength="80" value='<%=vals[3] %>' ></td>
         </tr>
         <tr>
        	<td colspan="2" class="label">&nbsp;</td>
        </tr>
         <tr>
         	<td class="label" align="right" width="20%">City : </td>
         	<td align="left" width="60%"><input type="text" name="city" size="20" maxlength="20"  value='<%=vals[4] %>' ></td>
         </tr>
         <tr>
        	<td colspan="2" class="label">&nbsp;</td>
        </tr>
         <tr>
         	<td class="label" align="right" width="20%">State : </td>
         	<td align="left" width="60%"><input type="text" name="state" size="20" maxlength="20"  value='<%=vals[7] %>' ></td>
         </tr>
         <tr>
        	<td colspan="2" class="label">&nbsp;</td>
        </tr>
         <tr>
         	<td class="label" align="right" width="20%">Zip Code : </td>
         	<td align="left" width="60%"><input type="text" name="zip" size="5" maxlength="5"  value=<%=vals[8] %> ></td>
         </tr>
         <tr>
        	<td colspan="2" class="label">&nbsp;</td>
        </tr>
		<tr>
        	<td class="label" align="right">&nbsp;</td>
        	<td align="left">
        		<input type="button" value="Modify Customer" onclick="validatePage();"/>
     			<input type="hidden" name="modifyingCustomer" value="modifyingCustomer"/> 
     			<input type="hidden" name="cid" value='<%=request.getParameter("cid")%>'/> 
     			<input id="submit" type="submit" name="submit" value="submit" onclick="close();"/>
     		</td>
         </tr>
         <tr>
        	<td colspan="2" class="label">&nbsp;</td>
        </tr>
     </table>      
 </form><br><br>
</CENTER>
<h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>
</body>
</html>
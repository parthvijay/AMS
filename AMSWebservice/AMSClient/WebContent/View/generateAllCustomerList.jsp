<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<title>Customer List</title>
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
    			align: center;
				}
			.tableBorder{
    			border:solid 1px #0066FF;
    			margin-top:100px;
				}
			.message{
    			font-family:Verdana, Arial, Helvetica, sans-serif;
    			font-size:18px;
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
        	document.getElementById("div3").style.display = 'block';
            
            if('${showCusList}' == "true")
            {
                document.getElementById("div3").style.display = 'none';
                window.open ('existingBookings.jsp','_self',false);
                
                alert('<%=request.getAttribute("result")%>');
                window.open('displayCustomerList.jsp?result='+'<%=request.getAttribute("result")%>', 'success', 'width=800,height=350,status=yes,resizable=yes,scrollbars=yes');
            }

            if('${userSession}' ==  "" || '${userSession}' ==  null)
                self.location = "login.jsp";
            

            if(('${airlIdError}' != "" && '${airlIdError}' != null) || ('${jnryDtError}' != "" && '${jnryDtError}' != null))
            {
                document.getElementById("div3").style.display = 'block';
            }
        }
        
        function isValidDate(date)
        {
            var matches = /^(\d{2})[-\/](\d{2})[-\/](\d{4})$/.exec(date);
            if (matches == null) return false;
            var m = matches[2] - 1;
            var d = matches[1];
            var y = matches[3];
            var composedDate = new Date(y, m, d);
            return composedDate.getDate() == d &&
                    composedDate.getMonth() == m &&
                    composedDate.getFullYear() == y;
        }
        
        function isEmpty(str)
        {
            if(str == null || str == "")
                return true;
            else
                return false;
        }
        
        function validateCustomersListPage()
        {
            var airlId = document.getElementsByName("airlId")[0].value;
            var jnryDate = document.getElementsByName("jnryDate")[0].value;
            if(isEmpty(airlId))alert("Please enter AirLine Id.");
            else if(airlId.length != 5  || (!isNaN(airlId)))alert("Please enter valid AirLine Id.");
            else if(isEmpty(jnryDate))alert("Please enter Journey date.");
            else if(!isValidDate(jnryDate)) alert("Please enter Journey date in DD-MM-YYYY format.");
            else document.getElementById("submit").click();
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
        <form method="post"  action="generateAllCustomerList">  
            <div id="div3">
                <table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="40%" style="margin: 6.5em  auto;">
                    <tr>
        				<td colspan="3" bgcolor="#0066FF">&nbsp;</td>
    				</tr>
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
    				<tr>
        				<td align="center" colspan="2"><span class="message">Display Customers List</span></td>
    				</tr>
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
    				<tr>
                    	<td class="label" align="center" width="30%">AirLine Id : </td>
                    	<td align="left" width="60%"><input type="text" name="airlId" size="20" maxlength="5" value="${airlId}"/></td><td style="color:red;">${airlIdError}</td>
                    </tr>
                    
    				<tr>
    				<tr>
    					<td></td>
    				</tr>
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr>
                    	<td class="label" align="center" width="20%">Journey Date : </td>
                    	<td align="left" width="60%"><input type="text" name="jnryDate" size="20" maxlength="10" value="${jnryDate}"/></td><td style="color:red;">${jnryDtError}</td>
                    </tr>
            
    				<tr>
    					<td></td>
    				</tr>
    				<tr>
    				<tr>
    					<td></td>
    				</tr>
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                  	<tr>
                  		<td class="label" align="right">&nbsp;</td>
                  		<td align="left">	
                  			<input type="hidden" name="displayCusList" value="displayCusList"/>
                			<input type="button" value="Get Customers List" onclick="validateCustomersListPage();"/>    
                			<input id="submit" type="submit" name="submit" value="submit"/> 
                  		</td>
                  	</tr>
                  	<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                </table>
            </div>
           
        </form>
        <h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5>
    </body>
</html>
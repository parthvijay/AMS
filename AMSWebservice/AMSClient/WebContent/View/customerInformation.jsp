<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<title>AMS-Customer Information</title>
		<link href="bootstrap.css" rel="stylesheet">
		<style type="text/css">
			h1 {
					color: white;
					text-align:center;
					font-style: italic;
					text-shadow: 1px 1px 1px #000;
				}
			h2.head{
					color: #0066FF;
					text-align:center;
					font-style: italic;
					text-shadow: 1px 1px 1px #000;	
				}
			h2 {	text-align:center;
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
    <script language="JavaScript" type="text/JavaScript">

        window.onload = function()
        {
        	document.getElementById("submit").style.display = 'none';
        	
            if('${showCustomer}' == "true")
            {
                document.getElementById("div2").style.display = 'none';
                window.open ('existingBookings.jsp','_self',false);
                window.open('displayCustomerCompleteInfo.jsp?result='+'<%=request.getAttribute("result")%>', 'success', 'width=800,height=350,status=yes,resizable=yes,scrollbars=yes');
            }

            if('${userSession}' ==  "" || '${userSession}' ==  null)
                self.location = "login.jsp";
            

            if(('${cid}' != "" && '${cid}' != null) || ('${error}' != "" && '${error}' != null))
            {
                document.getElementById("div2").style.display = 'block';
            }
            else
                document.getElementById("div2").style.display = 'block';
        }
        
        function isEmpty(str)
        {
            if(str == null || str == "")
                return true;
            else
                return false;
        }
        
        function validateCustomer()
        {
            var cid = document.getElementsByName("cid")[0].value;
            if(isEmpty(cid))alert("Please enter customer Id.");
            else if(cid.length != 9  || (isNaN(cid)))alert("Please enter valid customer id.");
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
		</table>
			<br><br>
			<h2>Staff Home</h2>
			<br>
        <form method="post"  action="customerInformation">
			
            <div id="div2">
                <h2 class="head">Display Customer Information</h2>
                <table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="450px" style="margin: 6.5em  auto;">
                    <tr>
        				<td colspan="3" bgcolor="#0066FF">&nbsp;</td>
    				</tr>
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr>
                    	<td class="label" align="center" width="50%">Enter Customer Id: </td>
                    	<td align="left" width="60%"><input type="text" name="cid" size="20" maxlength="9" value="${cid}"/></td><td style="color:red;">${error}</td>
                    </tr>
                    <tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>   
                    <tr>
        				<td class="label" align="right">&nbsp;</td>
        				<td align="left">
        					<input type="hidden" name="customerInformation" value="customerInformation"/>
            				<button type="button" class="btn btn-small btn-primary" onclick="validateCustomer();">Get Customer</button> 
            				<input id="submit" type="submit" name="submit" value="submit"/> 
            			</td>
            		</tr>
            		<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>  
                </table><br>        
            </div>
        </form>
        <div class="push"></div>
		</div>
		<br><br>
		<div class="footer" align="center"><h5>This is a copyright of Team1 (CMPE 273, Spring 2012)</h5></div> 
    </body>
</html>
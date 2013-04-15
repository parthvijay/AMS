<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<title>Airline Management System</title>
		<style type="text/css">
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
    <script language="JavaScript" type="text/JavaScript">

        window.onload = function()
        {
        	document.getElementById("submit").style.display = 'none';
        	
            if('${modifyCustomerInfo}' == "true")
            {
                document.getElementById("div2").style.display = 'none';
                window.open ('existingBookings.jsp','_self',false);
                var result = '<%=request.getAttribute("result")%>';
                var cid = '<%=request.getAttribute("cid")%>';
                window.open('toModifyCustInfo.jsp?result='+result+'&cid='+cid, 'success', 'width=800,height=350,status=yes,resizable=yes,scrollbars=yes');
            }
            if('${modifiedCustomer}' == "true")
            {
                document.getElementById("div2").style.display = 'none';
                window.open('displayModifiedCustomer.jsp?personValues='+'<%=request.getAttribute("personValues")%>', 'success', 'width=800,height=350,status=yes,resizable=yes,scrollbars=yes');
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
    	<table class="head" width="100%" border="2">
			<tr>
				<td colspan="2" style="background-color: blue;">
					<h1>Airline Management System</h1>
				</td>
			</tr>
		</table>
        <form method="post"  action="modifyCustomerInfo">
        	<br><br>
            <h2>Staff Home</h2>

            <div id="div2">
                <table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 6.5em  auto;">
                    <tr>
        				<td colspan="3" bgcolor="#0066FF">&nbsp;</td>
    				</tr>
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
    				<tr>
        				<td align="center" colspan="2"><span class="message">Modify Customer Information</span></td>
    				</tr>
                    <tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr class="label" align="right" width="20%"><td>Enter Customer Id: </td>
                    	<td align="left" width="60%"><input type="text" name="cid" size="20" maxlength="9" value="${cid}"/></td><td style="color:red;">${error}</td>
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
        					<input type="hidden" name="modifyCustomer" value="modifyCustomer"/>
            				<input type="button" value="Get Info To Modify Customer" onclick="validateCustomer();"/> 
            				<input id="submit" type="submit" name="submit" value="submit"/>
            			</td>
            		</tr>
            		<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr> 
    				
                </table>     
            </div>
        </form>
        <h5 align="center">This is a copyright of Team1 (CMPE 273, Spring 2012)</h5><br>
    </body>
</html>
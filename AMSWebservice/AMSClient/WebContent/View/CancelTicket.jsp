<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="Connection.*" %>

<html>
	<head>
	<link href="bootstrap.css" rel="stylesheet">
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
            document.getElementById("div1").style.display = 'none';
            document.getElementById("div2").style.display = 'block';
            document.getElementById("submitCR").style.display = 'none';
            
            if('${cancelTicket}' == "true")
            {
                document.getElementById("div1").style.display = 'block';
                var result = '<%=request.getAttribute("result")%>';
                var tid = '<%=request.getAttribute("tid")%>';
                var message = '<%=request.getAttribute("message")%>';
                window.open('DisplayTicket.jsp?result='+result+'&tid='+tid+'&message='+message, 'success', 'width=800,height=450,status=yes,resizable=yes,scrollbars=yes');
            }
            
            if('${userSession}' ==  "" || '${userSession}' ==  null)
                self.location = "login.jsp";
            
            if(('${tidError}' != "" && '${tidError}' != null) || ('${deptdateError}' != "" && '${deptdateError}' != null))
            {
                document.getElementById("div1").style.display = 'none';
                document.getElementById("div2").style.display = 'block';
            }
        }
        
        function pageDisplay(div)
        {
            document.getElementById("div1").style.display = 'none';
            document.getElementById("submitCR").style.display = 'none';
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
            var m = matches[2] - 1;
            var d = matches[1];
            var y = matches[3];
            var composedDate = new Date(y, m, d);
            return composedDate.getDate() == d &&
                    composedDate.getMonth() == m &&
                    composedDate.getFullYear() == y;
        }
        
        function ticketValidatePage()
        {
            var tid = document.getElementsByName("tid")[0].value;
            var journeyDt = document.getElementsByName("deptdate")[0].value;
            if(isEmpty(tid))alert("Please enter Ticket Number.");
            else if(tid.length != 9)alert("Please enter valid ticket number.");
            else if(isEmpty(journeyDt))alert("Please enter Departure Date.");
            else if(!isValidDate(journeyDt)) alert("Please enter valid departure date in format dd-mm-yyyy.");           
            else document.getElementById("submitCR").click();
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
		<br>
        <form method="post"  action="CancelTicket">
            <h2 class = "h">Existing Bookings</h2>
            
            <div id="div1">

                <a href="javascript:pageDisplay('DT')">Display Ticket</a> <br><br><br>
                <a href="generateAllCustomerList.jsp">Display Customers List</a> <br><br><br>
                <a href="CustInformationRelated.jsp">Display/Modify Customer Information</a> <br><br><br>
                <a href="CustReservationInfo.jsp">Modify Reservation</a> <br><br><br>
                <a href="CancelTicket.jsp">Cancel Reservation</a>

            </div>

            <div id="div2">
                
                <table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 6.5em  auto;">
                <tr>
        			<td colspan="3" bgcolor="#0066FF">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<td align="center" colspan="2"><span class="message">Cancel Reservation</span></td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
                <tr>
                	<td class="label" align="right" width="30%">Enter Ticket Id : </td>
                    <td align="left" width="60%"><input type="text" name="tid" size="20" maxlength="9" value="${tid}" /></td>
                    <td style="color:red;">${tidError}</td>
                </tr>      
                <tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>              
                <tr>
                	<td class="label" align="right" width="30%">Departure Date : </td>
                    <td align="left" width="60%"><input type="text" name="deptdate" size="10" maxlength="10"  value="${deptdate}"/></td>
                    <td style="color:red;">${deptdateError}</td>
                </tr>
                <tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
        			<td class="label" align="right">&nbsp;</td>
        			<td align="left">
        				<input type="hidden" name="cancelTicket" value="cancelTicket"/>
                		<button class="btn btn-small btn-primary" type="button" onclick="ticketValidatePage();">Cancel Booking</button> 
                		<input id="submitCR" type="submit" name="cancelResrvSubmit" value="submit"/>
        			</td>
        		<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
                </table>
            </div>            
        </form>
        <h5 align="center">This is a copyright of Team1 (CMPE 273, Spring 2012)</h5>
    </body>
</html>



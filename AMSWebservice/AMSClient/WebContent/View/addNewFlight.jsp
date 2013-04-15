<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Add New Flight</title>
		<link href="bootstrap.css" rel="stylesheet">
		
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
            var m = matches[2] - 1;
            var d = matches[1];
            var y = matches[3];
            var composedDate = new Date(y, m, d);
            return composedDate.getDate() == d &&
                    composedDate.getMonth() == m &&
                    composedDate.getFullYear() == y;
        }  
         
        function chkTime(timeStr) {
        	var timRegX = /^(\d{1,2}):(\d{2})?$/;

        	var timArr = timeStr.match(timRegX);
        	   if (timArr == null) {
        		   alert("Time is not in a valid format.");
        		   return false;
        	}

        	hour = timArr[1];
        	minute = timArr[2];

        	if (hour < 0 || hour > 23) {
        		   alert("Hour must be between 0 and 23.");
        		   return false;
        	}

        	if (minute < 0 || minute > 59) {
        		  alert ("Minute must be between 0 and 59.");
        		   return false;
        	}
       	   
        	   return true;
        	}
        
        function validatePage()
        {
            var airlineInfo = document.getElementsByName("airlineInfo")[0].value;
            var aircraft = document.getElementsByName("aircraft")[0].value;
            var capacity = document.getElementsByName("capacity")[0].value;
            var crewcount = document.getElementsByName("crewcount")[0].value;
            var deptdate = document.getElementsByName("deptdate")[0].value;
            var arrvdate = document.getElementsByName("arrvdate")[0].value;
            var deptime = document.getElementsByName("deptime")[0].value;
            var arrvtime = document.getElementsByName("arrvtime")[0].value;
            var source = document.getElementsByName("source")[0].value;
            var destination = document.getElementsByName("destination")[0].value;

            if(isEmpty(airlineInfo))alert("Please select Airline from drop down.");
            else if(isEmpty(aircraft))alert("Please enter AirCraft name.");
            else if(aircraft.length != 9) alert("Please enter valid aircraft of 9 letters.");
            else if(aircraft.substring(0,2) != 'AB' && aircraft.substring(0,2) != 'BO') alert("Please enter valid aircraft with start as AB or BO ");
            else if(aircraft.charAt(5) != '-') alert("Please enter valid aircraft in format ABxxx-xxx or BOxxx-xxx");
            
            else if(isEmpty(capacity))alert("Please enter AirCraft Capacity.");
            else if(capacity.length != 3 || capacity > 400 || capacity < 100) alert("Please enter valid aircraft capacity between 100 - 400.");
            
            else if(isEmpty(crewcount))alert("Please enter AirCraft crewcount.");
            else if(crewcount.length != 2 || crewcount < 10 || crewcount > 20) alert("Please enter valid crewcount no. between 10 - 20.");
            
            else if(isEmpty(deptdate))alert("Please enter departure date.");
            else if(!isValidDate(deptdate))alert("Please enter departure date in DD-MM-YYYY format.");
            else if(isEmpty(arrvdate))alert("Please enter arrival date.");
            else if(!isValidDate(arrvdate))alert("Please enter arrival date in DD-MM-YYYY format.");
            
            
            else if(isEmpty(deptime))alert("Please enter departure time.");
            else if(!chkTime(deptime))alert("Please enter valid departure time in HH:MM format");
            else if(isEmpty(arrvtime))alert("Please enter arrival time.");
            else if(!chkTime(arrvtime))alert("Please enter valid arrival time in HH:MM format");
            
            else if(isEmpty(source))alert("Please enter source.");
            else if(!isNaN(source))alert("Please enter valid source.");
            else if(isEmpty(destination))alert("Please enter destination.");
            else if(!isNaN(destination))alert("Please enter valid destination.");
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
	</table><br><br>
	
<%
 if(request.getAttribute("addStatus") != null){ 
 
 if(request.getAttribute("existenceStatus") != null){%>

      <p>
        <font size="3" face="verdana" color="red">
            Error creating new flight. Please contact System Administrator.
        </font>
      </p>
      
  <%} %> 
  
        <table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 4em  auto;">
        	
            <tr><td  align="center" style="color:red;"> <%=request.getAttribute("message") %> </td></tr>
                <tr></tr>
                <tr><td>AirLine Id          : ${airline.alid} </td></tr>
                <tr><td>AirLine Name        : ${airline.name} </td></tr>
                <tr><td>AirLine Aircraft    : ${airline.aircraft} </td></tr>
                <tr><td>AirLine Capacity    : ${airline.capacity} </td></tr>
                <tr><td>AirLine CrewCount   : ${airline.crewcount} </td></tr>
                <tr><td>Departure Date      : ${flight.deptdate} </td></tr>
                <tr><td>Arrival Date        : ${flight.arrvdate} </td></tr>
                <tr><td>Departure Time      : ${flight.depttime} </td></tr>
                <tr><td>Arrival Time        : ${flight.arrvtime} </td></tr>
                <tr><td>Source              : ${flight.source} </td></tr>
                <tr><td>Destination         : ${flight.destination} </td> </tr>
                <tr><td>Status              : ${flight.status} </td> </tr>
                <tr></tr>
        </table>
<%} else { %>

     <form method="post" action="addNewFlight">
          <table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 4em  auto;">
          	<tr>
        		<td colspan="2" bgcolor="#0066FF">&nbsp;</td>
    		</tr>
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
    		<tr>
        		<td align="center" colspan="2"><span class="message"><i>Add New Flight</i></span></td>
    		</tr>
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
    		<tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
          	<tr>
            	<td class="label" align="right" width="30%">AirLine Info. : </td>
                <td align="left" width="60%">
                    <select name="airlineInfo">
                        <option value="">-Select AirLine from drop down-</option>
                        <option value="AAALS - American Airlines">AAALS - American Airlines</option>
                        <option value="AKALS - Alaskan Airlines">AKALS - Alaskan Airlines</option>
                        <option value="DALS - Delta Airlines">DALS - Delta Airlines</option>
                        <option value="SWALS - South West Airlines">SWALS - South West Airlines</option>
                        <option value="UAALS - United Airlines">UAALS - United Airlines</option>
                    </select>
                </td>
            </tr>
            <tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
            <tr>
            	<td class="label" align="right" width="20%">Aircraft : </td>
                <td align="left" width="60%"><input type="text" placeholder="BOxxx-xxx" name="aircraft" size="20" maxlength="9" value="${airLines.aircraft}"/></td>
            </tr>
            <tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
            <tr>
                <td class="label" align="right" width="20%">Aircraft Capacity : </td>
                <td align="left" width="60%"><input type="text" placeholder="xxx" name="capacity" size="20" maxlength="3" value="${airLines.capacity}" /></td>
            </tr>
            <tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
            <tr>
            	<td class="label" align="right" width="20%">Aircraft CrewCount : </td>
                <td align="left" width="60%"><input type="text" placeholder="xx" name="crewcount" size="20" maxlength="2" value="${airLines.crewcount}"/></td>
            </tr>
            <tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
            <tr>
            	<td class="label" align="right" width="20%">Departure Date : </td>
                <td align="left" width="60%"><input type="text" placeholder="DD-MM-YYYY" name="deptdate" size="20" maxlength="10" value="${flight.deptdate}"/></td>
            </tr>
            <tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
            <tr>
            	<td class="label" align="right" width="20%">Arrival Date : </td>
                <td align="left" width="60%"><input type="text" placeholder="DD-MM-YYYY" name="arrvdate" size="20" maxlength="10" value="${flight.arrvdate}"/></td>
            </tr>
            <tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
            <tr>
            	<td class="label" align="right" width="20%">Departure Time : </td>
                <td align="left" width="60%"><input type="text" placeholder="HH:MM" name="deptime" size="20" maxlength="10" value="${flight.deptime}"/></td>
            </tr>
            <tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
            <tr>
            	<td class="label" align="right" width="20%">Arrival Time : </td>
                <td align="left" width="60%"><input type="text" placeholder="HH:MM" name="arrvtime" size="20" maxlength="10" value="${flight.arrvtime}"/></td>
            </tr>
            <tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
            <tr>
            	<td class="label" align="right" width="20%">Source : </td>
                <td align="left" width="60%"><input type="text" name="source" size="20" maxlength="20" value="${flight.source}"/></td>
            </tr>
            <tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
            <tr>
            	<td class="label" align="right" width="20%">Destination : </td>
                <td align="left" width="60%"><input type="text" name="destination" size="20" maxlength="20" value="${flight.destination}"/></td>
            </tr>
            <tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>
            <tr>
            	<td class="label" align="right" width="20%">Flight Status : </td>
                <td align="left" width="60%">
                	<select name="status">
                        <option value="Scheduled">Scheduled</option>
                        <option value="Cancelled">Cancelled</option>
                        <option value="Delayed">Delayed</option>
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
            		<button class="btn btn-small btn-primary" type="button"  onclick="validatePage();">Add Flight</button>   
            		<input type="hidden" value="Add Flight" value="Add Flight"/> 
            		<input id="submit" type="submit" name="submit" value="submit"/>
            	</td>
            </tr>
            <tr>
        		<td colspan="2" class="label">&nbsp;</td>
    		</tr>  
        </table>

            
        </form>
  
  <%} %>
  
  <h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5><br><br>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Connection.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Modify Flight</title>
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
			h2.head {
				color: #0066FF;
				text-align:center;
				font-style: italic;
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

		document.getElementById("search").style.display = 'none';
		document.getElementById("details").style.display = 'none';
		document.getElementById("modify").style.display='none'; 
		document.getElementById("error").style.display = 'none';
		document.getElementById("submit").style.display = 'none';
		
		if ('${userSession}' == "" || '${userSession}' == null)
			self.location = "login.jsp";
		
        if('<%=request.getAttribute("searchFlight")%>' ==  "true")
        {
            document.getElementById("details").style.display = 'block';
            document.getElementById("toSubmit").style.display = 'none';
        } else
        if('<%=request.getAttribute("searchFlight")%>' ==  "false")
        {
            document.getElementById("details").style.display = 'block';
            document.getElementById("search").style.display = 'block';
        } else
	        document.getElementById("search").style.display = 'block';

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
    
	function validatePage()
	{
		var alid = document.getElementsByName("alid")[0].value;
		var deptdate = document.getElementsByName("deptdate")[0].value;
		var source = document.getElementsByName("source")[0].value;
		var destination = document.getElementsByName("destination")[0].value;
		
		document.getElementById("pageval").value="search";
		
        if(isEmpty(alid))alert("Please select AirlineId from drop down.");
        else if(isEmpty(deptdate))alert("Please enter departure date.");
        else if(!isValidDate(deptdate))alert("Please enter departure date in DD-MM-YYYY format.");
        else if(isEmpty(source))alert("Please enter source.");
        else if(!isNaN(source))alert("Please enter valid source.");
        else if(isEmpty(destination))alert("Please enter destination.");
        else if(!isNaN(destination))alert("Please enter valid destination.");
        else if(source == destination)alert("Source and Destination cannot be same.");
        else document.getElementById("submit").click();
	}
		
	function isAlp(str){
		  for(var i=0; i<str.length; i++)
	      {
	        var char1 = str.charAt(i);
	        var cc = char1.charCodeAt(0);
	        if((cc>64 && cc<91) || (cc>96 && cc<123) || cc== 32)
	        {
	        	continue; 
	        }
	         else {
	        	  alert('Input is not alphabetic');
	         return false;
	         }
	      }
	     return true;   
	}
  
    
	function modify1(alid,aircraft,deptdate,arrvdate,depttime,arrvtime,source,destination,status)
	{
		document.getElementById("details").style.display='none';
		document.getElementById("modify").style.display='block';
		document.getElementById("halid").value = alid;
		document.getElementById("hdeptdate").value=deptdate;
		document.getElementById("haircraft").value=aircraft;
		document.getElementById("alid").value=alid;
		document.getElementById("deptdate").value=deptdate;
		document.getElementById("status").value=status;
		document.getElementById("arrvdate").value=arrvdate;
		document.getElementById("arrvtime").value=arrvtime;
		document.getElementById("depttime").value=depttime;
		document.getElementById("source").value=source;
		document.getElementById("destination").value=destination;
		document.getElementById("aircraft").value=aircraft;
	}
	
	function save1(val)
	{
		document.getElementById("pageval").value = val;
		var aircraft = document.getElementsByName("aircraft")[0].value;
		var deptdate = document.getElementById("deptdate").value;
        var arrvdate = document.getElementsByName("arrvDate")[0].value;
        var depttime = document.getElementsByName("depttime")[0].value;
        var arrvtime = document.getElementsByName("arrvtime")[0].value;
        var Source = document.getElementById("source").value;
        var Destination = document.getElementById("destination").value;
        if(isEmpty(aircraft))alert("Please enter AirCraft name.");
        else if(aircraft.length != 9) alert("Please enter valid aircraft of 9 letters.");
        else if(aircraft.substring(0,2) != 'AB' && aircraft.substring(0,2) != 'BO') alert("Please enter valid aircraft with start as AB or BO ");
        else if(aircraft.charAt(5) != '-') alert("Please enter valid aircraft in format ABxxx-xxx or BOxxx-xxx");
        else if(isEmpty(deptdate))alert("Please enter departure date.");
        else if(!isValidDate(deptdate))alert("Please enter departure date in DD-MM-YYYY format.");
        else if(isEmpty(arrvdate))alert("Please enter arrival date.");
        else if(!isValidDate(arrvdate))alert("Please enter arrival date in DD-MM-YYYY format.");
        else if(isEmpty(depttime))alert("Please enter departure time.");
        else if(!chkTime(depttime))alert("Please enter valid departure time in HH:MM format");
        else if(isEmpty(arrvtime))alert("Please enter arrival time.");
        else if(!chkTime(arrvtime))alert("Please enter valid arrival time in HH:MM format");
        else if((deptdate == arrvdate) && (depttime == arrvtime)) alert("Deptarture time and Arrival time cannot be same for same date");
        else if(isEmpty(Source))alert("Please enter source.");
        else if(!isAlp(Source))alert("Please enter valid source.");
        else if(isEmpty(Destination))alert("Please enter destination.");
        else if(!isAlp(Destination))alert("Please enter valid destination.");
        else if(Source == Destination)alert("Source and Destination cannot be same.");
        else
       	   document.getElementById("submit").click();
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
    
</script>


</head>
<body background = "background.jpeg">
	<table class="head" width="100%" border="2">
		<tr>
			<td colspan="2" style="background-color: blue;">
				<h1>Airline Management System</h1>
			</td>
		</tr>
	</table>	<br><br><br>

	<form name = "myform" method="post" action="modifyFlight">
		 
        <input id="pageval" type="hidden" name="pageval"/>
        <input type="hidden" name="searchF" value="flight">
        <input type="hidden" id="halid" name="halid"/>
        <input type="hidden" id="haircraft" name="haircraft"/>
        <input type="hidden" id="hdeptdate" name="hdeptdate" />
        
		<!-- ---------------------------------------------------------------------------------------------------- --> 
		<div id="search">
			<table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="450px" style="margin: 3em  auto;">
			  <tr>
        			<td colspan="2" bgcolor="#0066FF">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<th align="center" colspan="2"><span class="message"><i>Search Flight</i></span></th>
    			</tr>	
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
			  <tr>
			  	<td class="label" align="right" width="20%">Airline Id: </td> 
				<td align="left" width="60%">
				    <select name="alid" id="alid">
				        <option value="">Please select option</option>
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
					<td class="label" align="right" width="20%">Deptdate: </td>
					<td align="left" width="60%"><input type="text" maxlength="20" name="deptdate" value="${deptdate}"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Source: </td> 
					<td align="left" width="60%"><input type="text" maxlength="20" name="source" value="${source}"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Destination: </td>
					<td align="left" width="60%"><input type="text" maxlength="20" name="destination" value="${destination}"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right">&nbsp;</td>
					<td align="left"><input type="button" name="click" value="Search" onclick="validatePage()"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>				
			</table>
		</div>
		
		<!-- ---------------------------------------------------------------------------------------------------- -->
				
		<div id="error">
			<p>
			<h4 style="color: red;">${error}</h4>
			</p>
		</div>
		
		<!-- ---------------------------------------------------------------------------------------------------- -->
		
		<div id="details">
			<h2 class="head">Flight Details</h2><br>
			<p h4>
			 <h4 style="color: red;">${error}</h4>
			</p>
			<table id="flights" align="center" width="80%" border="1">
				<tr>
				<th>Select</th>
				<th>AirLine Id</th>
                <th>AirLine Aircraft</th>
	            <th>Departure Date</th>
                <th>Arrival Date</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
                <th>Source</th>
                <th>Destination</th>
                <th>Status</th>
				</tr>
				
			<%  Flight[] flights = null;
				if(request.getAttribute("searchFlight") != null){
					flights = (Flight[])request.getAttribute("objFlight");
					
					if(flights == null){%>
					<tr align="center"><h4 style="color: red;"> Sorry, No Flights found </h4></tr><br>
			<%
				} else{
					
					for (int i = 0; i < flights.length; i++) { %>
					<tr align="center" class="alt">
						<td><a href="javascript:openPage();"></a><input type="button" name="Edit" value="Edit"
                         onclick="modify1('<%=flights[i].getAlid()%>', '<%=flights[i].getAircraft()%>','<%=flights[i].getDeptdate()%>',
                         '<%=flights[i].getArrvdate()%>' ,'<%=flights[i].getDepttime()%>' ,'<%=flights[i].getArrvtime()%>','<%=flights[i].getSource()%>','<%=flights[i].getDestination()%>',
                         '<%=flights[i].getStatus()%>');"></td>
                         
						<td><%=flights[i].getAlid()%></td>
						<td><%=flights[i].getAircraft()%></td>
						<td><%=flights[i].getDeptdate()%></td>
						<td><%=flights[i].getArrvdate()%></td>
						<td><%=flights[i].getDepttime()%></td>
						<td><%=flights[i].getArrvtime()%></td>
						<td><%=flights[i].getSource()%></td>
						<td><%=flights[i].getDestination()%></td>
						<td><%=flights[i].getStatus()%></td>
					</tr>
					
					<input type="hidden" id="Alid" name="alid" value="<%=flights[i].getAlid()%>"/>
	
				<%
					}
				}
			%>
               </table>
               
			<%
				}
			%>
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
        			<td align="center" colspan="2"><span class="message">Modify Flight</span></td>
    			</tr>
    			<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Aircraft:</td>
					<td align="left" width="60%"><input type ="text" id="aircraft" name="aircraft" size="9" maxlength="9"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Departure Date:</td>
					<td align="left" width="60%"><input type ="text" id="deptdate" name="deptDate" size="10" maxlength="10"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Arrival Date:</td>
					<td align="left" width="60%"><input type ="text" id="arrvdate" name="arrvDate" size="10" maxlength="10"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Departure Time:</td>
					<td align="left" width="60%"><input type ="text" id="depttime" name="depttime" size="5" maxlength="5"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Arrival Time:</td>
					<td align="left" width="60%"><input type ="text" id="arrvtime" name="arrvtime" size="5" maxlength="5"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Source:</td>
					<td align="left" width="60%"><input type ="text" id="source" name="Source" maxlength="20" size="20" maxlength="20"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Destination:</td>
					<td align="left" width="60%"><input type ="text" id="destination" name="Destination" size="20" maxlength="20"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
				<tr>
					<td class="label" align="right" width="20%">Status:</td>
				    <td align="left" width="60%">
				         <select name="status" id="status">
	                        <option value="">Please select option</option>
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
					<td class="label" align="right">&nbsp;</td>
					<td><input type ="button" id="save" value="Save" onclick="save1('save');"></td>
				</tr>
				<tr>
        			<td colspan="2" class="label">&nbsp;</td>
    			</tr>
			</table>
		
		</div>
		
		 <input id="submit" type="submit" name="submit" value="Submit">
	</form>

    <input id="back" type="button" name="Back" value="Back" onClick="javascript:history.go(-1)"/>
      
</body>
</html>

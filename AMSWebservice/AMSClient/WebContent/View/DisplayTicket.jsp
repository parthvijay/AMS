<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Servlets.*, java.util.*,Connection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>TICKET INFORMATION</title>
			<style type="text/css">
				h1 {
					color: white;
					text-align:center;
					font-style: italic;
					text-shadow: 1px 1px 1px #000;
					}
				h2.h {
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
				#ticket{
					font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;	
					border-collapse:collapse;
					}
				#ticket th {	
					text-align:left;
					border:1px solid #2E2EFE;
					padding:3px 7px 2px 7px;
					}
		
				#ticket caption.new {
					font-size:1.3em;
					text-align:center;
					padding-top:5px;
					padding-bottom:4px;
					background-color:#2E2EFE;
					color:#ffffff;
					}	
				
				#ticket tr.alt th {
					color:#000000;
					background-color:#A9A9F5;
					}
			</style>
	</head>

    <script language="JavaScript" type="text/JavaScript">
    
        window.onload = function()
        {
        	document.getElementById("col1").style.display = 'none';
            document.getElementById("div1").style.display = 'none';
            document.getElementById("div2").style.display = 'none';
            
            if('${userSession}' ==  "" || '${userSession}' ==  null)
                self.location = "login.jsp";
           
            if(<%=request.getParameter("modifyTic")%> !=  null)
            {
                document.getElementById("col1").style.display = 'block';
                document.getElementById("toSubmit").style.display = 'none';
            } 
            else if(<%=request.getParameter("flightToModify")%> !=  null)
            {
                document.getElementById("col1").style.display = 'none';
                document.getElementById("submit").style.display = 'none';
                document.getElementById("toSubmit").style.display = 'block';
                document.getElementById("submitFlightModify").style.display = 'block';
                document.getElementById("submitToModify").style.display = 'none';
                document.getElementById("div1").style.display = 'block';
                document.getElementById("div2").style.display = 'block';
            }
        }
        
        function confirmToSubmit()
        {
	        var agree = confirm("Are you sure you want to modify RESERVATION?");
	        if (agree)
	        {
	        	document.getElementById("submit").click();
	        }
        }
        
        function pageDisplay(div)
        {
            if(div == "MTD")
            {
                document.getElementById("div1").style.display = 'block';
                document.getElementById("div2").style.display = 'block';
            }
        }
        
    </script>

<body background = "background.jpeg">
	<table class="head" width="100%" border="2">
		<tr>
			<td colspan="2" style="background-color: blue;">
				<h1>Airline Management System</h1>
			</td>
		</tr>
	</table><br><br><br>
<%
String[] vals = null;
if(request.getParameter("result") != null)
	vals = ((String)request.getParameter("result")).split("\\$");

%>
	
	<table id="ticket" align="center" width="80%" border="0">
		<%
		if(request.getParameter("message") != null)
		{ 
		  if(request.getParameter("message").charAt(0) == 'S' || request.getParameter("message").charAt(0) == 'T') {%>
		        <tr align="center">
		        <p>
		        <font size="3" face="verdana" color="red">
		          <%=request.getParameter("message") %>
		        </font>
		        </p>
		        </tr>
		<% } } %>
		
 		<caption class="new"><i>CUSTOMER MODIFIED INFORMATION</i></caption>
 		
		<caption class="second"><b>Airlines: </b><i>United AirLines</i></caption>
		<tr class="alt">
			<td> Flight Type: <%=vals[3] %> </th><th> Flight Status : <%= vals[12] %> </th>
		</tr>
		<tr>
			<th> Departure Port: <%=vals[10] %></th><th> Arrival Port : <%= vals[11] %></th>
		</tr>
		<tr class="alt">
			<th> Customer FirstName: <%=vals[5] %></th><th> Customer LastName : <%= vals[6] %></th>
		</tr>
		<tr>
			<th>Departure Date: <%=vals[2] %></th><th> Arrival Date : <%=vals[8] %></th>
		</tr>
		<tr class="alt">
			<th>Departure Time: <%=vals[7] %></th><th> Arrival Time : <%=vals[9] %></th>
		</tr>
		<tr>
			<th>Customer Id: <%=vals[0] %></th><th> Ticket Status : <%=vals[4] %></th>
		</tr>
	</table> 
		<br>
		<br>
		<br>
		<p id="col1"><b>To Modify Reservation --></b><a style="color:blue;text-decoration:none;" href="javascript:pageDisplay('MTD')"> Click Here</a></p>
		<br>

<% if(request.getParameter("ticketOperation") != null) { %>    

            <form method="post" action="DisplayTicket">

               <table align="center">
		       <tr>
		       		<td>Ticket Status : 
                 		<select name="statusTochange">
				  			<option value="Ticket Blocked">Ticket Blocked</option>
				  			<option value="Cancelled">Cancelled</option>
				 		</select>
		       		</td>
		       </tr>
		       <tr></tr>
		       <tr></tr>
		       <tr></tr>
		       <tr></tr>
            	<tr>
            		<td>
            			<input id="cancelTicket" type="submit" name="submit" value="Change Ticket Status"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            		</td>
            	</tr>
				<tr>
					<td>
						<input type="hidden" name="cancelProcess" value="cancelProcess"/>
                		<input type="hidden" name="tid" value='<%=request.getParameter("tid")%>'/>
                		<input type="hidden" name="deptdate" value='<%=request.getParameter("deptdate")%>'/>
                	</td>
                </tr>		
            </table>
                <br><br>
           </form>
   
<%} else { %>    

        <div id="div1">
         
	        <form method="post" action="DisplayTicket">
	            <h2 class="h">Flight List</h2>
	
	            <input id="submit" type="submit" name="submit" value="Get Flights"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <input type="hidden" name="getToModifyTicketInfo" value="FL"/>
	            <input type="hidden" name="result" value='<%=request.getParameter("result")%>'/>
	            <input type="hidden" name="tid" value='<%=request.getParameter("tid")%>'/>
	            <input type="hidden" name="deptdate" value='<%=request.getParameter("deptdate")%>'/>
	            <br><br>
	            
	            <div id="div2">
		            <table align="center" width="90%" border="2">
						<tr>
							<th>Select</th>
							<th>Aircraft</th>
							<th>Departure Date</th>
							<th>Arrival Date</th>
							<th>Departure Time</th>
							<th>Arrival Time</th>
							<th>Source</th>
							<th>Destination</th>
							<th>Status</th>
						</tr>
						<tr></tr>
			<%
			String[] flightVals = null; 
			
			if(request.getParameter("flights") != null )
			{
			    String flights = request.getParameter("flights");
			    flightVals = flights.split("\\|");
			 
			    if(flights.length() !=0 ){
			    	
				    for(int j=0;j<flightVals.length;j++){
				        String[] flgt = flightVals[j].split("\\$");
				        %>
				        <tr>
				        <%if(flightVals[j].substring(flightVals[j].lastIndexOf('$') +1).equals("Cancelled")){%>
				        	<td align="center"><input align="middle" type="radio" name="rowRadio" value=<%=flightVals[j] %> disabled/></td>
				        <%}else{ %>
				            <td align="center"><input align="middle" type="radio" name="rowRadio" value=<%=flightVals[j] %> /></td>
				        <%}
				        for(int i=0; i< flgt.length;i++){%>    
						<td><%=flgt[i] %></td>
				        <%} %>		
			        </tr>
			        <%}
				}else {%>
				    <tr align="center">
					<p>
					<font size="3" face="verdana" color="red">
					  Sorry, No flights between this source and destination
					</font>
					</p>
			
			        </tr>
				<%}
				} %>		
		      </table>
							
				<div id="toSubmit">
					
					<input align="right" id="submitFlightModify" type="button" name="Make Modification" value="Make Modification" onclick="confirmToSubmit();"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
					<input id="submitToModify" type="submit" name="submitToModify" value="submit"/>
				
				</div>    		
				         </div>
	            
	       </form>
	        
	     </div> 
<%} %>	        
        <h5 align="center"><i>This is a copyright of Team1 (CMPE 273, Spring 2012)</i></h5>
</body>

</html>
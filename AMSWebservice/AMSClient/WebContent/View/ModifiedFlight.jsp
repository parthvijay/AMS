<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="Connection.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Modified Flight</title>
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
<body background = "background.jpeg">
	<table class="head" width="100%" border="2">
		<tr>
			<td colspan="2" style="background-color: blue;">
				<h1>Airline Management System</h1>
			</td>
		</tr>
	</table>	<br><br><br>

        <div id="modifiedFlight">
            <p>
             	<h4 style="color: red;">${error}</h4>
            </p>
            
            <% Flight f = (Flight)request.getAttribute("Modifiedflight");
            if(f != null){%>
                <table class="tableBorder" align="center" cellpadding="2px" cellspacing="1px" bgcolor="#F4F5F7" width="500px" style="margin: 3em  auto;">   
                    <tr>
        				<td colspan="2" bgcolor="#0066FF">&nbsp;</td>
    				</tr>
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
    				<tr>
        				<th align="center" colspan="2"><span class="message"><i>Modified Flight</i></span></th>
    				</tr>	
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
    				<tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr>
                    	<td class="label" align="center" width="20%"> Airline Id    :  </td>
                    	<td align="center" width="60%"><%=f.getAlid() %></td>
                    </tr>
                    <tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr>
                    	<td class="label" align="center" width="20%"> Aircraft      :  </td>
                    	<td align="center" width="60%"><%=f.getAircraft() %></td>
                    </tr>
                    <tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr>
                    	<td class="label" align="center" width="20%"> Deptdate      :  </td>
                    	<td align="center" width="60%"><%=f.getDeptdate() %></td>
                    </tr>
                    <tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr>
                    	<td class="label" align="center" width="20%"> DeptTime      :  </td>
                    	<td align="center" width="60%"><%=f.getDepttime() %></td>
                    </tr>
                    <tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr>
                    	<td class="label" align="center" width="20%"> ArrvDate      :  </td>
                    	<td align="center" width="60%"><%=f.getArrvdate() %></td>
                    </tr>
                    <tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr>
                    	<td class="label" align="center" width="20%"> ArrvTime      :  </td>
                    	<td align="center" width="60%"><%=f.getArrvtime() %></td>
                    </tr>
                    <tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr>
                    	<td class="label" align="center" width="20%"> Source        :  </td>
                    	<td align="center" width="60%"><%=f.getSource() %></td>
                    </tr>
                    <tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr>
                    	<td class="label" align="center" width="20%"> Destination   :  </td>
                    	<td align="center" width="60%"><%=f.getDestination() %></td>
                    </tr>
                    <tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                    <tr>
                    	<td class="label" align="center" width="20%"> Status        :  </td>
                    	<td align="center" width="60%"><%=f.getStatus() %></td>
                    </tr>
                    <tr>
        				<td colspan="2" class="label">&nbsp;</td>
    				</tr>
                </table>
            <%} %>
            
            <br> <a href="adminHome.jsp">Admin Home Page</a> <br><br><br>
            
       </div>
</body>
</html>
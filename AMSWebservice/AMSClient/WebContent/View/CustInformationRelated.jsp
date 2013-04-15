<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
   <head>
   
    	<style type="text/css">
			h1 {
					color: white;
					text-align:center;
					font-style: italic;
					text-shadow: 1px 1px 1px #000;
				}
			h2.h
				{
					color: #0066FF;
					text-align:center;
					text-shadow: 1px 1px 1px #000;
				}
			h2
				{
					text-align:center;
					font-style: italic;
					text-shadow: 1px 1px 1px #000;
				}
			h5
				{
					font-style: italic;
					text-shadow: 1px 1px 1px #000;
				}
			ul.a
				{
					
					list-style-image: url('images.jpg');
				}
			.wrapper
			    {
					min-height: 100%;
					height: auto !important;
					height: 100%;	
					margin: 0 auto -4em;
				}
			.footer, .push 
				{
					height: 4em;
				}
		</style>
	</head>	
	<script language="JavaScript" type="text/JavaScript">

        window.onload = function()
        {
            document.getElementById("div1").style.display = 'block';
            document.getElementById("col").style.display = 'block';
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
            <h2>Staff Page</h2>

            <div id="div1">
                <h2 class = "h">Customer Information </h2>
				<ul class="a">
					<li><a href="customerInformation.jsp">Get Customer</a></li> <br><br><br>
					<li><a href="modifyCustomerInfo.jsp">Modify Customer</a></li> <br><br><br>
					<li><a href="existingBookings.jsp">Staff Home Page</a></li>
				</ul>	
            </div>
			<div class="push"></div>
			</div>
		<br><br><br>
		<div class="footer" align="center"><h5>This is a copyright of Team1 (CMPE 273, Spring 2012)</h5></div> 
    </body>
</html>
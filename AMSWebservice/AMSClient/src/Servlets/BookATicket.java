package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Connection.*;

/**
 * Servlet implementation class BooKATicket
 */

public class BookATicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ServiceProxy proxy=new ServiceProxy(); 

	public BookATicket() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String result = "";
		RequestDispatcher view;
		proxy.setEndpoint("http://localhost:8080/AMS/services/Service");
		 try
		 {
			 HttpSession session = request.getSession(false);
			 
			 if(request.getParameter("flightlist") != null)	 
			 {
				 String[] dt = request.getParameter("date").split("-");
				 String newdate = "";
				 if(dt.length > 1)
					 newdate = dt[2].concat("-").concat(dt[1]).concat("-").concat(dt[0]);
				 Flight[] flights = proxy.getFlights((String)session.getAttribute("staffalid"), newdate, request.getParameter("source"), request.getParameter("destination"));

				 request.setAttribute("date", request.getParameter("date"));
				 request.setAttribute("source", request.getParameter("source"));
				 request.setAttribute("destination", request.getParameter("destination"));
				 request.setAttribute("flights", flights);
				 if(flights != null)
				 {
					 if(flights.length > 0)
						 request.setAttribute("showflights", "true");
				 }
				 else
					 request.setAttribute("showflights", "false");
				 view = request.getRequestDispatcher("flightList.jsp");
				 view.forward(request, response);
			 }
			 else if(request.getParameter("air_craft") != null)
			 {
				 Customer customer = new Customer();
				 customer.setAlid(request.getParameter("alid"));
				 customer.setNationality(request.getParameter("nationality"));
				 customer.setPassport(request.getParameter("passport"));
				 customer.setCid(request.getParameter("cid"));
				 customer.setStatus(request.getParameter("status"));
				 customer.setAircraft(request.getParameter("air_craft"));
				 customer.setDate(request.getParameter("date"));
				 String digits = "123456789";
				 String ticket = (request.getParameter("alid")).substring(0, 2).concat(">");
				 
				 for(int i=0;i<7;i++)
				 {
					 ticket = ticket.concat(String.valueOf(digits.charAt(new Random().nextInt(9))));
				 }
				 String tempticket = ticket.substring(0, 2).concat(ticket.substring(3, ticket.length()));
				 customer.setTicketnum(ticket);
				 result = proxy.createCustomer(customer);
				 if(result.equals("true"))
				 {
					 request.setAttribute("ticbook", "true");
					 customer.setTicketnum(tempticket);
					 session.setAttribute("customer_ticket", customer);
					 if(((String)session.getAttribute("staffalid")).equals("%"))
					 	view = request.getRequestDispatcher("customerHome.jsp");
					 else
						 view = request.getRequestDispatcher("staffhome.jsp");
					 view.forward(request, response);
				 }
				 else
					 out.println("------------> Error...." + request.getParameter("cid"));
			 }
			 else
			 {
				 Customer customer;
				 if((customer = proxy.getCustomer(request.getParameter("cid"))) != null)
				 {
					 session.setAttribute("customer", customer);
					 view = request.getRequestDispatcher("bookATicket.jsp");
				 }
				 else
				 {
					 request.setAttribute("error", "Customer not in the System.");
					 request.setAttribute("cid", request.getParameter("cid"));
					 view = request.getRequestDispatcher("staffhome.jsp");
				 }
				 view.forward(request, response);
			 }
			  
			 				 
	
		 }
		 catch (Exception e)
	        {
			 out.println("------------> " + e);
	        }
		
	}


}

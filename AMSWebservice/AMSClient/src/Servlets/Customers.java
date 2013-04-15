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
 * Servlet implementation class Customers
 */

public class Customers extends HttpServlet {
private static final long serialVersionUID = 1L;
    
	ServiceProxy proxy=new ServiceProxy(); 

	public Customers() {
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
			 Customer customer = (Customer)session.getAttribute("customer");
			 Person person = (Person)session.getAttribute("person");
			 if(customer == null)
				 customer = new Customer();
			 if(person == null)
				 person = new Person();
			 
			 if(request.getParameter("pageVal") != null)
			 {
				 if(request.getParameter("pageVal").equals("BF"))
				 {
					 if((customer = proxy.getCustomer(customer.getCid())) != null)
					 {
						 synchronized(session){
							 session.setAttribute("customer", customer);
						 }
						 view = request.getRequestDispatcher("bookATicket.jsp");
						 view.forward(request, response);
					 }
				 }
				 else if(request.getParameter("pageVal").equals("VF"))
				 {
					 Customer[] customers = new Customer[]{};
					 customers = proxy.getBookingsOfACustomer(customer.getCid());
					 synchronized(session){
						 session.setAttribute("customers", customers);
					 }
					 request.setAttribute("divn", "VF");
					 view = request.getRequestDispatcher("customerHome.jsp");
					 view.forward(request, response);
				 }
				 else if(request.getParameter("pageVal").equals("GF"))
				 {
					 Flight flight = new Flight();
					 flight = proxy.getCustomerFlight(request.getParameter("alid"), request.getParameter("date"), request.getParameter("aircraft"));
					 request.setAttribute("flight", flight);
					 request.setAttribute("divn", "GF");
					 view = request.getRequestDispatcher("viewFlights.jsp");
					 view.forward(request, response);
				 }
				 else if(request.getParameter("pageVal").equals("CP"))
				 {
					 if(!proxy.changePassword(request.getParameter("newpassword"), customer.getCid()))
					 {
						 request.setAttribute("error", "true");
						 request.setAttribute("divn", "CP");
						 request.setAttribute("message", "Please change your password.");
					 }
					 else
					 {
						 request.setAttribute("message", "Password changed.");
					 }
					 view = request.getRequestDispatcher("customerHome.jsp");
					 view.forward(request, response);
				 }
				 else if(request.getParameter("pageVal").equals("VP"))
				 {
					 customer = proxy.getCustomer(customer.getCid());
					 person = proxy.getPerson(customer.getCid());
					 synchronized(session){
						 session.setAttribute("person", person);
						 session.setAttribute("customer", customer);
					 }
					 request.setAttribute("divn", "VP");
					 view = request.getRequestDispatcher("customerHome.jsp");
					 view.forward(request, response);
				 }
				 else if(request.getParameter("pageVal").equals("save"))
				 {
					 person.setFirstname(request.getParameter("firstname"));
					 person.setLastname(request.getParameter("lastname"));
					 person.setAddress(request.getParameter("address"));
					 person.setCity(request.getParameter("city"));
					 person.setState(request.getParameter("state"));
					 person.setZip(request.getParameter("zip"));
					 person.setEmail(request.getParameter("email"));
					 person.setPhone(request.getParameter("phone"));
					 customer.setPassport(request.getParameter("passport"));
					 customer.setNationality(request.getParameter("nationality"));
					 proxy.updatePerson(person);
					 proxy.updateCustomer(customer);
					 synchronized(session){
						 session.setAttribute("customer", customer);
						 session.setAttribute("person", person);
					 }
					 view = request.getRequestDispatcher("viewProfile.jsp");
					 view.forward(request, response);
				 }
				 
			 }
			 else 
			 {
				 result = proxy.login(request.getParameter("username"), request.getParameter("password"));
				 if(result != null)
				 {
					synchronized(session)
					{
						session.setAttribute("customer", customer);
						session.setAttribute("person", person);
						session.setAttribute("userSession", session);
					    session.setAttribute("currentuser", result.split(">")[0]);
					    customer.setCid(result.split(">")[1]);
					    session.setAttribute("customer", customer);
					    session.setAttribute("staffalid", "%");
					}
					 view = request.getRequestDispatcher("customerHome.jsp");
				 }
				 else
				 {
					 request.setAttribute("error", "true");
					 view = request.getRequestDispatcher("customerLogin.jsp");
				 }
				 view.forward(request, response);
			 }
			 
	
		 }
		 catch (Exception e){out.println("------------> " + e);}
		
	}

}

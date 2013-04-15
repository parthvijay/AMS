package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Connection.*;
/**
 * Servlet implementation class Staffhome
 */

public class NewCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	ServiceProxy proxy=new ServiceProxy(); 

	public NewCustomer() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String result = "";
		proxy.setEndpoint("http://localhost:8080/AMS/services/Service");
		 try
		 {
			 String[] dt = request.getParameter("dob").split("-");
			 Person person = new Person();
			 String firstname = request.getParameter("firstname");
			 person.setFirstname(firstname);
			 String lastname = request.getParameter("lastname");
			 person.setLastname(lastname);
			 person.setAddress(request.getParameter("address"));
			 person.setCity(request.getParameter("city"));
			 person.setDob(dt[2].concat("-").concat(dt[1].concat("-").concat(dt[0])));
			 person.setState(request.getParameter("state"));
			 person.setZip(request.getParameter("zip"));
			 String customerEmail = request.getParameter("email");
			 person.setEmail(customerEmail);
			 person.setPhone(request.getParameter("phone"));
			 
			 ///Edited by Sagar///
			 String ssn = request.getParameter("ssn");
			 String[] vals = ssn.split("-");
			 ssn = vals[0] + vals[1] + vals[2];
			 person.setSsn(ssn);
			/// Ended by Sagar ///
			 result = proxy.createPerson(person);
			 RequestDispatcher view;
			 if(result != null)
			 {
				 HttpSession session = request.getSession(false);
				 Customer customer = (Customer)session.getAttribute("customer");
				 customer = new Customer();
				 customer.setCid(result);
				 synchronized(session){
					 session.setAttribute("customer", customer);
				 }
				 view = request.getRequestDispatcher("bookATicket.jsp");
			 }
			 else
			 {
				 person.setDob(request.getParameter("dob"));
				 request.setAttribute("person", person);
				 request.setAttribute("error", "true");
				 view = request.getRequestDispatcher("newCustomer.jsp");
			 }
			 
			 
			 view.forward(request, response);
			 
	
		 }
		 catch (Exception e)
	        {
			 out.println("------------> " + e);
	        }
		
	}

}

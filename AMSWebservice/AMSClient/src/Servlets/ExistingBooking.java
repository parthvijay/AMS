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

import Connection.Customer;
import Connection.Flight;
import Connection.Person;
import Connection.ServiceProxy;

/**
 * Servlet implementation class ExistingBooking
 */
@WebServlet("/ExistingBooking")
public class ExistingBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ServiceProxy proxy=new ServiceProxy(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExistingBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher view;
		String result = null;
		proxy.setEndpoint("http://localhost:8080/AMS/services/Service");
		 try
		 {
			 if(request.getParameter("ViewTicket") != null)
			 {
				 if((result = proxy.viewTicket(request.getParameter("tid"), request.getParameter("deptdate"))) != null)
				 {
					 request.setAttribute("result", result);
					 request.setAttribute("showTicket", true);
					 request.setAttribute("tid", request.getParameter("tid"));
					 view = request.getRequestDispatcher("existingBookings.jsp");
				 }
				 else
				 {
					 request.setAttribute("deptdateError", "Journey Date not in the System.");
					 request.setAttribute("tidError", "Ticket not in the System.");
					 view = request.getRequestDispatcher("existingBookings.jsp");
				 }
				 view.forward(request, response);
			 } else
			 if(request.getParameter("displayCusList") != null)
			 {
				 if((result = proxy.getAllCustomers(request.getParameter("airlId"),request.getParameter("jnryDate"))) != null)
				 {
					 result+=("$"+request.getParameter("airlId")+"$"+request.getParameter("jnryDate"));
					 request.setAttribute("result", result);
					 request.setAttribute("showCusList", true);
					 view = request.getRequestDispatcher("generateAllCustomerList.jsp");
				 }
				 else
				 {
					 request.setAttribute("airlIdError", "AirLineId not in the System.");
					 request.setAttribute("jnryDtError", "Journey Date not in the System.");
					 view = request.getRequestDispatcher("generateAllCustomerList.jsp");
				 }
				 view.forward(request, response);
			 } else
			 if(request.getParameter("customerInformation") != null)
			 {
				 if((result = proxy.getCompleterCustomerDetails(request.getParameter("cid"))) != null)
				 {
					 request.setAttribute("result", result);
					 request.setAttribute("showCustomer", true);
					 view = request.getRequestDispatcher("customerInformation.jsp");
				 }
				 else
				 {
					 request.setAttribute("error", "customer Id not in the System.");
					 view = request.getRequestDispatcher("customerInformation.jsp");
				 }
				 view.forward(request, response);
			 } else
			 if(request.getParameter("modifyCustomer") != null)
			 {
				 if((result = proxy.getCustomerById(request.getParameter("cid"))) != null)
				 {
					 request.setAttribute("result", result);
					 request.setAttribute("cid", request.getParameter("cid"));
					 request.setAttribute("modifyCustomerInfo", true);
					 view = request.getRequestDispatcher("modifyCustomerInfo.jsp");
				 }
				 else
				 {
					 request.setAttribute("error", "customer Id not in the System.");
					 view = request.getRequestDispatcher("modifyCustomerInfo.jsp");
				 }
				 view.forward(request, response);
			 } else
			 if(request.getParameter("modifyingCustomer") != null)
			 {
				 Person person = new Person();
				 if((person = proxy.getPersonCustomer(request.getParameter("cid"))) != null)
				 {			
					 person.setPid(request.getParameter("cid"));
					 person.setAddress(request.getParameter("address"));
					 person.setCity(request.getParameter("city"));
					 person.setPhone(request.getParameter("phone"));
					 person.setEmail(request.getParameter("email"));
					 person.setState(request.getParameter("state"));
					 person.setZip(request.getParameter("zip"));
					 String personValues = "";
					 if(proxy.updatePersonDetails(person))
					 {
						 personValues = ""+ (person.getPid()+"$"+person.getFirstname() +"$"+ person.getLastname()
								 +"$"+person.getAddress()+"$"+person.getDob()+"$"+person.getCity()+"$"+person.getState()
								 +"$"+person.getZip()+"$"+person.getPhone()+"$"+person.getEmail());
						 request.setAttribute("personValues", personValues);
					 	 request.setAttribute("modifiedCustomer", true);
					 }
					 view = request.getRequestDispatcher("modifyCustomerInfo.jsp");
				 }
				 else
				 {
					 request.setAttribute("error", "customer Id not in the System.");
					 view = request.getRequestDispatcher("modifyCustomerInfo.jsp");
				 }
				 view.forward(request, response);
			 } else
			 if(request.getParameter("customerReservation") != null)
			 {
				 if((result = proxy.viewTicket(request.getParameter("tid"),request.getParameter("deptdate"))) != null)
				 {
					 request.setAttribute("result", result);
					 request.setAttribute("tid", request.getParameter("tid"));
					 request.setAttribute("deptdate", request.getParameter("deptdate"));
					 request.setAttribute("modifiyTicketDetails", "true");
					 view = request.getRequestDispatcher("existingBookings.jsp");
				 }
				 else
				 {
					 request.setAttribute("tidError", "Ticket not in the System.");
					 request.setAttribute("deptdateError", "Journey Date not in the System.");
					 view = request.getRequestDispatcher("CustReservationInfo.jsp");
				 }
				 view.forward(request, response);
			 } else
			 if(request.getParameter("ModifyReservation") != null){
				 result = proxy.modifyReservation(request.getParameter("tid"),request.getParameter("rowRadio"), request.getParameter("deptdate"));
				 request.setAttribute("result", result);
				 request.setAttribute("showTicket", true);
				 request.setAttribute("message", "Ticket Has been Modified Successfully");
				 view = request.getRequestDispatcher("existingBookings.jsp");
				 view.forward(request, response);
			 } else
			 if(request.getParameter("getToModifyTicketInfo") != null)
			 {
				 String flights = proxy.getActiveReservation(request.getParameter("tid"),request.getParameter("deptdate"));
				 request.setAttribute("result", request.getParameter("result"));
				 request.setAttribute("tid", request.getParameter("tid"));
				 request.setAttribute("deptdate", request.getParameter("deptdate"));
				 request.setAttribute("flights", flights);
				 
				 if(flights != null || (!flights.equals("")))
						 request.setAttribute("showflights", "true");
				 
				 view = request.getRequestDispatcher("existingBookings.jsp");
				 view.forward(request, response);
			 }
			 if(request.getParameter("cancelTicket") != null)
			 {
				 if((result = proxy.viewTicket(request.getParameter("tid"), request.getParameter("deptdate"))) != null)
				 {
					 request.setAttribute("result", result);
					 request.setAttribute("tid", request.getParameter("tid"));
					 request.setAttribute("deptdate", request.getParameter("deptdate"));
					 request.setAttribute("showTicketToCancel", true);
					 view = request.getRequestDispatcher("existingBookings.jsp");
				 }
				 else
				 {
					 request.setAttribute("tidError", "Ticket not in the System.");
					 request.setAttribute("deptdateError", "Journey Date not in the System.");
					 view = request.getRequestDispatcher("CancelTicket.jsp");
				 }
				 view.forward(request, response);
			 }
			 if(request.getParameter("cancelProcess") != null)
			 {
				 result = proxy.cancelReservation(request.getParameter("tid"),request.getParameter("statusTochange"),request.getParameter("deptdate"));
				 if(result != null) {
					 request.setAttribute("result", result);
					 request.setAttribute("tid", request.getParameter("tid"));
					 request.setAttribute("showTicket", true);
					 request.setAttribute("message", "Status of Ticket is Changed");
					 view = request.getRequestDispatcher("existingBookings.jsp");
					 view.forward(request, response);
				 }
			 }
		 }
		 catch (Exception e)
         {
			 out.println("------------> " + e);
         }
		
	}


}

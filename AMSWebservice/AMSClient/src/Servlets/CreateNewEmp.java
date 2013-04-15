package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Connection.Customer;
import Connection.Person;
import Connection.ServiceProxy;
import Connection.Staff;

/**
 * Servlet implementation class CreateNewEmp
 */
@WebServlet("/CreateNewEmp")
public class CreateNewEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceProxy proxy=new ServiceProxy(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateNewEmp() {
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
			 person.setDob(dt[2].concat("-").concat(dt[0].concat("-").concat(dt[1])));
			 person.setState(request.getParameter("state"));
			 person.setZip(request.getParameter("zip"));
			 String customerEmail = request.getParameter("email");
			 person.setEmail(customerEmail);
			 person.setPhone(request.getParameter("phone"));
			 person.setSsn(request.getParameter("ssn"));
			 result = proxy.createPerson(person);
			 RequestDispatcher view;
			 if(result != null)
			 {
			     String status = "Active";
				 Staff staff = new Staff();
				 staff.setSid(result);
				 String alid=request.getParameter("alid");
				 staff.setAlid(alid);
				 String position = request.getParameter("position");
				 staff.setPosition(position);
				 String[] hdt = request.getParameter("hiredate").split("-");
				 staff.setHiredate(hdt[2].concat("-").concat(hdt[0].concat("-").concat(hdt[1])));

				 staff.setStatus(status);
				 result= proxy.createStaff(staff);
				 if(result.equalsIgnoreCase("update") )
				 	{
					    request.setAttribute("msg", "staff");
					 	request.setAttribute("error", "Employee successfully added to the table");
					    view = request.getRequestDispatcher("newEmploy1.jsp");
				 	}
				 else
				 {
					 request.setAttribute("error", "Please contact the Admin");
		             view = request.getRequestDispatcher("newEmploy1.jsp");
 
				 }
				 
			 }
			 else
			 {
				 request.setAttribute("error", "Please contact the Admin");
				 view = request.getRequestDispatcher("newEmploy1.jsp");
			 }
			 
			 
			 view.forward(request, response);
			 
	
		 }
		 catch (Exception e)
	        {
			 out.println("------------> " + e);
	        }
		
	}

}

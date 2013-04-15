package Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Connection.ServiceProxy;
import Connection.Staff;

public class CreateEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceProxy proxy = new ServiceProxy();

	public CreateEmp() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void process(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String result = "";
		proxy.setEndpoint("http://localhost:8080/AMS/services/Service");
		RequestDispatcher view;
		String[] id = new String[10];

		HttpSession session = request.getSession(false);
		if (request.getParameter("chkEmployee") != null) {
			try {
				result = proxy.register(request.getParameter("firstname"),
						request.getParameter("ssn"));

				id = result.split(","); 

				session.setAttribute("MyId", id[1]);
			    if (id[0].equalsIgnoreCase("present")) {
					request.setAttribute("error", "Employee already present");

					view = request.getRequestDispatcher("createEmp.jsp");
				} else if (id[0].equalsIgnoreCase("notInStaff")) {
					request.setAttribute("msg", "staff");
					request.setAttribute("error",
							"Employee Not Present in Staff Table");
					view = request.getRequestDispatcher("createEmp.jsp");
				} else {
					request.setAttribute("msg", "nop");
					request.setAttribute("error",
							"Employee not present in the Database");
					view = request.getRequestDispatcher("createEmp.jsp");
				}

				view.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (request.getParameter("newStaff") != null) {

			try {
				String status = "Active";

				Staff staff = new Staff();
				staff.setSid((String)session.getAttribute("MyId"));

				String alid = request.getParameter("alid");
				out.println("---"+alid);
				staff.setAlid(alid);
				String position = request.getParameter("position");
				out.println("---"+position);
				staff.setPosition(position);

				String[] hdt = request.getParameter("hiredate").split("-");
				staff.setHiredate(hdt[2].concat("-").concat(
						hdt[0].concat("-").concat(hdt[1])));
				staff.setStatus(status);
				 result= proxy.createStaff(staff);
				 if (result != null){
				 if(result.equalsIgnoreCase("update") )
				 	{
					    request.setAttribute("msg", "staff");
					 	request.setAttribute("error", "Employee successfully added to the table");
					    view = request.getRequestDispatcher("adminHome.jsp");
				 	}
				 else
				 {
					 request.setAttribute("error", "Please contact the Admin");
		             view = request.getRequestDispatcher("newStaff.jsp");
 
				 }
				 view.forward(request, response);
				 }
				 else{
					 request.setAttribute("error", "Please contact the Admin");
					 view=request.getRequestDispatcher("newStaff.jsp");
				 }

			} catch (Exception e) {
				out.println("------------> " + e);
			}
		}

	}
}

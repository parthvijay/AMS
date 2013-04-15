package Servlets;

import java.io.IOException;
import Connection.*;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Connection.ServiceProxy;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ServiceProxy proxy=new ServiceProxy(); 

	public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String result = "";
		 try{			
			 	proxy.setEndpoint("http://localhost:8080/AMS/services/Service");
			 	RequestDispatcher view;
			 	if((result = proxy.login(request.getParameter("username"), request.getParameter("password"))) != null)
			 	{
					HttpSession session = request.getSession();
					Customer customer = new Customer();
					Person person = new Person();
					session.setAttribute("customer", customer);
					session.setAttribute("person", person);
					synchronized(session)
					{
						session.setAttribute("userSession", session);
					    session.setAttribute("currentuser", result.split(">")[0]);
					    session.setAttribute("pid", result.split(">")[1]);
					    session.setAttribute("staffalid", result.split(">")[2]);
					}
					if(result.split(">")[3].equals("CSR"))
						view = request.getRequestDispatcher("staffhome.jsp");
					else
						view = request.getRequestDispatcher("adminHome.jsp");
			 	}
			 	else
			 	{
			 		view = request.getRequestDispatcher("login.jsp");
			 	}
				view.forward(request, response);	
		 }
		 catch (Exception e)
	        {
	            e.printStackTrace();
	        }
		
	}

}

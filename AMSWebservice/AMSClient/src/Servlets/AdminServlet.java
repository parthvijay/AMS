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
 * Servlet implementation class ExistingBooking
 */

public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ServiceProxy proxy=new ServiceProxy(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		boolean existenceFlag = false, insertFlag=false;
		RequestDispatcher view = null;
		proxy.setEndpoint("http://localhost:8080/AMS/services/Service");
		 try
		 {
			 AirLines airline = new AirLines();

			 String airlineInfo = request.getParameter("airlineInfo");
			 airline.setAlid(airlineInfo.substring(0, airlineInfo.indexOf(' ')));
			 airline.setAircraft(request.getParameter("aircraft"));
			 airline.setName(airlineInfo.substring(airlineInfo.indexOf(' ')+3));
			 airline.setCapacity(request.getParameter("capacity"));
			 airline.setCrewcount(request.getParameter("crewcount"));
			 
			 Flight flight = new Flight();
			 flight.setAlid(airlineInfo.substring(0, airlineInfo.indexOf(' ')));
			 flight.setAircraft(request.getParameter("aircraft"));
			 flight.setDeptdate(request.getParameter("deptdate"));
			 flight.setArrvdate(request.getParameter("arrvdate"));
			 flight.setDepttime(request.getParameter("deptime"));
			 flight.setArrvtime(request.getParameter("arrvtime"));
			 flight.setSource(request.getParameter("source"));
			 flight.setDestination(request.getParameter("destination"));
			 flight.setStatus(request.getParameter("status"));
			 
			 existenceFlag = proxy.flightExistence(flight);
			 
			 if(!existenceFlag)
			 {
				 insertFlag = proxy.createFlight(flight, airline);
				 if(insertFlag)
				 {
					 request.setAttribute("airline", airline);
					 request.setAttribute("flight", flight);
					 request.setAttribute("message", "NEW FLIGHT CREATED SUCCESSFULLY");
					 request.setAttribute("addStatus", "true");
					 view = request.getRequestDispatcher("addNewFlight.jsp");
				 }
			 }
			 else
			 {
				 request.setAttribute("airline", airline);
				 request.setAttribute("flight", flight);
				 request.setAttribute("addStatus", "true");
				 request.setAttribute("existenceStatus", "true");
				 request.setAttribute("message", "FLIGHT ALREADY EXISTS");
				 view = request.getRequestDispatcher("addNewFlight.jsp");
			 }
			 view.forward(request, response);
		
		 }catch (Exception e)
         {
			 out.println("------------> " + e);
         }
	}
}

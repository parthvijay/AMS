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

import Connection.DisplayStaff;
import Connection.Flight;
import Connection.ServiceProxy;

/**
 * Servlet implementation class ModifyFlight
 */
@WebServlet("/ModifyFlight")
public class ModifyFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceProxy proxy = new ServiceProxy();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModifyFlight() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		boolean statusFlag;
		proxy.setEndpoint("http://localhost:8080/AMS/services/Service");
		RequestDispatcher view;
		if(request.getParameter("pageval").equals("save")){
		
	        String halid = request.getParameter("halid");
	        String haircraft = request.getParameter("haircraft");
	        String hdeptdate = request.getParameter("hdeptdate");
	        
			Flight fl= new Flight();
			fl.setAlid(request.getParameter("alid"));
			fl.setAircraft(request.getParameter("aircraft"));
			fl.setDeptdate(request.getParameter("deptDate"));
			fl.setArrvdate(request.getParameter("arrvDate"));
			fl.setArrvtime(request.getParameter("arrvtime"));
			fl.setDepttime(request.getParameter("depttime"));
			fl.setSource(request.getParameter("Source"));
			fl.setDestination(request.getParameter("Destination"));
			fl.setStatus(request.getParameter("status"));
			
			statusFlag = proxy.updateFlightDetails(halid, haircraft, hdeptdate, fl);
			
			if(!statusFlag)
			{
				request.setAttribute("error", "Flight record cannot be updated. Please contact System Administrator.");
			}
			else 
			{
				request.setAttribute("error", "Flight updated Successfully. Below is the modified deatils.");
				request.setAttribute("Modifiedflight", fl);
			}
			
			view = request.getRequestDispatcher("ModifiedFlight.jsp");
			view.forward(request, response);
		}
		else if (request.getParameter("pageval").equals("search")) {
		
			
			System.out.println("Hello.....");
			String airlineId = request.getParameter("alid");
			String[] deptdate = request.getParameter("deptdate").split("-");
			String source = request.getParameter("source");
			String destination = request.getParameter("destination");
						
			if(source.equals(""))
				source="%";
			if(destination.equals(""))
				destination="%";
			
			String newdate= (deptdate[2].concat("-").concat(
					deptdate[1].concat("-").concat(deptdate[0])));
			
			request.setAttribute("airlineId", airlineId);
			request.setAttribute("deptdate", newdate );
			request.setAttribute("source", source);
			request.setAttribute("destination", destination);
			
			Flight[] flights = null;
			
			flights = proxy.getFlights(airlineId, newdate, source, destination);

			if (flights != null) {
				
				for(Flight f : flights)
				{
					f.setDeptdate(f.getDeptdate().substring(8, 10) + "-" + f.getDeptdate().substring(5, 7) + "-" + f.getDeptdate().substring(0, 4));
					f.setArrvdate(f.getArrvdate().substring(8, 10) + "-" + f.getArrvdate().substring(5, 7) + "-" + f.getArrvdate().substring(0, 4));
					f.setDepttime(f.getDepttime().substring(0, 5));
					f.setArrvtime(f.getArrvtime().substring(0, 5));
				}
				
				request.setAttribute("objFlight", flights);
				request.setAttribute("searchFlight","true");
				view = request.getRequestDispatcher("modifyFlight.jsp");
			}
			else
			{
				request.setAttribute("error", "Flight not Found");
				request.setAttribute("searchFlight","false");
				view = request.getRequestDispatcher("modifyFlight.jsp");
			}
			view.forward(request, response);
		}
	}
}
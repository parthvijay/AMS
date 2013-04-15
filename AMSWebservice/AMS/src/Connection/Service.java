package Connection;

import javax.jws.WebService;


@WebService
public class Service {	
	
	DBConnect db = new DBConnect();
	
	/*************************Added by Anoop*****************/
	public String login(String username, String password)
	{
		return db.login(username, password);
	}

	public boolean changePassword(String newpassword, String pid)
	{
		return db.changePassword(newpassword, pid);
	} 

	public Flight newReservation(Customer customer)
	{
		return new Flight();
	}

	
	/*************************Added by Sagar*****************/
	public String viewTicket(String ticketnumber, String date)
	{
		return db.viewTicket(ticketnumber, date);
	}	
	
	
	public String createPerson(Person person)
	{
		return db.createPerson(person);
	}

	public String createCustomer(Customer customer)
	{
		return db.createCustomer(customer);
	}

	public String getAllCustomers(String alid, String date)
	{
		return db.getAllCustomers(alid,date);
	}

	 
	public Customer[] getBookingsOfACustomer(String cid)
	{
		return db.getBookingsOfACustomer(cid);
	}

	public boolean updateCustomer(Customer customer)
	{
		return db.updateCustomer(customer);
	}

	public boolean updatePerson(Person person)
	{
		return db.updatePerson(person);
	}

 	public Flight getCustomerFlight(String alid, String date, String aircraft)
	{
		return db.getCustomerFlight(alid, date, aircraft);
	}
	public Flight[] getAllFlights(String alid, String date)
	{
		return new Flight[]{};
	}
	
	public Flight[] getFlights(String alid, String date, String source, String destination)
	{
		return db.getFlights(alid, date, source, destination);
	}
	
	public Customer getCustomer(String cid)
	{
		return db.getCustomer(cid);
	}

	public Person getPerson(String pid)
	{
		return db.getPerson(pid);
	}


	public String getCustomerById(String cid)
	{
		return db.getCustomerById(cid);
	}
	
	public String getCompleterCustomerDetails(String cid)
	{
		return db.getCompleterCustomerDetails(cid);
	}
	
	public String getCustTravelInfo(String cid)
	{
		return db.getCustTravelInfo(cid);
	}

	public String createEmployee(Staff staff)
	{
		return String.valueOf(new Staff().getSid());
	}
	
	public String deleteEmployee(String sid)
	{
		return new Staff().getStatus();
	}
	
	public Staff[] getAllEmployee(String alid, String status)
	{
		return new Staff[]{};
	}

	public Staff updateEmployee(Staff staff)
	{
		return new Staff();
	}
	
	public Flight updateFlight(String alid, String date)
	{
		return new Flight();
	}
	
	public Staff getEmployee(String sid)
	{
		return new Staff();
	}

	public Flight[] getAssignedFlights(String sid)
	{
		return new Flight[]{};
	}	
	
	public Person getPersonCustomer(String cid)
	{
		return db.getPersonCustomer(cid);
	}
	
	public boolean updatePersonDetails(Person person)
	{
		return db.updatePersonDetails(person);
	}
	
	public String getActiveReservation(String tid, String date)
	{
		return db.getActiveReservation(tid, date);
	}
	
	public String modifyReservation(String ticketNumber, String radioString, String date)
	{
		return db.modifyReservation(ticketNumber, radioString, date);
	}
	
	public String cancelReservation(String ticketNumber, String status, String date)
	{
		return db.cancelReservation(ticketNumber,status, date);
	}
	
	public boolean createFlight(Flight flight, AirLines airLine)
	{
		return db.createFlight(flight, airLine);
	}
	
	public boolean flightExistence(Flight flight)
	{
		return db.flightExistence(flight);
	}
    
	public boolean updateFlightDetails(String oAlid,String oAircraft,String oDeptdate, Flight f) {
		return db.updateFlightDetails(oAlid,oAircraft,oDeptdate, f);
	}
    
	  //****************************Aditya**********************
    
    public String deleteEmp(String sid) {
            return db.delEmp(sid);
    }
    
    public DisplayStaff[] searchEmployees(String name, String airline){
            return db.searchEmployees(name,airline);
    }
    
    public String updateEmployeeDetails(String sid, DisplayStaff p){
            return db.updateEmployeeDetails(sid, p);
    }
    

    
    //******************************************************************
    
    //*************************Shailesh************************************
    
    public String register(String firstname, String ssn) {
            return db.register(firstname, ssn);
    }
    
    public String createStaff(Staff staff){
            return db.createStaff(staff);
    }

    //*******************************************************************	
}

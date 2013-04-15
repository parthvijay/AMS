package Connection;

public class ServiceProxy implements Connection.Service {
  private String _endpoint = null;
  private Connection.Service service = null;
  
  public ServiceProxy() {
    _initServiceProxy();
  }
  
  public ServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initServiceProxy();
  }
  
  private void _initServiceProxy() {
    try {
      service = (new Connection.ServiceServiceLocator()).getService();
      if (service != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)service)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)service)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (service != null)
      ((javax.xml.rpc.Stub)service)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public Connection.Service getService() {
    if (service == null)
      _initServiceProxy();
    return service;
  }
  
  public java.lang.String register(java.lang.String firstname, java.lang.String ssn) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.register(firstname, ssn);
  }
  
  public java.lang.String createPerson(Connection.Person person) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.createPerson(person);
  }
  
  public boolean changePassword(java.lang.String newpassword, java.lang.String pid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.changePassword(newpassword, pid);
  }
  
  public Connection.Flight updateFlight(java.lang.String alid, java.lang.String date) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.updateFlight(alid, date);
  }
  
  public Connection.Staff getEmployee(java.lang.String sid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getEmployee(sid);
  }
  
  public boolean createFlight(Connection.Flight flight, Connection.AirLines airLine) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.createFlight(flight, airLine);
  }
  
  public java.lang.String deleteEmp(java.lang.String sid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.deleteEmp(sid);
  }
  
  public java.lang.String createStaff(Connection.Staff staff) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.createStaff(staff);
  }
  
  public boolean updatePerson(Connection.Person person) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.updatePerson(person);
  }
  
  public java.lang.String viewTicket(java.lang.String ticketnumber, java.lang.String date) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.viewTicket(ticketnumber, date);
  }
  
  public Connection.Person getPerson(java.lang.String pid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getPerson(pid);
  }
  
  public Connection.Customer getCustomer(java.lang.String cid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getCustomer(cid);
  }
  
  public Connection.Flight[] getFlights(java.lang.String alid, java.lang.String date, java.lang.String source, java.lang.String destination) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getFlights(alid, date, source, destination);
  }
  
  public java.lang.String login(java.lang.String username, java.lang.String password) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.login(username, password);
  }
  
  public java.lang.String getCustTravelInfo(java.lang.String cid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getCustTravelInfo(cid);
  }
  
  public java.lang.String createEmployee(Connection.Staff staff) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.createEmployee(staff);
  }
  
  public java.lang.String deleteEmployee(java.lang.String sid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.deleteEmployee(sid);
  }
  
  public java.lang.String getCompleterCustomerDetails(java.lang.String cid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getCompleterCustomerDetails(cid);
  }
  
  public java.lang.String getCustomerById(java.lang.String cid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getCustomerById(cid);
  }
  
  public Connection.Flight[] getAllFlights(java.lang.String alid, java.lang.String date) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getAllFlights(alid, date);
  }
  
  public Connection.Flight getCustomerFlight(java.lang.String alid, java.lang.String date, java.lang.String aircraft) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getCustomerFlight(alid, date, aircraft);
  }
  
  public boolean updateCustomer(Connection.Customer customer) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.updateCustomer(customer);
  }
  
  public Connection.Customer[] getBookingsOfACustomer(java.lang.String cid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getBookingsOfACustomer(cid);
  }
  
  public java.lang.String getAllCustomers(java.lang.String alid, java.lang.String date) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getAllCustomers(alid, date);
  }
  
  public java.lang.String createCustomer(Connection.Customer customer) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.createCustomer(customer);
  }
  
  public Connection.Flight newReservation(Connection.Customer customer) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.newReservation(customer);
  }
  
  public Connection.Staff[] getAllEmployee(java.lang.String alid, java.lang.String status) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getAllEmployee(alid, status);
  }
  
  public Connection.Staff updateEmployee(Connection.Staff staff) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.updateEmployee(staff);
  }
  
  public Connection.Flight[] getAssignedFlights(java.lang.String sid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getAssignedFlights(sid);
  }
  
  public Connection.Person getPersonCustomer(java.lang.String cid) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getPersonCustomer(cid);
  }
  
  public boolean updatePersonDetails(Connection.Person person) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.updatePersonDetails(person);
  }
  
  public java.lang.String getActiveReservation(java.lang.String tid, java.lang.String date) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.getActiveReservation(tid, date);
  }
  
  public java.lang.String modifyReservation(java.lang.String ticketNumber, java.lang.String radioString, java.lang.String date) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.modifyReservation(ticketNumber, radioString, date);
  }
  
  public java.lang.String cancelReservation(java.lang.String ticketNumber, java.lang.String status, java.lang.String date) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.cancelReservation(ticketNumber, status, date);
  }
  
  public boolean flightExistence(Connection.Flight flight) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.flightExistence(flight);
  }
  
  public boolean updateFlightDetails(java.lang.String oAlid, java.lang.String oAircraft, java.lang.String oDeptdate, Connection.Flight f) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.updateFlightDetails(oAlid, oAircraft, oDeptdate, f);
  }
  
  public Connection.DisplayStaff[] searchEmployees(java.lang.String name, java.lang.String airline) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.searchEmployees(name, airline);
  }
  
  public java.lang.String updateEmployeeDetails(java.lang.String sid, Connection.DisplayStaff p) throws java.rmi.RemoteException{
    if (service == null)
      _initServiceProxy();
    return service.updateEmployeeDetails(sid, p);
  }
  
  
}
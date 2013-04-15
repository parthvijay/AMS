/**
 * Service.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package Connection;

public interface Service extends java.rmi.Remote {
    public java.lang.String register(java.lang.String firstname, java.lang.String ssn) throws java.rmi.RemoteException;
    public java.lang.String createPerson(Connection.Person person) throws java.rmi.RemoteException;
    public boolean changePassword(java.lang.String newpassword, java.lang.String pid) throws java.rmi.RemoteException;
    public Connection.Flight updateFlight(java.lang.String alid, java.lang.String date) throws java.rmi.RemoteException;
    public Connection.Staff getEmployee(java.lang.String sid) throws java.rmi.RemoteException;
    public boolean createFlight(Connection.Flight flight, Connection.AirLines airLine) throws java.rmi.RemoteException;
    public java.lang.String deleteEmp(java.lang.String sid) throws java.rmi.RemoteException;
    public java.lang.String createStaff(Connection.Staff staff) throws java.rmi.RemoteException;
    public boolean updatePerson(Connection.Person person) throws java.rmi.RemoteException;
    public java.lang.String viewTicket(java.lang.String ticketnumber, java.lang.String date) throws java.rmi.RemoteException;
    public Connection.Person getPerson(java.lang.String pid) throws java.rmi.RemoteException;
    public Connection.Customer getCustomer(java.lang.String cid) throws java.rmi.RemoteException;
    public Connection.Flight[] getFlights(java.lang.String alid, java.lang.String date, java.lang.String source, java.lang.String destination) throws java.rmi.RemoteException;
    public java.lang.String login(java.lang.String username, java.lang.String password) throws java.rmi.RemoteException;
    public java.lang.String getCustTravelInfo(java.lang.String cid) throws java.rmi.RemoteException;
    public java.lang.String createEmployee(Connection.Staff staff) throws java.rmi.RemoteException;
    public java.lang.String deleteEmployee(java.lang.String sid) throws java.rmi.RemoteException;
    public java.lang.String getCompleterCustomerDetails(java.lang.String cid) throws java.rmi.RemoteException;
    public java.lang.String getCustomerById(java.lang.String cid) throws java.rmi.RemoteException;
    public Connection.Flight[] getAllFlights(java.lang.String alid, java.lang.String date) throws java.rmi.RemoteException;
    public Connection.Flight getCustomerFlight(java.lang.String alid, java.lang.String date, java.lang.String aircraft) throws java.rmi.RemoteException;
    public boolean updateCustomer(Connection.Customer customer) throws java.rmi.RemoteException;
    public Connection.Customer[] getBookingsOfACustomer(java.lang.String cid) throws java.rmi.RemoteException;
    public java.lang.String getAllCustomers(java.lang.String alid, java.lang.String date) throws java.rmi.RemoteException;
    public java.lang.String createCustomer(Connection.Customer customer) throws java.rmi.RemoteException;
    public Connection.Flight newReservation(Connection.Customer customer) throws java.rmi.RemoteException;
    public Connection.Staff[] getAllEmployee(java.lang.String alid, java.lang.String status) throws java.rmi.RemoteException;
    public Connection.Staff updateEmployee(Connection.Staff staff) throws java.rmi.RemoteException;
    public Connection.Flight[] getAssignedFlights(java.lang.String sid) throws java.rmi.RemoteException;
    public Connection.Person getPersonCustomer(java.lang.String cid) throws java.rmi.RemoteException;
    public boolean updatePersonDetails(Connection.Person person) throws java.rmi.RemoteException;
    public java.lang.String getActiveReservation(java.lang.String tid, java.lang.String date) throws java.rmi.RemoteException;
    public java.lang.String modifyReservation(java.lang.String ticketNumber, java.lang.String radioString, java.lang.String date) throws java.rmi.RemoteException;
    public java.lang.String cancelReservation(java.lang.String ticketNumber, java.lang.String status, java.lang.String date) throws java.rmi.RemoteException;
    public boolean flightExistence(Connection.Flight flight) throws java.rmi.RemoteException;
    public boolean updateFlightDetails(java.lang.String oAlid, java.lang.String oAircraft, java.lang.String oDeptdate, Connection.Flight f) throws java.rmi.RemoteException;
    public Connection.DisplayStaff[] searchEmployees(java.lang.String name, java.lang.String airline) throws java.rmi.RemoteException;
    public java.lang.String updateEmployeeDetails(java.lang.String sid, Connection.DisplayStaff p) throws java.rmi.RemoteException;
}

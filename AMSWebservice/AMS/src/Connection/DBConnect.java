package Connection;

import java.sql.*;
import java.util.*;

import Utility.Email;
import Utility.GenerateUserCredentials;
import Utility.Templates;

public class DBConnect
{
	
	Connection con = null;
	static ResultSet rs;
    Statement stmt = null;
    ConPool pool = null;
    
    DBConnect()
	{		
		try
		{			
				pool = ConPool.getInstance();
				con = pool.getCon();
				stmt = con.createStatement();
				if (!con.isClosed())
					System.out.println("Successfully Connected!!!");
		} catch (Exception e) {}
	}

	public String login(String username, String password)
	{
		try
		{
			ResultSet rs = stmt.executeQuery("select * from login where username = '" + username + "' and password = '" + password + "'");
			if(rs.next())
			{
				rs = stmt.executeQuery("select firstname, pid from person where pid = '" + rs.getString("pid") + "'");
				if(rs.next())
				{
					String firstname = rs.getString("firstname");
					String pid = rs.getString("pid");
					rs = stmt.executeQuery("select alid, position from staff where sid = '" + rs.getString("pid") + "'");
					if(rs.next())
						return firstname.concat(">").concat(pid).concat(">").concat(rs.getString("alid")).concat(">").concat(rs.getString("position"));
					else
						return firstname.concat(">").concat(pid);
				}
			}
			else
				return null;
		} catch(Exception e){System.out.println("Error from login()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}
	
	public String createPerson(Person person)
	{
		try
		{
			stmt.executeUpdate("insert into person (firstname, lastname, address, city, phone, email, state, zip, dob, ssn)" +
										"values('" + person.getFirstname() + "','"
												   + person.getLastname() + "','" 
												   + person.getAddress() + "','" 
												   + person.getCity() + "','" 
												   + person.getPhone() + "','" 
												   + person.getEmail() + "','" 
												   + person.getState() + "','" 
												   + person.getZip() + "','" 
												   + person.getDob() + "','" 
												   + person.getSsn() + "')", Statement.RETURN_GENERATED_KEYS);
			
			ResultSet rs = stmt.executeQuery("select LAST_INSERT_ID()");
			if(rs.next())
			{
				String pid = String.valueOf(rs.getInt(1));
				String username = GenerateUserCredentials.getUserName(person.getFirstname(), person.getLastname());
				 String password = GenerateUserCredentials.setPassword(this, username, pid);
				 if(password != "")
				 {
					 String[] to = {person.getEmail()};
					 Email.sendEmail("krishnananoop8@gmail.com", to, "AMS Credentials", Templates.credentials(username, password));
				 }
			
				 return pid;
			}
			else
				return null;
		} catch(Exception e){System.out.println("Error from createPerson()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}
	
	public boolean createFlight(Flight flight, AirLines airLine) {
		PreparedStatement prepstmt = null;
		
		System.out.println(airLine.getAlid() + " "+ airLine.getName() + " " + airLine.getAircraft() + " " + airLine.getCapacity() + " " + airLine.getCrewcount());
		System.out.println(flight.getDeptdate());
		
		String depDate = flight.getDeptdate().substring(6) + flight.getDeptdate().substring(2,6) + flight.getDeptdate().substring(0,2);
		String arrvDate = flight.getArrvdate().substring(6) + flight.getArrvdate().substring(2,6) + flight.getArrvdate().substring(0,2);
		
		System.out.println(depDate);
		
		try
		{	
			prepstmt = con.prepareStatement("insert into airlines(alid,name,aircraft,capacity,crewcount)" +
					"values('" + airLine.getAlid() + "','"
							   + airLine.getName() + "','"
							   + airLine.getAircraft() + "','"
							   + airLine.getCapacity() + "','" 
							   + airLine.getCrewcount() + "')" );

			prepstmt.executeUpdate();
			prepstmt = null;
			prepstmt = con.prepareStatement("insert into flight(alid,aircraft,deptdate,arrvdate,deptime,arrvtime,source,destination,status)" +
										"values('" + flight.getAlid() + "','"
												   + flight.getAircraft() + "','" 
												   + depDate + "','" 
												   + arrvDate + "','" 
												   + flight.getDepttime() + "','" 
												   + flight.getArrvtime() + "','" 
												   + flight.getSource() + "','" 
												   + flight.getDestination() + "','"
												   + flight.getStatus() + "')" );
			
			int flag = prepstmt.executeUpdate();
			if(flag > 0)
				return true;
			else
				return false;
		} catch(Exception e){System.out.println("Error from createFlight()::: " + e);}
		finally{pool.freeCon(con);}
		return false;
	}
	
	public boolean flightExistence(Flight flight)
	{
		String jourDate = flight.getDeptdate().substring(6) + flight.getDeptdate().substring(2,6) + flight.getDeptdate().substring(0,2) ;

		PreparedStatement prepstmt = null;

		try
		{
			prepstmt = con.prepareStatement("select * from flight where alid =? and deptdate =? and aircraft=?");
			prepstmt.setString(1, flight.getAlid());
			prepstmt.setString(2, jourDate);
			prepstmt.setString(3, flight.getAircraft());
			
			rs = prepstmt.executeQuery();
			if(rs.next())
				return true;
			else
				return false;
		} catch(Exception e){System.out.println("Error from flightExistence()::: " + e);}
		finally{pool.freeCon(con);}
		return false;
	}
	
	public boolean updatePerson(Person person)
	{
		try
		{
			int rsint = stmt.executeUpdate("update person set firstname = '" + person.getFirstname() + 
											  "', lastname = '" + person.getLastname() +
											  "', lastname = '" + person.getLastname() +
											  "', address = '" + person.getAddress() +
											  "', city = '" + person.getCity() +
											  "', phone = '" + person.getPhone() +
											  "', email = '" + person.getEmail() +
											  "', state = '" + person.getState() +
											  "', zip = '" + person.getZip() +
											  "', dob = '" + person.getDob() + "' where pid = '" + person.getPid() + "'");
			
			if(rsint != 0)
				return true;
			else
				return false;
		} catch(Exception e){System.out.println("Error from createPerson()::: " + e);}
		finally{pool.freeCon(con);}
		return false;
	}

	public boolean updatePersonDetails(Person person)
	{
		PreparedStatement prepstmt = null;
		try
		{
			prepstmt = con.prepareStatement("Update person set address=?, city=?, email=?, phone=?, state=?, zip=? where pid=?");
			prepstmt.setString(1, person.getAddress());
			prepstmt.setString(2, person.getCity());
			prepstmt.setString(3, person.getEmail());
			prepstmt.setString(4, person.getPhone());
			prepstmt.setString(5, person.getState());
			prepstmt.setString(6, person.getZip());
			prepstmt.setInt(7, Integer.parseInt(person.getPid()));
			int flag = prepstmt.executeUpdate();
			if(flag>0)
				
				return true;
			
			else
				
				return false;
			
		} catch(Exception e){System.out.println("Error from updatePersonDetails()::: " + e);}
		finally{pool.freeCon(con);}
		return false;
	}
	
	public Customer getCustomer(String cid)
	{
		try
		{
			ResultSet rs = stmt.executeQuery("select * from person where pid = '" + cid + "'");
			if(rs.next())
			{
				Customer customer = new Customer();
				customer.setCid(cid);
				rs = stmt.executeQuery("select * from Customer where cid = '" + cid + "' order by fdate desc limit 1");
				if(rs.next())
				{
					customer.setNationality(rs.getString("nationality"));
					customer.setPassport(rs.getString("passport"));
					customer.setCid(rs.getString("cid"));
				}
				return customer;
			}
			else
				return null;
		} catch(Exception e){System.out.println("Error from getCustomer()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}

	public Person getPerson(String pid)
	{
		try
		{
			ResultSet rs = stmt.executeQuery("select * from person where pid = '" + pid + "'");
			if(rs.next())
			{
				Person person = new Person();
				person.setPid(pid);
				person.setFirstname(rs.getString("firstname"));
				person.setLastname(rs.getString("lastname"));
				person.setSsn(rs.getString("ssn"));
				person.setAddress(rs.getString("address"));
				person.setCity(rs.getString("city"));
				person.setDob(rs.getString("dob"));
				person.setEmail(rs.getString("email"));
				person.setPhone(rs.getString("phone"));
				person.setState(rs.getString("state"));
				person.setZip(rs.getString("zip"));
				
				return person;
			}
			else
				return null;
		} catch(Exception e){System.out.println("Error from getCustomer()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}

	public Flight[] getFlights(String alid, String date, String source, String destination)
	{
		try
		{
			ResultSet rs = stmt.executeQuery("select * from flight where alid like '" + alid + "' and deptdate = '" + date +  "' and source like '%" + source + "%' and destination like '%" + destination + "%'");
			ArrayList<Flight> lstflights = new ArrayList<Flight>();
			while(rs.next())
			{
				Flight flight = new Flight();
				flight.setAircraft(rs.getString("aircraft"));
				flight.setAlid(rs.getString("alid"));
				flight.setArrvdate(rs.getString("arrvdate"));
				flight.setArrvtime(rs.getString("arrvtime"));
				flight.setDeptdate(rs.getString("deptdate"));
				flight.setDepttime(rs.getString("deptime"));
				flight.setDestination(rs.getString("destination"));
				flight.setSource(rs.getString("source"));
				flight.setStatus(rs.getString("status"));
				lstflights.add(flight);
			}
			Flight[] flights = new Flight[lstflights.size()];
			for(int i=0;i<lstflights.size();i++)
				flights[i] = lstflights.get(i);
			return flights;
		} catch(Exception e){System.out.println("Error from getFlights()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}	
	
	public String createCustomer(Customer customer)
	{
		try
		{
			int rs = stmt.executeUpdate("insert into customer (cid, ticketprefix, ticketsuffix, fdate, passport, nationality, alid, aircraft, status)" +
										"values('" + customer.getCid() + "','"
												   + customer.getTicketnum().split(">")[0] + "','" 
												   + customer.getTicketnum().split(">")[1] + "','" 
												   + customer.getDate() + "','" 
												   + customer.getPassport() + "','" 
												   + customer.getNationality() + "','" 
												   + customer.getAlid() + "','" 
												   + customer.getAircraft() + "','" 
												   + customer.getStatus() + "')");
			if(rs != 0)
				return "true";
			else
				return "false";
		} catch(Exception e){System.out.println("Error from createCustomer()::: " + e);}
		finally{pool.freeCon(con);}
		
		return null;
	}	
	
	public boolean updateCustomer(Customer customer)
	{
		try
		{
			int rsint = stmt.executeUpdate("update customer set passport = '" + customer.getPassport() + 
											  "', nationality = '" + customer.getNationality() + "' where cid = '" + customer.getCid() + "'");
			
			if(rsint != 0)
				return true;
			else
				return false;
		} catch(Exception e){System.out.println("Error from updateCustomer()::: " + e);}
		finally{pool.freeCon(con);}
		return false;
	}
	
	public boolean checkCredentials(String username, String password, String pid)
	{
		try
		{
			ResultSet rs = stmt.executeQuery("select * from login where username = '" + username + "' and password = '" + password + "'");
			if(rs.next())
				return false;
			int rsint = stmt.executeUpdate("insert into login values('" + username + "', '" + password + "', '" + pid + "')");
			if(rsint != 0)
				return true;
			else
				return false;
		} catch(Exception e){System.out.println("Error from checkCredentials()::: " + e);}
		finally{pool.freeCon(con);}
		return false;
	}

	public boolean changePassword(String newpassword, String pid)
	{
		try
		{
			int rsint = stmt.executeUpdate("update login set password = '" + newpassword + "' where pid = '" + pid + "'");
			if(rsint != 0)
				return true;
			else
				return false;
		} catch(Exception e){System.out.println("Error from changePassword()::: " + e);}
		finally{pool.freeCon(con);}
		return false;
	}

 	public Flight getCustomerFlight(String alid, String date, String aircraft)
	{
		try
		{
			ResultSet rs = stmt.executeQuery("select * from flight where alid = '" + alid + "' and deptdate = '" + date + "' and aircraft = '" + aircraft + "'");
			Flight flight = new Flight();
			if(rs.next())
			{
				flight.setAircraft(rs.getString("aircraft"));
				flight.setAlid(rs.getString("alid"));
				flight.setArrvdate(rs.getString("arrvdate"));
				flight.setArrvtime(rs.getString("arrvtime"));
				flight.setDeptdate(rs.getString("deptdate"));
				flight.setDepttime(rs.getString("deptime"));
				flight.setDestination(rs.getString("destination"));
				flight.setSource(rs.getString("source"));
				flight.setStatus(rs.getString("status"));
				return flight;
			}
		} catch(Exception e){System.out.println("Error from getCustomerFlight()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}
	
	public Customer[] getBookingsOfACustomer(String cid)
	{
		try
		{
			ResultSet rs = stmt.executeQuery("select * from Customer where cid = '" + cid + "'");
			ArrayList<Customer> lstcustomer = new ArrayList<Customer>();
			while(rs.next())
			{
				Customer customer = new Customer();
				customer.setCid(rs.getString("cid"));
				customer.setNationality(rs.getString("nationality"));
				customer.setPassport(rs.getString("passport"));
				customer.setTicketnum(rs.getString("ticketprefix").concat(rs.getString("ticketsuffix")));
				customer.setAlid(rs.getString("alid"));
				customer.setDate(rs.getString("fdate"));
				customer.setAircraft(rs.getString("aircraft"));
				customer.setStatus(rs.getString("status"));
				lstcustomer.add(customer);
			}
			Customer[] customers = new Customer[lstcustomer.size()];
			for(int i=0;i<lstcustomer.size();i++)
				customers[i] = lstcustomer.get(i);
			return customers;
		} catch(Exception e){System.out.println("Error from getBookingsOfACustomer()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}
	
	
	
	//******************************************************************************************
	
	public String viewTicket(String ticketnumber, String date)
	{
		String ticketPrefix = "",ticketSuffix="", jourDate="";
		String result=null;

		if(!validateCustomerTicket(ticketnumber,date))
			return null;
		
		try
		{
			jourDate = date.substring(6) + date.substring(2,6) + date.substring(0,2) ;
			ticketPrefix = ticketnumber.substring(0, 2);
			ticketSuffix = ticketnumber.substring(2);
			String query = "select cid,alid,status,fdate,aircraft from customer where ticketprefix = '" + ticketPrefix + 
					"' and ticketsuffix = '" + ticketSuffix + "' and fdate='"+jourDate+"'";
			
			ResultSet rs = stmt.executeQuery(query);
			String customerId = "", alid = "",aircraft="",fdate="";
			
			if(rs.next())
			{
				customerId = rs.getString("cid");
				alid = rs.getString("alid");
				fdate = rs.getString("fdate");
				aircraft = rs.getString("aircraft");
				result = customerId + "$"+ alid + "$"+fdate + "$"+aircraft + "$"+ rs.getString("status") + "$";
				
			}
			else
				return null;
			rs=null;
			
			rs = stmt.executeQuery("select firstname,lastname from person where pid = " + Integer.parseInt(customerId));
			if(rs.next())
			{
				result+=(rs.getString("firstname")+"$"+rs.getString("lastname")+"$");
			}
			else
				return null;
			
			rs = stmt.executeQuery("select * from flight where alid = '" + alid +"' and aircraft = '" + aircraft + "' and deptdate = '" + fdate+"'");
			if(rs.next())
			{
				result+=(rs.getString("deptime")+"$"
						+ rs.getString("arrvdate")+"$"
						+ rs.getString("arrvtime")+"$"
						+ rs.getString("source")+"$"
						+ rs.getString("destination")+"$"+ rs.getString("status"));

				return result;
			}
			else
				return null;
			
		} catch(Exception e){System.out.println("Error from viewTicket()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}
	
	public String getAllCustomers(String alid, String date)
	{
		String ticketNo = "", jourDate="";
		String result="";

		try
		{
			jourDate = date.substring(6) + date.substring(2,6) + date.substring(0,2) ;

			String query = "select cid,ticketprefix,ticketsuffix,nationality from customer where alid = '" + alid + "' and fdate = '" + jourDate + "'";
			ResultSet rs = stmt.executeQuery(query);
			String query1 = "select firstname,lastname from person where pid = ";

			while(rs.next())
			{
				ticketNo = rs.getString("ticketprefix") + rs.getString("ticketsuffix");
				result += (rs.getString("cid")+"$");
				Statement stmt1 = con.createStatement();
				ResultSet rs1 = stmt1.executeQuery(query1+Integer.parseInt(rs.getString("cid")));
				if(rs1.next())
				{
					result += (rs1.getString("firstname")+"$"+rs1.getString("lastname")+"$"+ticketNo+"$"+rs.getString("nationality")+"$");
				}
			}
			
			if(!result.equals(""))
				result = result.substring(0,  result.length()-1);
			
			return result;
			
		} catch(Exception e){System.out.println("Error from getAllCustomers()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}
	
	public String getCustomerById(String cid)
	{
		String result = null;
		Customer customer = new Customer();
		customer = getCustomer(cid);
		String query = "select * from person where pid=" + cid;
		result = cid+"$";
		try
		{
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next())
			{
				result += (rs.getString("firstname")+"$"+ rs.getString("lastname")+"$"+ rs.getString("address")+"$"+rs.getString("city")+"$"+rs.getString("phone")+"$"+rs.getString("email")+"$"+rs.getString("state")+"$"+rs.getString("zip")+"$"+rs.getString("dob"));
			}
			else
			{
				return null;
			}
			
			result+=("$"+customer.getNationality()+"$"+customer.getPassport());
			
			return result;
			
		}catch(Exception e){System.out.println("Error from getCustomerById()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}
	
	
	public String getCompleterCustomerDetails(String cid)
	{
		String result = "";
		
		if(getCustomerById(cid) != null && getCustTravelInfo(cid) != "")
		{
			System.out.println(getCustomerById(cid) + "|" + getCustTravelInfo(cid));
				return result+=(getCustomerById(cid) + "|" + getCustTravelInfo(cid));
		}

		return null;
	}
		
	public String getCustTravelInfo(String cid)
	{		
		String result = "";
		String query = "select fdate,alid,aircraft,ticketprefix,ticketsuffix from customer where cid=" + cid;
		ArrayList<String> alidDateInfo = new ArrayList<String>();
		try
		{
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next())
			{
				alidDateInfo.add(rs.getString("alid"));
				alidDateInfo.add(rs.getString("fdate"));
				alidDateInfo.add(rs.getString("aircraft"));
				alidDateInfo.add(rs.getString("ticketprefix")+rs.getString("ticketsuffix"));
			}
		    PreparedStatement prepstmt = null;
			prepstmt = con.prepareStatement("select * from flight where alid = ? and deptdate = ? and aircraft= ?");
			ResultSet rs1 = null;
			for(int i=0; i<alidDateInfo.size();i=i+4)
			{
				prepstmt.setString(1, alidDateInfo.get(i));
				prepstmt.setString(2, alidDateInfo.get(i+1));
				prepstmt.setString(3, alidDateInfo.get(i+2));
				rs1 = prepstmt.executeQuery();
				while(rs1.next())
				{
					result+=(rs1.getString("source")+"$"+rs1.getString("destination")+"$"+rs1.getString("deptdate")+"$"+rs1.getString("arrvdate")
							+"$"+rs1.getString("status")+"$");
				}
			}

			if(!result.equals(""))
				result= result.substring(0, result.length()-1);
			
			return result; 
		}catch(Exception e){System.out.println("Error from getCompleterCustomerDetails()::: " + e);}
		finally{pool.freeCon(con);}
		return null;

	}
	
	public Person getPersonCustomer(String cid)
	{
		try
		{
			ResultSet rs = stmt.executeQuery("select * from person where pid =" +Integer.parseInt(cid));
			if(rs.next())
			{
				Person person = new Person();
				person.setPid(cid);
				person.setFirstname(rs.getString("firstname"));
				person.setLastname(rs.getString("lastname"));
				person.setAddress(rs.getString("address"));
				person.setCity(rs.getString("city"));
				person.setPhone(rs.getString("phone"));
				person.setEmail(rs.getString("email"));
				person.setState(rs.getString("state"));
				person.setZip(rs.getString("zip"));
				person.setDob(rs.getString("dob"));
				person.setSsn(rs.getString("ssn"));
				return person;
			}
			else
				return null;
		} catch(Exception e){System.out.println("Error from getPersonCustomer()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}
	
	public boolean validateCustomerTicket(String tid, String date)
	{
		String jourDate = date.substring(6) + date.substring(2,6) + date.substring(0,2) ;
		String query = "select status from customer where ticketprefix='" + tid.substring(0,2) +"' and ticketsuffix='" + tid.substring(2)+"' and " +
				"fdate ='"+jourDate+"'";
		try
		{
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next())
			{
				return true;
			}
			else
				return false;
		}catch(Exception e){System.out.println("Error from validateCustomerTicket()::: " + e);}
		finally{pool.freeCon(con);}
		return false;
	}
	
	
	public String getActiveReservation(String tid, String date)
	{
		String jourDate="";	
		jourDate = date.substring(6) + date.substring(2,6) + date.substring(0,2) ;
				
		if(!validateCustomerTicket(tid, date))
			return null;

		String query = "select fdate,alid from customer where ticketprefix='" + tid.substring(0,2) +"' and ticketsuffix='" + tid.substring(2)+"' and" +
				" fdate='"+ jourDate +"'";
		try
		{
			String alid = "", fdate="",source="",destination="";
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next())
			{
				alid = rs.getString("alid");
				fdate = rs.getString("fdate");
			}
			
			ResultSet rs1 = stmt.executeQuery("select source,destination from flight where alid ='"+alid+"' and deptdate = '"+fdate+"'");
			if(rs1.next())
			{
				source = rs1.getString("source");
				destination = rs1.getString("destination");
			}

			String result = getFlightsForMoodification(alid, source, destination);
			
			return result;
			
		}catch(Exception e){System.out.println("Error from getCompleterCustomerDetails()::: " + e);}
		finally{pool.freeCon(con);}
		return null;

	}
	
	public String getFlightsForMoodification(String alid, String source, String destination)
	{
		try
		{
			// and fdate > CURDATE()
			ResultSet rs = stmt.executeQuery("select * from flight where alid = '" + alid + "' and source like '%" + source + "%' and destination like '%" + destination + "%' and fdate > CURDATE();");
			String result = "";
			while(rs.next())
			{
				result += (rs.getString("aircraft") + "$" + rs.getString("deptdate") + "$" + rs.getString("arrvdate") + "$" + rs.getString("deptime") +
						"$" + rs.getString("arrvtime") + "$" + rs.getString("source") + "$" + rs.getString("destination") + "$" + rs.getString("status") + "|");
				
			}
			
			if(!result.equals(""))
				result = result.substring(0,result.length()-1);
			
			return result;
		} catch(Exception e){System.out.println("Error from getFlightsForMoodification()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}
	
	public String modifyReservation(String ticketNumber, String radioString, String date)
	{
		String jourDate="";
		PreparedStatement prepstmt = null;		
		String[] vals = radioString.split("\\$");
		jourDate = date.substring(6) + date.substring(2,6) + date.substring(0,2) ;
		
		try
		{
			prepstmt = con.prepareStatement("Update customer set fdate=?, aircraft=? where ticketprefix=? and ticketsuffix=? and fdate=?");
			prepstmt.setString(1, vals[1]);
			prepstmt.setString(2, vals[0]);
			prepstmt.setString(3, ticketNumber.substring(0,2));
			prepstmt.setString(4, ticketNumber.substring(2));
			prepstmt.setString(5, jourDate);
			
			int flag = prepstmt.executeUpdate();
			if(flag>0)
			{
				return viewTicket(ticketNumber, date);
			}
			else
				return null;
			
		} catch(Exception e){System.out.println("Error from modifyReservation()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}
	
	
	
	public String cancelReservation(String ticketNumber, String status, String date)
	{
		
		String jourDate="";
		jourDate = date.substring(6) + date.substring(2,6) + date.substring(0,2) ;
		
		PreparedStatement prepstmt = null;		
		
		if(!validateCustomerTicket(ticketNumber,date))
			return null;
		
		try
		{
			prepstmt = con.prepareStatement("Update customer set status=? where ticketprefix=? and ticketsuffix=? and fdate=?");
			prepstmt.setString(1, status);
			prepstmt.setString(2, ticketNumber.substring(0,2));
			prepstmt.setString(3, ticketNumber.substring(2));
			prepstmt.setString(4, jourDate);
			
			int flag = prepstmt.executeUpdate();

			if(flag>0)
			{
				return viewTicket(ticketNumber,date);
			}
			else
				return null;
			
		} catch(Exception e){System.out.println("Error from modifyReservation()::: " + e);}
		finally{pool.freeCon(con);}
		return null;
	}
	
	//**********************************Aditya***********************************
	
		public String updateEmployeeDetails(String sid, DisplayStaff p) {

			String result = "false";

			try {
				int rs = stmt
						.executeUpdate("update person p inner join staff s on p.pid = s.sid set p.firstname='"
								+ p.getFirstname()
								+ "', p.lastname='"
								+ p.getLastname()
								+ "', p.address='"
								+ p.getAddress()
								+ "' , p.city='"
								+ p.getCity()
								+ "', p.phone='"
								+ p.getPhone()
								+ "',p.email='"
								+ p.getEmail()
								+ "',p.state='"
								+ p.getState()
								+ "',p.zip='"
								+ p.getZip()
								+ "',p.dob='"
								+ p.getDob()
								+ "',s.alid='"
								+ p.getAlid()
								+ "',s.hiredate='"
								+ p.getHiredate()
								+"' ,s.position='"
								+ p.getPosition()
								+"' ,s.status='"
								+ p.getStatus()
								+"' where s.sid='" + sid + "';");
				if (rs != 0) {
					return "true";
				} else
					return "false";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Error from : updateEmployee()" + e);

			} finally {
				pool.freeCon(con);
			}

			return result;
		}	

		
		public DisplayStaff[] searchEmployees(String name, String airline) {
			try {
				ResultSet rt = stmt
						.executeQuery("select distinct s.sid,p.firstname,p.lastname,s.hiredate,p.dob,a.name,p.address,p.city,p.email,p.state,p.zip,p.phone from staff s inner join person p on  p.pid = s.sid inner join airlines a on a.alid = s.alid  where p.firstname='"
								+ name + "' and a.name='" + airline + "' and s.status='active' ;");
				
				ResultSet rs = stmt
						.executeQuery("select distinct s.sid,p.firstname,p.lastname,s.hiredate,p.dob,a.name,p.address,p.city,p.email,p.state,p.zip,p.phone,s.alid,s.status,s.position from staff s inner join person p on  p.pid = s.sid inner join airlines a on a.alid = s.alid  where p.firstname like '%"
								+ name + "%' and a.name like '%" + airline + "%' and s.status='active' ;");
				ArrayList<DisplayStaff> displayStaff = new ArrayList<DisplayStaff>();
				while (rs.next()) {

					DisplayStaff staff = new DisplayStaff();
					staff.setSid(rs.getString("s.sid"));
					staff.setFirstname(rs.getString("p.firstname"));
					staff.setLastname(rs.getString("p.lastname"));
					staff.setHiredate(rs.getString("s.hiredate"));
					staff.setDob(rs.getString("p.dob"));
					staff.setAirline(rs.getString("a.name"));
					staff.setAddress(rs.getString("p.address"));
					staff.setCity(rs.getString("p.city"));
					staff.setEmail(rs.getString("p.email"));
					staff.setPhone(rs.getString("p.phone"));
					staff.setState(rs.getString("p.state"));
					staff.setZip(rs.getString("p.zip"));
					staff.setAlid(rs.getString("s.alid"));
					staff.setStatus(rs.getString("s.status"));
					staff.setPosition(rs.getString("s.position"));
					displayStaff.add(staff);
				}

				DisplayStaff[] staffs = new DisplayStaff[displayStaff.size()];
				for (int i = 0; i < displayStaff.size(); i++)
					staffs[i] = displayStaff.get(i);

				return staffs;
			} catch (Exception e) {
				System.out.println("Error from searchEmployees()::: " + e);
			} finally {
				pool.freeCon(con);
			}
			return null;
		}

		
		public String delEmp(String sid){
			try {
				int rs= stmt.executeUpdate("update staff set status = 'Inactive' where sid= '"+sid +"'");
				if (rs != 0)
				{
					return "delete";
				}
				else
					return "nodelete";
			} catch (Exception e) {
				System.out.println("Error from searchDisplayStaff()::: " + e);
			}
			finally {
				pool.freeCon(con);
			}
			
			return null;
			
		}

		//**************************************************************

		//******************************Sahilesh**********************************************
		
		public String createStaff(Staff staff) {
			try {
				int rs = stmt
						.executeUpdate("insert into staff (sid,alid,position,hiredate,status) values('"
								+ staff.getSid()
								+ "','"
								+ staff.getAlid()
								+ "','"
								+ staff.getPosition()
								+ "','"
								+ staff.getHiredate()
								+ "','" + staff.getStatus() + "')");
				if (rs != 0) {
					return "update";

				} else
					return null;
			} catch (Exception e) {
				System.out.println("Error from createStaff()::: " + e);
			} finally {
				pool.freeCon(con);
			}
			return null;

		}
		

	public String register(String firstname, String ssn) {
			try {
				String id= "";
				ResultSet rs = stmt.executeQuery("select pid from person where firstname= '" + firstname + "' and ssn = '" + ssn + "'");
				if (rs.next())
				{
					id = rs.getString("pid");
					ResultSet rs1 = stmt.executeQuery("select sid from staff where sid = '" + rs.getString("pid") + "'");
					if (rs1.next())
						return "present"+","+id;
					else
						
						return "notInStaff"+","+id;
				} 
				else
				{
					id="000000000";
					return "notInPerson"+","+id;
				}
			} catch (Exception e) {
				System.out.println("Some error in registration" + e);
			} finally {
				pool.freeCon(con);
			}
			return null;

		}
	
	public boolean updateFlightDetails(String halid, String haircraft, String hdeptdate, Flight f) {
		PreparedStatement prepstmt = null;
		try
		{
			prepstmt = con.prepareStatement("Update flight set aircraft=?, deptdate=?, deptime=?, arrvdate=?, arrvtime=?, source=?, destination=?, status=?" +
					" where alid=? and aircraft=? and deptdate=?");
			prepstmt.setString(1, f.getAircraft());
			prepstmt.setString(2, f.getDeptdate().substring(6) + f.getDeptdate().substring(2,6)+ f.getDeptdate().substring(0,2));
			prepstmt.setString(3, f.getDepttime());
			prepstmt.setString(4, f.getArrvdate().substring(6) + f.getArrvdate().substring(2,6)+ f.getArrvdate().substring(0,2));
			prepstmt.setString(5, f.getArrvtime());
			prepstmt.setString(6, f.getSource());
			prepstmt.setString(7, f.getDestination());
			prepstmt.setString(8, f.getStatus());
			prepstmt.setString(9, halid);
			prepstmt.setString(10, haircraft);
			prepstmt.setString(11, hdeptdate);
			int flag = prepstmt.executeUpdate();

			if(flag>0)
				return true;
			else
				return false;
		} catch(Exception e){System.out.println("Error from updateFlightDetails()::: " + e);}
		finally{pool.freeCon(con);}
		return false;
	}
	
		
		//**********************************************************************
	
}

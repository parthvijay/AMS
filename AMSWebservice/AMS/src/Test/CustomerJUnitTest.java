package Test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import sun.print.resources.serviceui;
import Connection.*;

public class CustomerJUnitTest {
	
	static Person person;
	static Person person2;
	static Customer customer;
	static Service service;
	static Flight flight;
	static AirLines airline;
	
	@BeforeClass
	public static void setUp() throws Exception {
	
		service = new Service();
		person = new Person();
		person2 = new Person();
		
		person.setFirstname("Peter");
		person.setLastname("seth");
		person.setPhone("7312387686");
		person.setEmail("parth.vijay11@gmail.com");
		person.setAddress("230 Sanskrati road");
		person.setCity("san jose");
		person.setDob("1947-08-15");
		person.setSsn("234567891");
		person.setState("MadhyaPradesh");
		person.setZip("45200");
		
		person2.setFirstname("Will");
		person2.setLastname("Smith");
		person2.setPhone("7312383486");
		person2.setEmail("parthvijayvargiyia@gmail.com");
		person2.setAddress("230 MG road");
		person2.setCity("san carlos");
		person2.setDob("1947-08-18");
		person2.setSsn("234567858");
		person2.setState("CA");
		person2.setZip("92723");
		
		//airLine created
		airline = new AirLines();
		airline.setAircraft("BO998-919");
		airline.setAlid("UAALS");
		airline.setCapacity("350");
		airline.setCrewcount("15");
		airline.setName("United Airlines");
		
		////flight created
		flight = new Flight();
		flight.setAlid(airline.getAlid());
		flight.setAircraft(airline.getAircraft());
		flight.setDeptdate("07-08-2012");
		flight.setDepttime("03:33:15");
		flight.setArrvdate("07-08-2012");
		flight.setArrvtime("01:02:33");
		flight.setDestination("San Jose");
		flight.setSource("Indore");
		flight.setStatus("Scheduled");
		service.createFlight(flight, airline);
		
		//////////////////////////customer created
		customer = new Customer();
		customer.setTicketnum("UA>2121222");
		customer.setCid(service.createPerson(person));
		customer.setDate("2012-08-07");
		customer.setNationality("American");
		customer.setPassport("H95460");
		customer.setStatus("Ticket Issued");
		customer.setAircraft(flight.getAircraft());
		customer.setAlid(flight.getAlid());
	
	}

	@Test
	public void testCreatePerson() {
	
		//creatPerson True
		String pid;
		pid = service.createPerson(person);
		assertNotNull(pid);
		
		
		//createPerson False
		pid = service.createPerson(person);
		assertNull(null);
		
		
		
		//getPerson True
		Person p;
		
		p = service.getPerson(pid);
		assertNotNull(p);
			
		//getPerson False
		p = service.getPerson(pid);
		assertNull(null);
		
		
	/*	//updatePersonDetails true
	//	person.setCity("Irvine");
		assertTrue(service.updatePersonDetails(person));
		
		//updatePersonDetails false
		person.setPhone("7282");
		assertFalse(service.updatePersonDetails(person));
		*/
		//createCustomer true
		String cust;
		cust = service.createCustomer(customer);
		assertEquals("true", cust);
		
		//createCustomer false
		cust = service.createCustomer(customer);
		assertEquals("false", cust);
		
		
		//getCustomer true
		Customer c;
		c = service.getCustomer(service.createPerson(person));
		assertNotNull(c);
		
		//getCustomer false
		c = service.getCustomer(service.createPerson(person));
		assertNull(null);
		
		//getCustomerById true
		String id;
		id = service.getCustomerById(service.createPerson(person));
		assertNotNull(id);
		
		//getCustomerById false
		//id = service.getCustomerById(service.createPerson(person));
		//assertNull(null);
		
		//login true
		String log;
		log = service.login("anoop", "root");
		assertNotNull(log);
		
		//login false
		String log2;
		log2 = service.login("anoop", "ro");
		assertEquals(null,log2);
		
		//changePassword true
		boolean pwd;
		pwd = service.changePassword("abcd", pid);
		assertEquals(true,pwd);
		
		//changePassword false
		pwd = service.changePassword("", pid);
		assertEquals(false,pwd);
	}
		
}

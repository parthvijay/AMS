package Test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import Connection.*;

public class LoginJUnitTest {
	
	static Person person;
	static Service service;
	
	@Before
	public void setUp() throws Exception {
		
		service = new Service();
		person = new Person();
		
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
		
		service.createPerson(person);
		
		
	}

	@Test
	public void test() {
		
		
	}

}

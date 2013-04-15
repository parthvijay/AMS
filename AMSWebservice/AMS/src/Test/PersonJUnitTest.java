package Test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import Connection.*
;

public class PersonJUnitTest {

	static Person person;
	static Service service;
	
	@BeforeClass
	public static void setUp() throws Exception {
		
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
		person.setZip("95112");
	}

	@Test
	public void createPersonNotTrue() {
		
		assertNotNull(service.createPerson(person));
	}

}

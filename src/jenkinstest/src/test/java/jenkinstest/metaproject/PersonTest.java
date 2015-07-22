package jenkinstest.metaproject;

import static org.junit.Assert.assertTrue;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PersonTest {
	
	private Person p1 = new Person("Max", "Mustermann", 18);
	
	@Test
	public void testFirstName() {
		assertTrue("Wrong firstname!", p1.getFirstName() != null);
	}
	
	@Test
	public void testSurName() {
		assertTrue("Wrong surname!", p1.getSurName() != null);
	}
	
	@Test
	public void testAge() {
		assertTrue("Wrong age!", p1.getAge() != null);
	}

}

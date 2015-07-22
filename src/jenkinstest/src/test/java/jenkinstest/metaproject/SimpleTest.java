package jenkinstest.metaproject;

import static org.junit.Assert.assertTrue;

import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class SimpleTest {
	
	@Test
	public void testSmth() {
		assertTrue("Wrong Assertion", true);
	}
}

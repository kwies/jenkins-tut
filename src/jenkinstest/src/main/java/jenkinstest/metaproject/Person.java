package jenkinstest.metaproject;

public class Person {
	
	private String firstName_;
	private String surName_;
	private Integer age_;
	
	public Person(String firstName, String SurName, Integer age) {
		firstName_ = firstName;
		surName_ = SurName;
		age_ = age;
	}
	
	public String getFirstName() {
		return firstName_;
	}
	
	public void setFirstName(String firstName_) {
		this.firstName_ = firstName_;
	}
	
	public String getSurName() {
		return surName_;
	}
	
	public void setSurName(String surName) {
		this.surName_ = surName;
	}

	public Integer getAge() {
		return age_;
	}

	public void setAge(Integer age) {
		this.age_ = age;
	}
}

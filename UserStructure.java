package bank;

public class UserStructure {
	private String name, password, id, designation, contact, address;
	private String userName, userEmail, userComments;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserComments() {
		return userComments;
	}

	public void setUserComments(String userComment) {
		this.userComments = userComment;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public String getId() {

		return id;
	}

	public String getDesignation() {
		return designation;
	}

	public String getContact() {
		return contact;
	}

	public String getAddress() {
		return address;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}

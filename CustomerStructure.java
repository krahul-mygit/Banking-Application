package bank;

public class CustomerStructure {
	private String customerAccountNumber, name, email, password, userid, contact, address;
	private String balance;
	private String ttype, tamount, tdate, taccountnumber, description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTtype() {
		return ttype;
	}

	public void setTtype(String ttype) {
		this.ttype = ttype;
	}

	public String getTamount() {
		return tamount;
	}

	public void setTamount(String tamount) {
		this.tamount = tamount;
	}

	public String getTdate() {
		return tdate;
	}

	public void setTdate(String tdate) {
		this.tdate = tdate;
	}

	public String getTaccountnumber() {
		return taccountnumber;
	}

	public void setTaccountnumber(String taccountnumber) {
		this.taccountnumber = taccountnumber;
	}

	public String getCustomerAccountNumber() {
		return customerAccountNumber;
	}

	public void setCustomerAccountNumber(String customerAccountNumber) {
		this.customerAccountNumber = customerAccountNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String username) {
		this.userid = username;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String amount) {
		this.balance = amount;
	}

}

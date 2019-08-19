package bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class Customer {
	public static ArrayList<CustomerStructure> search(String acnum, String name, String userid) {
		Connection con = null;
		ArrayList<CustomerStructure> al = new ArrayList<CustomerStructure>();
		try {
			con = User.getConnection();
			String s1 = "select * from bankCustomer where customerAccountNumber=?";
			String s2 = "select * from bankCustomer where customerUserId=?";
			String s3 = "select * from bankCustomer where lower(customerName) like lower(?)";
			if (!name.isEmpty()) {
				PreparedStatement pre = con.prepareStatement(s3);
				pre.setString(1, "%" + name + "%");
				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					CustomerStructure cso = new CustomerStructure();
					cso.setCustomerAccountNumber(rs.getString("customerAccountNumber"));
					cso.setName(rs.getString("customerName"));
					cso.setEmail(rs.getString("customerEmail"));
					cso.setPassword(rs.getString("customerPassword"));
					cso.setUserid(rs.getString("customerUserId"));
					cso.setAddress(rs.getString("customerAddress"));
					cso.setBalance(rs.getString("customerBalance"));
					cso.setContact(rs.getString("customerContact"));
					al.add(cso);
				}
			} else if (!acnum.isEmpty()) {
				PreparedStatement pre = con.prepareStatement(s1);
				pre.setString(1, acnum);
				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					CustomerStructure cso = new CustomerStructure();
					cso.setCustomerAccountNumber(rs.getString("customerAccountNumber"));
					cso.setName(rs.getString("customerName"));
					cso.setEmail(rs.getString("customerEmail"));
					cso.setPassword(rs.getString("customerPassword"));
					cso.setUserid(rs.getString("customerUserId"));
					cso.setAddress(rs.getString("customerAddress"));
					cso.setBalance(rs.getString("customerBalance"));
					cso.setContact(rs.getString("customerContact"));
					al.add(cso);
				}
			} else {
				PreparedStatement pre = con.prepareStatement(s2);
				pre.setString(1, userid);
				ResultSet rs = pre.executeQuery();
				while (rs.next()) {
					CustomerStructure cso = new CustomerStructure();
					cso.setCustomerAccountNumber(rs.getString("customerAccountNumber"));
					cso.setName(rs.getString("customerName"));
					cso.setEmail(rs.getString("customerEmail"));
					cso.setPassword(rs.getString("customerPassword"));
					cso.setUserid(rs.getString("customerUserId"));
					cso.setAddress(rs.getString("customerAddress"));
					cso.setBalance(rs.getString("customerBalance"));
					cso.setContact(rs.getString("customerContact"));
					al.add(cso);
				}
			}

		} catch (Exception e) {
			System.out.println("Search exception is:" + e);

		} finally {
			try {
				con.close();
			} catch (Exception e) {
				System.out.println("Closing connection in search exception is:" + e);
			}
		}
		return al;
	}

	public static int transfer(CustomerStructure cso, String to_account_number, String from_account_number,
			String amount) {
		int status = 0, status1 = 0, status2 = 0;
		Connection con = null;
		boolean from_account = false;
		boolean to_account = false;
		String sender_customer_old_balance = "";
		String sender_customer_new_balance = "";
		String to_customer_old_balance = "";
		String to_customer_new_balance = "";
		try {
			System.out.println(to_account_number);
			con = User.getConnection();
			PreparedStatement pre = con.prepareStatement("select customerAccountNumber from bankCustomer");
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				if (from_account_number.equals(rs.getString("customerAccountNumber"))) {
					from_account = true;
					break;
				}
			}
			rs.first();
			PreparedStatement pret = con.prepareStatement("select customerAccountNumber from bankCustomer");
			ResultSet rst = pret.executeQuery();

			while (rst.next()) {
				if (to_account_number.equals(rst.getString("customerAccountNumber"))) {
					to_account = true;
					break;
				}
			}

			if (from_account && to_account) {
				PreparedStatement pre1 = con
						.prepareStatement("select customerBalance from bankCustomer where customerAccountNumber=?");
				pre1.setString(1, from_account_number);
				// System.out.println("hello");
				ResultSet rs1 = pre1.executeQuery();
				while (rs1.next()) {
					sender_customer_old_balance = rs1.getString("customerBalance");
					// System.out.println(sender_customer_old_balance);
				}
				// System.out.println(sender_customer_old_balance);
				// System.out.println("helo");
				double scob = 0;
				double Amount = 0;
				try {
					scob = Double.parseDouble(sender_customer_old_balance);
					Amount = Double.parseDouble(amount);
				} catch (Exception e) {
					System.out.println(e);
				}
				// System.out.println("hello");
				if (scob < Amount) {
					return -1;
				}
				// System.out.println("debug");
				double sender_new_balance = scob - Amount;
				sender_customer_new_balance = String.valueOf(sender_new_balance);
				PreparedStatement pre2 = con
						.prepareStatement("update bankCustomer set customerBalance=? where customerAccountNumber=?");
				pre2.setString(1, sender_customer_new_balance);
				pre2.setString(2, from_account_number);
				status1 = pre2.executeUpdate();
				PreparedStatement prett = con.prepareStatement(
						"insert into customerTransitions(transitionType,transitionAmount,transitionDate,customerAccountNumber,description) values(?,?,?,?,?)");
				prett.setString(1, "DEBIT");
				prett.setString(2, String.valueOf(Amount));
				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				Date date = new Date();
				prett.setString(3, format.format(date));
				prett.setString(4, from_account_number);
				// System.out.println("Haa");
				prett.setString(5, "TRANSFERRED TO-" + to_account_number);
				// System.out.println("Haa");
				prett.executeUpdate();
				// --------------------
				PreparedStatement pre3 = con
						.prepareStatement("select customerBalance from bankCustomer where customerAccountNumber=?");
				pre3.setString(1, to_account_number);
				ResultSet rs2 = pre3.executeQuery();

				while (rs2.next()) {
					to_customer_old_balance = rs2.getString("customerBalance");
				}

				double tcob = Double.parseDouble(to_customer_old_balance);
				double to_new_balance = tcob + Amount;
				to_customer_new_balance = String.valueOf(to_new_balance);
				PreparedStatement pre4 = con
						.prepareStatement("update bankCustomer set customerBalance=? where customerAccountNumber=?");
				pre4.setString(1, to_customer_new_balance);
				pre4.setString(2, to_account_number);
				status2 = pre4.executeUpdate();
				PreparedStatement pretc = con.prepareStatement(
						"insert into customerTransitions(transitionType,transitionAmount,transitionDate,customerAccountNumber,description) values(?,?,?,?,?)");
				pretc.setString(1, "CREDIT");
				pretc.setString(2, String.valueOf(Amount));
				format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				date = new Date();
				pretc.setString(3, format.format(date));
				pretc.setString(4, to_account_number);
				pretc.setString(5, "TRANSFERRED FROM-" + from_account_number);
				pretc.executeUpdate();
				if (status1 > 0 && status2 > 0) {
					status = 1;
					return status;
				} else {
					status = -1;
					return status;
				}
			} else {
				status = -1;
				return status;
			}

		} catch (Exception e) {
			System.out.println("Transfer exception is:" + e);
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				System.out.println("close connection is transfer is: " + e);
			}
		}
		return status;
	}

	public static long generateRandomNumber() {
		long randomNumber;
		Random ro = new Random();
		randomNumber = ro.nextInt(99999);
		return randomNumber;
	}

	public static boolean isUseridExist(String rand) {
		boolean exist = false;
		try {
			Connection con = User.getConnection();
			PreparedStatement pre = con.prepareStatement("select customerUserId from bankCustomer");
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				if (rs.getString("customerUserId").equals(rand)) {
					exist = true;
					break;
				}
			}

		} catch (Exception e) {
			System.out.println("isUserIdExist Exception is: " + e);
		}
		return exist;
	}

	public static List<CustomerStructure> getCustomers() {

		Connection con = null;
		ArrayList<CustomerStructure> al = new ArrayList<CustomerStructure>();
		try {
			con = User.getConnection();
			PreparedStatement pre = con.prepareStatement("select * from bankCustomer");
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				CustomerStructure cso = new CustomerStructure();
				cso.setCustomerAccountNumber(rs.getString("customerAccountNumber"));
				cso.setName(rs.getString("customerName"));
				cso.setEmail(rs.getString("customerEmail"));
				cso.setPassword(rs.getString("customerPassword"));
				cso.setUserid(rs.getString("customerUserId"));
				cso.setAddress(rs.getString("customerAddress"));
				cso.setBalance(rs.getString("customerBalance"));
				cso.setContact(rs.getString("customerContact"));
				al.add(cso);
			}
		} catch (Exception e) {
			System.out.println("Withdraw exception is:" + e);
		}
		return al;
	}

	public static int withdraw(CustomerStructure cso) {
		int status = 0;
		Connection con = null;
		boolean isaccountfound = false;
		try {
			con = User.getConnection();
			PreparedStatement pre = con.prepareStatement("select customerAccountNumber from bankCustomer");
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				if (cso.getCustomerAccountNumber().equals(rs.getString("customerAccountNumber"))) {
					isaccountfound = true;
					break;
				}
			}
			// System.out.println(isaccountfound);
			if (isaccountfound) {
				PreparedStatement pre1 = con
						.prepareStatement("select customerBalance from bankCustomer where customerAccountNumber=?");
				pre1.setString(1, cso.getCustomerAccountNumber());
				ResultSet rs1 = pre1.executeQuery();

				double actualbalance = 0.00;
				while (rs1.next()) {
					actualbalance = Double.parseDouble(rs1.getString("customerBalance"));
				}
				double balance = Double.parseDouble(cso.getBalance());
				if (actualbalance < balance) {
					status = -1;
					return status;
				} else {
					PreparedStatement pret = con.prepareStatement(
							"insert into customerTransitions(transitionType,transitionAmount,transitionDate,customerAccountNumber,description) values(?,?,?,?,?)");
					pret.setString(1, "DEBIT");
					pret.setString(2, String.valueOf(balance));
					SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
					Date date = new Date();
					pret.setString(3, format.format(date));
					pret.setString(4, cso.getCustomerAccountNumber());
					pret.setString(5, "--");
					pret.executeUpdate();
					pre = con.prepareStatement(
							"update bankCustomer set customerBalance=? where customerAccountNumber=?");
					double net = actualbalance - balance;
					String newbalance = String.valueOf(net);
					pre.setString(1, newbalance);
					pre.setString(2, cso.getCustomerAccountNumber());
					status = pre.executeUpdate();
					return status;
				}
			} else {
				status = -1;
				return status;
			}

		} catch (Exception e) {
			System.out.println("Withdraw Exception is:" + e);
		}
		return status;
	}

	public static List<CustomerStructure> getCustomerTransitions(String accountNumber) {
		ArrayList<CustomerStructure> al = new ArrayList<CustomerStructure>();
		Connection con = null;
		try {
			con = User.getConnection();

			PreparedStatement pre = con.prepareStatement(
					"select transitionType,transitionAmount,transitionDate,description from customerTransitions where customerAccountNumber=?");
			pre.setString(1, accountNumber);
			ResultSet rs = pre.executeQuery();

			while (rs.next()) {
				CustomerStructure cso = new CustomerStructure();
				cso.setTtype(rs.getString("transitionType"));
				cso.setTamount(rs.getString("transitionAmount"));
				cso.setTdate(rs.getString("transitionDate"));
				cso.setDescription(rs.getString("description"));
				al.add(cso);

			}
		} catch (Exception e) {
			System.out.println("getCustomerTransitons exception is: " + e);
		}
		return al;
	}

	public static int deposit(CustomerStructure cso) {
		int status = 0;
		Connection con = null;
		boolean acfound = false;

		try {
			con = User.getConnection();
			PreparedStatement pre = con
					.prepareStatement("select customerAccountNumber,customerBalance from bankCustomer");
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				if (rs.getString("customerAccountNumber").equals(cso.getCustomerAccountNumber())) {
					acfound = true;
					break;
				}
			}

			String currentbalance = rs.getString("customerBalance");
			String newbalance = cso.getBalance();
			System.out.println("hey");
			double current_balance = (Double.parseDouble(currentbalance));
			double new_balance = (Double.parseDouble(newbalance));
			double total = current_balance + new_balance;
			String s = String.valueOf(total);
			cso.setBalance(s);
			if (acfound) {
				PreparedStatement pret = con.prepareStatement(
						"insert into customerTransitions(transitionType,transitionAmount,transitionDate,customerAccountNumber,description) values(?,?,?,?,?)");
				pret.setString(1, "CREDIT");
				pret.setString(2, String.valueOf(new_balance));
				SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
				Date date = new Date();
				pret.setString(3, format.format(date));
				pret.setString(4, cso.getCustomerAccountNumber());
				pret.setString(5, "--");
				pret.executeUpdate();
				pre = con.prepareStatement("update bankCustomer set customerBalance=? where customerAccountNumber=?");
				pre.setString(1, cso.getBalance());
				pre.setString(2, cso.getCustomerAccountNumber());
				status = pre.executeUpdate();
			} else {
				status = -1;
				return status;
			}
		} catch (Exception e) {
			System.out.println("Deposit exception is:" + e);
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				System.out.println("Closing connection is deposit exception is:" + e);
			}
		}
		return status;
	}

	public static int insert(CustomerStructure cso) {
		int status = 0;
		Connection con = null;
		try {
			con = User.getConnection();
			PreparedStatement pre = con.prepareStatement(
					"insert into bankCustomer(customerAccountNumber,customerName,customerEmail,customerUserId,customerPassword,customerContact,customerAddress,customerBalance) values(?,?,?,?,?,?,?,?)");
			pre.setString(1, cso.getCustomerAccountNumber());
			pre.setString(2, cso.getName());
			pre.setString(3, cso.getEmail());
			pre.setString(4, cso.getUserid());
			pre.setString(5, cso.getPassword());
			pre.setString(6, cso.getContact());
			pre.setString(7, cso.getAddress());
			pre.setString(8, cso.getBalance());
			status = pre.executeUpdate();
		} catch (Exception e) {
			System.out.println("Customer(insert) exception is: " + e);
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("Customer(insert)exception:" + e);
			}
		}
		return status;
	}
}

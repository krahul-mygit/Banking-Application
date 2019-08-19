package bank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

public class User {
	public static long generateRand() {
		Random ro = new Random();
		long rand = ro.nextInt(999000000) + 1000000;

		return rand;
	}

	public static ArrayList<UserStructure> getQueries() {
		// int status = 0;
		ArrayList<UserStructure> al = new ArrayList<UserStructure>();
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement pre = con.prepareStatement("select * from userQueries");
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				UserStructure uso = new UserStructure();
				uso.setUserName(rs.getString("userName"));
				uso.setUserEmail(rs.getString("userEmail"));
				uso.setUserComments(rs.getString("userComment"));
				al.add(uso);
			}
			pre.executeUpdate();

		} catch (Exception e) {
			System.out.println("getQueries exception is: " + e);
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				System.out.println("closing userQuery exception is: " + e);

			}
		}
		return al;
	}

	public static int queries(UserStructure uso) {
		int status = 0;
		Connection con = null;
		try {
			con = getConnection();
			PreparedStatement pre = con.prepareStatement("insert into userQueries values(?,?,?)");

			pre.setString(1, uso.getUserName());
			pre.setString(2, uso.getUserEmail());
			pre.setString(3, uso.getUserComments());
			status = pre.executeUpdate();
		} catch (Exception e) {
			System.out.println("Query exception is" + e);
		} finally {
			try {
				con.close();
			} catch (Exception e) {
				System.out.println("queries closing exception is: " + e);
			}
		}
		return status;
	}

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/bankDB?characterEncoding=latin1&useConfigs=maxPerformance", "root",
					"manaKUak@7");

		} catch (Exception e) {
			System.out.println("Connection Exception is: " + e);
		}
		return con;
	}

	public static boolean findUser(UserStructure uso) {
		boolean access = false;
		try {
			Connection con = getConnection();
			PreparedStatement pre = con.prepareStatement("select * from bankUser");
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				if (rs.getString(1).equals(uso.getId()) && rs.getString(3).equals(uso.getPassword())) {
					access = true;
					break;
				}
			}
		} catch (Exception e) {
			System.out.println("findUser exception is: " + e);
		}
		return access;
	}

	public static boolean isNumberExist(String rand) {
		boolean exist = false;
		try {
			Connection con = getConnection();
			PreparedStatement pre = con.prepareStatement("select userId from bankUser ");
			ResultSet rs = pre.executeQuery();
			while (rs.next()) {
				if (rs.getString("userId") == rand) {
					exist = true;
					break;
				}
			}

		} catch (Exception e) {
			System.out.println("isNumberExist Exception is: " + e);
		}
		return exist;
	}

	public static int insert(UserStructure uso) {

		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement pre = con.prepareStatement("insert into bankUser values(?,?,?,?,?,?)");
			pre.setString(1, uso.getId());
			pre.setString(2, uso.getName());
			pre.setString(3, uso.getPassword());
			pre.setString(4, uso.getDesignation());
			pre.setString(5, uso.getContact());
			pre.setString(6, uso.getAddress());

			status = pre.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println("Exception " + e);
		}
		return status;
	}
}

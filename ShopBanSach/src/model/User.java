package model;

public class User {
	String username;
	String password;
	String email;
	String address;
	int role_id;
	String phone;
	String name;
	int id;
	public User(String username, String password, String email, String address, int role_id, String phone, String name,
			int id) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.address = address;
		this.role_id = role_id;
		this.phone = phone;
		this.name = name;
		this.id = id;
	}
	public User(String username, String password, String email, String address, int role_id, String phone, String name) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.address = address;
		this.role_id = role_id;
		this.phone = phone;
		this.name = name;
	}
	public User() {
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRole_id() {
		return role_id;
	}
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
}

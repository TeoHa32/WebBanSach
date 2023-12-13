package model;

import java.time.LocalDateTime;

public class order {
	private int id;
	private String user_id;
	private String diachinhanhang;
	private LocalDateTime order_date;
	private int confirm;
	
	private String shipping_method;

	public order(String user_id, LocalDateTime order_date, int confirm) {
		super();
		this.user_id = user_id;
		this.order_date = order_date;
		this.confirm = confirm;
	}
	
	public order( String user_id, String diachinhanhang, LocalDateTime order_date, int confirm,
			String shipping_method) {
		super();
		this.user_id = user_id;
		this.diachinhanhang = diachinhanhang;
		this.order_date = order_date;
		this.confirm = confirm;
		this.shipping_method = shipping_method;
	}

	public String getDiachinhanhang() {
		return diachinhanhang;
	}

	public void setDiachinhanhang(String diachinhanhang) {
		this.diachinhanhang = diachinhanhang;
	}

	public order( String user_id, LocalDateTime order_date, int confirm, String shipping_method) {
		super();
		this.user_id = user_id;
		this.order_date = order_date;
		this.confirm = confirm;
		this.shipping_method = shipping_method;
	}

	public order() {
		super();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public LocalDateTime getOrder_date() {
		return order_date;
	}
	public void setOrder_date(LocalDateTime order_date) {
		this.order_date = order_date;
	}
	public int getconfirm() {
		return confirm;
	}
	public void confirm(int devivery_date) {
		this.confirm = devivery_date;
	}
	public int getConfirm() {
		return confirm;
	}
	public void setConfirm(int confirm) {
		this.confirm = confirm;
	}
	
	public String getShipping_method() {
		return shipping_method;
	}
	public void setShipping_method(String shipping_method) {
		this.shipping_method = shipping_method;
	}
	
}

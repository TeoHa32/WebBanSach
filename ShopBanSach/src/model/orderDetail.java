package model;

public class orderDetail extends cartItem{
	private int id_od;
	private int order_id;
	private order od ;
	
	public orderDetail(int order_id, order od) {
		super();
		this.order_id = order_id;
		this.od = od;
	}
	public orderDetail() {
		super();
	}
	public order getOd() {
		return od;
	}
	public void setOd(order od) {
		this.od = od;
	}
	public int getId_od() {
		return id_od;
	}
	public void setId_od(int id) {
		this.id_od = id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
}

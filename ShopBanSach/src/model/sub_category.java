package model;

public class sub_category {
	String name;
	int id;
	int category_id;
	public sub_category(String name, int id, int category_id) {
		super();
		this.name = name;
		this.id = id;
		this.category_id = category_id;
	}
	public sub_category() {
		super();
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
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	
}

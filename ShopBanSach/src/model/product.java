package model;

public class product {
	int id;
	String name, author, publisher, img, description;
	double price;
	int quantity;
	double onsale;
	int category_id;
	int sub_category_id;
	
	public product() {
		super();
	}

	
	public product(String name, String author, String publisher, String img, String description, double price,
			int quantity, double onsale, int category_id, int sub_category_id) {
		super();
		this.name = name;
		this.author = author;
		this.publisher = publisher;
		this.img = img;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
		this.onsale = onsale;
		this.category_id = category_id;
		this.sub_category_id = sub_category_id;
	}
	public product(int id, String name, String author, String publisher, String img, String description, double price,
			int quantity, double onsale, int category_id, int sub_category_id) {
		super();
		this.id = id;
		this.name = name;
		this.author = author;
		this.publisher = publisher;
		this.img = img;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
		this.onsale = onsale;
		this.category_id = category_id;
		this.sub_category_id = sub_category_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getOnsale() {
		return onsale;
	}

	public void setOnsale(double onsale) {
		this.onsale = onsale;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public int getSub_category_id() {
		return sub_category_id;
	}

	public void setSub_category_id(int sub_category_id) {
		this.sub_category_id = sub_category_id;
	}

}

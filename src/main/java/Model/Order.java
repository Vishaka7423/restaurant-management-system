package Model;

public class Order {
 
	private int orderid;
    private String username;
    private String email;
    private String mobile;
    private String address;
    private String cartProducts;
    private Double TotalAmount;

    // Default constructor
    public Order() {
    	
    }
    
    public Order(int orderid, String username, String email, String mobile, String address, String cartProducts,
    		Double totalAmount) {
 		super();
 		this.orderid = orderid;
 		this.username = username;
 		this.email = email;
 		this.mobile = mobile;
 		this.address = address;
 		this.cartProducts = cartProducts;
 		TotalAmount = totalAmount;
 	}

    

	
	public Order(int orderid) {
		this.orderid = orderid;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int string) {
		this.orderid = string;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCartProducts() {
		return cartProducts;
	}

	public void setCartProducts(String cartProducts) {
		this.cartProducts = cartProducts;
	}

	public Double getTotalAmount() {
		return TotalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		TotalAmount = totalAmount;
	}
    
}
    
  
package Model;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String confirmpassword;
    private String address;
    private String mobile;

    // Default constructor
    public User() {}
    
    
    public User(int id) {
		this.id = id;
	}

    // Parameterized constructor
    public User(int id, String name, String email, String password, String address, String mobile) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
		/*
		 * this.confirmpassword = confirmpassword;
		 */        this.address = address;
        this.mobile = mobile;
    }

    // Getter and setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getname() {
        return name;
    }

    public void setname(String name) {
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

    public String getConfirmpassword() {
        return confirmpassword;
    }

    public void setConfirmpassword(String confirmpassword) {
        this.confirmpassword = confirmpassword;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}

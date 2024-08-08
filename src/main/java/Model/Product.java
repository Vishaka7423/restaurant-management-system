package Model;

public class Product{
	

	private int pid;
	private String ptitle;
	private String category;
	private Double price;
	private String pphoto;
	
	
	public Product() {
	}


	
	public Product(int pid, String ptitle, String category, Double price, String pphoto) {
		this.pid = pid;
		this.ptitle = ptitle;
		this.category = category;
		this.price = price;
		this.pphoto = pphoto;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getPtitle() {
		return ptitle;
	}


	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category	) {
		this.category = category;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}


	public String getPphoto() {
		return pphoto;
	}


	public void setPphoto(String pphoto) {
		this.pphoto = pphoto;
	}


	@Override
	public String toString() {
		return "Product [pid=" + pid + ", ptitle=" + ptitle + ", category=" + category + ", price=" + price
				+ ", pphoto=" + pphoto + "]";
	}
	
}
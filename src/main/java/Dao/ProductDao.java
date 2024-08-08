	package Dao;
	
	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.*;
	import Model.*;
	
	public class ProductDao {
		private Connection con;
		private String query;
		private PreparedStatement pst;
		private ResultSet rs;
	
		public ProductDao(Connection con) {
	
			this.con = con;
	
		}
	
		public List<Product> getNonProduct() {
			List<Product> nonproducts = new ArrayList<Product>();
	
			try {
				query = "select * from product where ctitle='nonveg'";
				pst = this.con.prepareStatement(query);
				rs = pst.executeQuery();
				while (rs.next()) {
	
					Product row = new Product();
					row.setPid(rs.getInt("pid"));
					row.setPtitle(rs.getString("ptitle"));
					row.setPrice(rs.getDouble("price"));
					row.setCategory(rs.getString("ctitle"));
					row.setPphoto(rs.getString("pphoto"));
	
					nonproducts.add(row);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return nonproducts;
	
		}
	
		public List<Product> getVegProduct() {
			List<Product> vegproducts = new ArrayList<Product>();
	
			try {
				query = "select * from product where ctitle ='veg'";
				pst = this.con.prepareStatement(query);
				rs = pst.executeQuery();
				while (rs.next()) {
	
					Product row = new Product();
					row.setPid(rs.getInt("pid"));
					row.setPtitle(rs.getString("ptitle"));
					row.setPrice(rs.getDouble("price"));
					row.setCategory(rs.getString("ctitle"));
					row.setPphoto(rs.getString("pphoto"));
	
					vegproducts.add(row);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return vegproducts;
	
		}
	
		public List<Product> getDessertProduct() {
			List<Product> desproducts = new ArrayList<Product>();
	
			try {
				query = "select * from product where ctitle='dessert'";
				pst = this.con.prepareStatement(query);
				rs = pst.executeQuery();
				while (rs.next()) {
	
					Product row = new Product();
					row.setPid(rs.getInt("pid"));
					row.setPtitle(rs.getString("ptitle"));
					row.setPrice(rs.getDouble("price"));
					row.setCategory(rs.getString("ctitle"));
					row.setPphoto(rs.getString("pphoto"));
	
					desproducts.add(row);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return desproducts;
	
		}
	
		public ArrayList<Cart> getCartProducts(ArrayList<Cart> cartList) {
			ArrayList<Cart> cartProducts = new ArrayList<>();
			try {
				if (cartList.size() > 0) {
					for (Cart item : cartList) {
						query = "select * from product where pid=?";
						pst = this.con.prepareStatement(query);
						pst.setInt(1, item.getPid());
						rs = pst.executeQuery();
						while (rs.next()) {
							Cart cart = new Cart();
							cart.setPid(rs.getInt("pid"));
							cart.setPtitle(rs.getString("ptitle"));
							cart.setCategory(rs.getString("ctitle"));
							cart.setPrice(rs.getDouble("price"));
							cart.setQuantity(item.getQuantity());
							cartProducts.add(cart);
						}
					}
				}
			} catch (Exception e) {
				System.out.println("Error in getCartProducts: " + e.getMessage());
				e.printStackTrace();
			}
			return cartProducts;
		}
	
		public double getTotalCartPrice(ArrayList<Cart> cartList) {
			double sum = 0;
			try {
				if (cartList.size() > 0) {
					for (Cart item : cartList) {
						query = "select price from product where pid=?";
						pst = this.con.prepareStatement(query);
						pst.setInt(1, item.getPid());
						rs = pst.executeQuery();
						while (rs.next()) {
							double price = rs.getDouble("price");
							int quantity = item.getQuantity();
							sum += price * quantity;
						}
					}
				}
			} catch (Exception e) {
				System.out.println("Error in getTotalCartPrice: " + e.getMessage());
				e.printStackTrace();
			}
			return sum;
		}
	
		public void addProduct(Product product) {
	        try {
	            query = "INSERT INTO product (ptitle,  pphoto ,price,ctitle) VALUES (?, ?, ?, ?)";
	            pst = this.con.prepareStatement(query);
	            pst.setString(1, product.getPtitle());
	            pst.setString(2, product.getPphoto());
	            pst.setDouble(3, product.getPrice());
	
	            pst.setString(4, product.getCategory());
	            pst.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
		public Product getProductById(int id) {
		    Product product = null;
		    String query = "SELECT * FROM product WHERE pid = ?";
		    try (PreparedStatement pst = con.prepareStatement(query)) {
		        pst.setInt(1, id);
		        try (ResultSet rs = pst.executeQuery()) {
		            if (rs.next()) {
		                product = new Product();
		                product.setPid(rs.getInt("pid"));
		                product.setPtitle(rs.getString("ptitle"));
		                product.setPrice(rs.getDouble("price"));
		                product.setCategory(rs.getString("ctitle"));
		                product.setPphoto(rs.getString("pphoto"));
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return product;
		}
		public boolean deleteProduct(int id) {
		    boolean result = false;
		    String query = "DELETE FROM product WHERE pid = ?";
		    try (PreparedStatement pst = con.prepareStatement(query)) {
		        pst.setInt(1, id);
		        int rowsAffected = pst.executeUpdate();
		        result = rowsAffected > 0; // returns true if a row was deleted
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return result;
		}
		public List<Product> getAllProducts() {
		    List<Product> products = new ArrayList<>();
		    String query = "SELECT * FROM product";
		    try (PreparedStatement pst = con.prepareStatement(query);
		         ResultSet rs = pst.executeQuery()) {
		        while (rs.next()) {
		            Product product = new Product();
		            product.setPid(rs.getInt("pid"));
		            product.setPtitle(rs.getString("ptitle"));
		            product.setPrice(rs.getDouble("price"));
		            product.setCategory(rs.getString("ctitle"));
		            product.setPphoto(rs.getString("pphoto"));
		            products.add(product);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return products;
		}

	
	}

package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {

	DBConnectionMgr pool;
	Connection con;

	public ProductDAO() {
		pool = DBConnectionMgr.getInstance();
	}

	public void insertProduct(ProductDTO dto) throws Exception {
		con = pool.getConnection();
			
		String sql = "insert into product value(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getTitle());
		ps.setString(3, dto.getExplanation());
		ps.setInt(4, dto.getPrice());
		ps.executeUpdate();
		
		pool.freeConnection(con, ps);

	}
	
	public ProductDTO selectProduct(String id) throws Exception {
		con = pool.getConnection();
			
		String sql = "select * from product where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		
		ProductDTO dto = null;
		while(rs.next()) {
			dto = new ProductDTO();
			dto.setId(rs.getString("id"));
			dto.setTitle(rs.getString("title"));
			dto.setExplanation(rs.getString("explanation"));
			dto.setPrice(rs.getInt("price"));
		}
		
		pool.freeConnection(con, ps, rs);

		return dto; 
	}
	
	public void updateProduct(ProductDTO dto) throws Exception {
		con = pool.getConnection();
			
		String sql = "update product set explanation = ?, price = ? where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, dto.getExplanation());
		ps.setInt(2, dto.getPrice());
		ps.setString(3, dto.getId());
		ps.executeUpdate();
		pool.freeConnection(con, ps);
 
	}
	
	public ArrayList<ProductDTO> selectAll() throws Exception {
		con = pool.getConnection();
			
		String sql = "select * from product";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<ProductDTO> list = new ArrayList<>();
		while(rs.next()) {
			ProductDTO dto = new ProductDTO(); 
			dto.setId(rs.getString("id"));
			dto.setTitle(rs.getString("title"));
			dto.setExplanation(rs.getString("explanation"));
			dto.setPrice(rs.getInt("price"));
			list.add(dto);
		}
		
		
		pool.freeConnection(con, ps, rs);
		return list;
	}
	
	public void deleteProduct(String id) throws Exception {
		con = pool.getConnection();
			
		String sql = "delete from product where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.executeUpdate();
			
		
		pool.freeConnection(con, ps);
		
	}
	 
	
}

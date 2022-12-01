package com.proj.Repository;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.proj.UserController;

import com.proj.model.FruitDetails;
import com.proj.model.RegProfile;
import com.proj.model.paymentsProfile;

@Repository
public class UserDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	UserController fru;
	
	class MyRowMapper implements RowMapper<FruitDetails>
	{
		@Override
		public FruitDetails mapRow(ResultSet rs,int rowNum) throws SQLException
		{
			FruitDetails fruit=new FruitDetails();
			fruit.setSno(rs.getInt("sno"));
			
			fruit.setFruitname(rs.getString("name"));
			fruit.setPrice(rs.getString("price"));
			return fruit;
		}
	}
	public List<FruitDetails> searchfruit(String category)
	{
		String sql="select * from "+ category;
		return jdbcTemplate.query(sql,new MyRowMapper());
	}
	public void additem(String goat,String name, String price)
	{
		String sql="insert into item(sno,name,price)"
				+ "values(?,?,?)";
		int flag=jdbcTemplate.update(sql,goat,name,price);
		
		
		
	}
	public void deleteitem(String id)
	{
		String sql="delete from item WHERE name=?";
		int flag=jdbcTemplate.update(sql,id);
		
		
		
	}
	class CartRowMapper implements RowMapper<FruitDetails>
	{
		@Override
		public FruitDetails mapRow(ResultSet rs,int rowNum) throws SQLException
		{
			FruitDetails fruit=new FruitDetails();
			fruit.setSno(rs.getInt("sno"));
			fruit.setFruitname(rs.getString("name"));
			fruit.setPrice(rs.getString("price"));
			return fruit;
		}
	}
	public List<FruitDetails> viewcart(String goat)
	{
		String sql="select * from item where sno=?"
				+ " order by abs(price)";
		return jdbcTemplate.query(sql,new Object[] {goat},new CartRowMapper());
	}
	
	public void  deletetable(String goat,String name,String price)
	{
		
		
		String sql="delete from item where sno=?";
		int flag=jdbcTemplate.update(sql,goat);
	}
	
	public int storebuyer(paymentsProfile payments,int amount,String name,String goat)
	{
		String sql="insert into payments(userid,firstname,email,address,city,total,items)"
				+ "values(?,?,?,?,?,?,?)";
		int flag=jdbcTemplate.update(sql,goat,payments.getFirstname(),payments.getEmail(),payments.getAddress(),payments.getCity(),amount,name);
		
		
		return flag;
	}
	
	class MyAdminRowMapper implements RowMapper<paymentsProfile>
	{
		@Override
		public paymentsProfile mapRow(ResultSet rs,int rowNum) throws SQLException
		{
			paymentsProfile payments=new paymentsProfile();
			payments.setUserid(rs.getInt("userid"));
			payments.setFirstname(rs.getString("firstname"));
			payments.setEmail(rs.getString("email"));
			payments.setAddress(rs.getString("address"));
			payments.setCity(rs.getString("city"));
			payments.setTotal(rs.getInt("total"));
			payments.setItems(rs.getString("items"));
			
			return payments;
		}
	}
	public List<paymentsProfile> dashboard(int amount,String name)
	{
		String sql="select * from payments";
		return jdbcTemplate.query(sql,new MyAdminRowMapper());
	}
	
	public void deletedashboard(String userid,String items)
	{
		String sql="delete from payments WHERE userid=? and items=?";
		int flag=jdbcTemplate.update(sql,userid,items);	
	}
	public void adminadd(String category,String itemname, String price)
	{
		String sql="insert into "+category+"(name,price)"
				+ "values(?,?)";
		int flag=jdbcTemplate.update(sql,itemname,price);
		 
	}
	public int admindel(String category,String itemname)
	{
		String sql="delete from "+category+" where name=?";
		int flag=jdbcTemplate.update(sql,itemname);
		return flag;
	}
}

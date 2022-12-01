package com.proj.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.proj.model.RegProfile;

@Repository
public class LoginDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;
    
	public String userValidate(String userid, String password)
	{
		String sql="select userrole from login where userid=? and password=?";
		String role="";
		try
		{
			
			role= jdbcTemplate.queryForObject(sql,new RowMapper<String>()
					{
				       public String mapRow(ResultSet rs,int rowNum) throws SQLException
				       {
				    	   
				    	   return rs.getString("userrole");
				       }
					},Integer.parseInt(userid),password);
		} catch (Exception e)
		{
			e.printStackTrace();
			return role;
		}
		return role;
	}
	
	
	public String passwordForgot(String userid,String question, String answer)
	{
		String sql="select password from login where userid=? and question=? and answer=?";
		String pass="";
		try
		{
			
			pass= jdbcTemplate.queryForObject(sql,new RowMapper<String>()
					{
				       public String mapRow(ResultSet rs,int rowNum) throws SQLException
				       {
				    	   
				    	   return rs.getString("password");
				       }
					},Integer.parseInt(userid),question,answer);
		} catch (Exception e)
		{
			e.printStackTrace();
			return pass;
		}
		
		return pass;
	}
	
	public String accountCreate(RegProfile regProfile, String phno)
	{
		String sql="insert into login (uname,password,userrole,phno,mail,gender,question,answer)"
				+ "values(?,?,?,?,?,?,?,?)";
		int flag=jdbcTemplate.update(sql,regProfile.getUname(),regProfile.getPassword(),"User",regProfile.getPhno(),regProfile.getMail(),regProfile.getGender(),"sport",regProfile.getAnswer());

		String sql1="select userid from login where phno=?";
		String userid ="";
	
		try
		{
			
			userid= jdbcTemplate.queryForObject(sql1,new RowMapper<String>()
					{
				       public String mapRow(ResultSet rs,int rowNum) throws SQLException
				       {
				    	   
				    	   return rs.getString("userid");
				       }
					},phno);
		} catch (Exception e)
		{
			e.printStackTrace();
			return userid;
			
		}
		
	   return userid;
	   
	}
}
	
	
	
	


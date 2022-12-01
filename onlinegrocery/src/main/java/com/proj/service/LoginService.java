package com.proj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.UserController;

import com.proj.Repository.LoginDao;
import com.proj.Repository.UserDao;

import com.proj.model.RegProfile;
import com.proj.model.paymentsProfile;

import com.proj.model.FruitDetails;

@Service
public class LoginService {

    @Autowired
	LoginDao loginDao;
    
    @Autowired
    UserDao userDao;
	
   
    
    public String goat;
    
	public String getGoat() {
		return goat;
	}

	public void setGoat(String goat) {
		this.goat = goat;
	}

	public String validateUser(String userid, String password)
	{
		this.goat=userid;
		
		return loginDao.userValidate(userid,password);
	}
	
	public String forgotPassword(String userid, String question, String answer)
	{
		
		return loginDao.passwordForgot(userid,question,answer);
	}
	
	public String createAccount(RegProfile regProfile,String phno)
    {
    return loginDao.accountCreate(regProfile,phno);
	}
	
	public List<FruitDetails> searchfruit(String category)
	{
		
		List<FruitDetails> list= userDao.searchfruit(category);
		return list;
	}
	int i=1;
	public void additem(String name, String price)
	{
		 userDao.additem(this.getGoat(),name,price);
		 i++;
	}
	public void deleteitem(String id)
	{
		 userDao.deleteitem(id);
	}
	public List<FruitDetails> viewcart()
	{
		List<FruitDetails> list= userDao.viewcart(this.getGoat());
		return list;
	}
	public void payments(String name,String price)
	{
		userDao.deletetable(this.getGoat(),name,price);
	}
	public int storebuyer(paymentsProfile payments,int amount,String name)
    {
    return userDao.storebuyer(payments,amount,name,this.getGoat());
	}
	public void logout()
	{
	
	}
	public List<paymentsProfile> dashboard(int amount,String name)
	{
		 List<paymentsProfile> list=userDao.dashboard(amount,name);
		 return list;
	}
	public void deletedashboard(String userid,String items)
	{
		 userDao.deletedashboard(userid,items);
	}
	public void adminadd(String category,String itemname, String price)
	{
		 userDao.adminadd(category,itemname,price);
		 
	}
	public int admindel(String category,String itemname)
	{
		 return userDao.admindel(category,itemname);
		 
	}
}

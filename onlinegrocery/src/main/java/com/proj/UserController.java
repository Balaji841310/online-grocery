package com.proj;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.proj.service.LoginService;
import com.proj.model.FruitDetails;
import com.proj.model.paymentsProfile;
@Controller
public class UserController {
	
	@Autowired
	LoginService loginService;
	
	private int amount;
	private String name;
	
	 public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@GetMapping("/searchfruit")
	 public ModelAndView searchfruit()
	 {
		 ModelAndView mv=new ModelAndView("fruits");
		 List<FruitDetails> list=loginService.searchfruit("fruit");
		 mv.addObject("fruitList",list);
		 return mv;
	 }
	 
	 @GetMapping("/searchvegetables")
	 public ModelAndView vegetables()
	 {
		
		 ModelAndView mv=new ModelAndView("fruits");
		 List<FruitDetails> list=loginService.searchfruit("vegetables");
		 mv.addObject("fruitList",list);
		 return mv;
	 }
	 @GetMapping("/searchdiary")
	 public ModelAndView diary()
	 {
		 ModelAndView mv=new ModelAndView("fruits");
		 List<FruitDetails> list=loginService.searchfruit("diary");
		 mv.addObject("fruitList",list);
		 return mv;
	 }
	 
	 @GetMapping("/additem")
	 public String additem(Model model,@RequestParam String name,@RequestParam String price)
	 {
		loginService.additem(name,price);
		model.addAttribute("added","Added to Cart");
		 return "userPage";
	 }
	 
	 @GetMapping("/deleteitem")
	 public String deleteitem(Model model, @RequestParam String id)
	 {
		
		loginService.deleteitem(id);
		model.addAttribute("deleted","Deleted from Cart");
		 return "userPage";
	 }
	 
	 @GetMapping("/viewcart")
	 public ModelAndView viewcart()
	 {
		 int amount=0;
		 String name="";
		 ModelAndView mv=new ModelAndView("cart");
		 List<FruitDetails> cartlist=loginService.viewcart();
		 for(int i=0;i<cartlist.size();i++)
		 {
			 amount=amount+ Integer.parseInt(cartlist.get(i).getPrice());
			 name=name+" "+cartlist.get(i).getFruitname();
		 }
		setAmount(amount);
		setName(name);
		 
		 mv.addObject("cartlist",cartlist);
		 return mv;
	 }
	 @GetMapping("/gocategory")
	 public String cartTocategory() {
		 return "userPage";
	 }
	 @GetMapping("/buy")
	 public String payments(String name,String price) 
	 {
		 

		 loginService.payments(name,price);
		 return "payments";
	 }
	 
	 @PostMapping("/pay")
	 public String pay(paymentsProfile payments, Model model) {
		 loginService.storebuyer(payments,this.getAmount(),this.getName());
		 model.addAttribute("success","Successfully Purchased");
		 return "userPage";
	 }
	 @GetMapping("/logout")
	 public String logout() 
	 {
		 loginService.logout();
		 return "userlogin";
	 }
	 @GetMapping("/dashboard")
	 public ModelAndView dashboard()
	 {
		 ModelAndView mv=new ModelAndView("dashboard");
		 List<paymentsProfile> list=loginService.dashboard(this.getAmount(),this.getName());
		 mv.addObject("purchaselist",list);
		 return mv;
	 }
	 
	 @GetMapping("/deletedashboard")
	 public String deletedashboard(Model model, @RequestParam String userid,String items)
	 {
		
		loginService.deletedashboard(userid,items);
		model.addAttribute("delivered","Items Delivered Successfully!!!");
		 return "adminPage";
	 }
	 @GetMapping("/adminstoreadd")
	 public String adminstoreadd() 
	 {
		 
		 return "adminaddstore";
	 }
	 @GetMapping("/adminadd")
	 public String adminadd(Model model,@RequestParam String category,@RequestParam String itemname,@RequestParam String price)
	 {
		 try {
		loginService.adminadd(category,itemname,price);
		model.addAttribute("itemadded",itemname+" successfully added to store!!!");
		 }catch(Exception e)
		 {
		e.printStackTrace();
		model.addAttribute("alreadyadded",itemname+" Already Exists. Try Again !!!");
		 return "adminaddstore";
		 }
		 return "adminPage";
	 }
	 @GetMapping("/adminstoredel")
	 public String adminstoredel() 
	 {
		 
		 return "admindelstore";
	 }
	 @GetMapping("/admindel")
	 public String delitem(Model model,@RequestParam String category,@RequestParam String itemname)
	 {
		
		int flag=loginService.admindel(category,itemname);
		 
		if(flag==1)
		{
			model.addAttribute("itemremoved",itemname+" successfully removed from store!!!");
			return "adminPage";
		}
		else
		{
			model.addAttribute("donotexist","oops, "+itemname+ " not there. Try Again !!");
			return "admindelstore";
		}
			
	 }
	
}

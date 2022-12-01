package com.proj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.proj.model.RegProfile;
import com.proj.service.LoginService;

@Controller
public class LoginController {
	 
    
	@Autowired
	LoginService loginService;
	
	 @GetMapping("/index")
	 public String loginpage()
	 {
		 return "userlogin";
	 }
	 @GetMapping("/register")
	 public String registerpage()
	 {
		 return "reg";
	 }
	 @PostMapping("/registerpage")
	 public String registerpage(RegProfile regProfile,String phno,Model model)
	 {
		 String userid=loginService.createAccount(regProfile,phno);
		 model.addAttribute("register","Successfully Registered");
		 model.addAttribute("userid","Your userid is "+ userid);
		 return "userlogin";
	 }
	 @GetMapping("/forgot")
	 public String forgotpassword()
	 {
		 return "forgotPassword";
	 }
	 
	 @GetMapping("/forgotpassword")
	 public String forgotpassword(String userid, String question, String answer, Model model)
	 {
		 String pass=loginService.forgotPassword(userid,question,answer);
		 model.addAttribute("show","your password is:"+ pass);
		 
		 return "forgotPassword";
	 }
	 
	
	 
	 @PostMapping("/loginCheck")
	 public String loginCheck(@RequestParam String userid, @RequestParam String password, Model model)
	 {
		String role=loginService.validateUser(userid,password); 
		
		if(role.equals("Admin"))
		{
			model.addAttribute("admin","Welcome, "+userid+" !!");
			return "adminPage";
		}
		if(role.equals("User"))
		{
			model.addAttribute("user","Welcome, "+userid+" !!");
			return "userPage";
		}
		model.addAttribute("error","ERROR");
		return "userlogin";
		
	 }
	 
	 
	
	 
	 
}

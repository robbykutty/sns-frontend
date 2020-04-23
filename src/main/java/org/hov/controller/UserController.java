package org.hov.controller;

import org.hov.custom.CodeGenerator;
import org.hov.enums.UserType;
import org.hov.model.User;
import org.hov.service.EmailService;
import org.hov.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;
	
	@Autowired
	EmailService emailService;
	
	User tempuser;
	
	@RequestMapping("/register")
	public String register(ModelMap map) {
		map.addAttribute("user", new User());
		return "register";
	}
	
	@RequestMapping(value={"/register"}, method=RequestMethod.POST)
	public String register(@ModelAttribute("user") User user, ModelMap map) {
		user.setUserType(UserType.BUYER);
		user.setActive(true);
		if (userService.addUser(user)){
			//CodeGenerator cg = new CodeGenerator();
			//emailService.sendSimpleMail(user.getEmail(), 
										//"verification code", 
										//cg.generate(6));
		}
		
		map.addAttribute("msg", "Registered Successfully!!");
		map.addAttribute("type", "success");
		map.addAttribute("pagename", "/user/login");
		return "popup";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/profile")
	public String profile() {
		return "profile";
	}
	
	@RequestMapping("/adminpanel")
	public String panel() {
		return "adminpanel";
	}
	
	@RequestMapping("/forgot")
	public String forgot() {
		return "enterusername";
	}
	
	@RequestMapping(value= {"/sendotp"})
	public String enterusername(@RequestParam("username") String email, ModelMap map) {
		tempuser = userService.getUserByEmail(email);
		if(tempuser != null) {
			CodeGenerator cg=new CodeGenerator();
			String otp = cg.generate(6);
			map.addAttribute("otp", otp);
			//emailService.sendSimpleMail(email, "Hi, OTP from SNS", "Your OTP is "+ otp);
			System.out.println(otp+"*****************************************");
			return "confirmotp";
		}
		else {
			return "redirect:/user/login";
		}
	}
	
	@RequestMapping(value={"/checkotp"})
	public String checkotp(@RequestParam("userotp") String userotp, 
						   @RequestParam("otp") String otp) {
		if(userotp.equals(otp)) {
			System.out.println("OTP EQUAL:"+ userotp+ "/" + otp);
			return "changepassword";
		}
		else {

			System.out.println("OTP NOT EQUAL:"+ userotp+ "/" + otp);
			return "redirect:/user/login";
		}
	}
	
	@RequestMapping("/changepassword")
	public String changepassword(@RequestParam("password") String pass, 
						   		 @RequestParam("cpassword") String cpass) {
		if(pass.equals(cpass)) {
			tempuser.setPassword(new BCryptPasswordEncoder().encode(pass));
			userService.updateUser(tempuser);
			return "redirect:/user/login";
		}
		else {
			return "redirect:/user/login";
		}
	}
}

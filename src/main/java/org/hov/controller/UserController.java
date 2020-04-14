package org.hov.controller;

import org.hov.model.User;
import org.hov.service.EmailService;
import org.hov.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;
	
	@Autowired
	EmailService emailService;
	
	@RequestMapping("/register")
	public String register(ModelMap map) {
		map.addAttribute("user", new User());
		return "register";
	}
	
	@RequestMapping(value={"/register"}, method=RequestMethod.POST)
	public String register(@ModelAttribute("user") User user) {
		if (userService.addUser(user)){
			//CodeGenerator cg = new CodeGenerator();
			//emailService.sendSimpleMail(user.getEmail(), 
										//"verification code", 
										//cg.generate(6));
		}
		return "redirect:/user/login";
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
}

package org.hov.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value = {"", "/", "/index", "/home"})
	public String home() {
		return "home";
	}
	
	@RequestMapping("/about")
	public String about() {
		return "aboutus";
	}
	
	@RequestMapping("/contact")
	public String contact() {
		return "contactus";
	}
}

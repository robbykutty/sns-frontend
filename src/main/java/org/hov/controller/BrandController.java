package org.hov.controller;

import org.hov.model.Brand;
import org.hov.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/brand")
public class BrandController {
	@Autowired
	BrandService brandService;
	
	@RequestMapping(value = {"", "/", "/display"})
	public String display() {
		return "displaybrand";
	}
	
	@RequestMapping("/add")
	public String add(ModelMap map) {
		map.addAttribute("brand", new Brand());
		return "addbrand";
	}
	
	@RequestMapping(value = {"/add"}, method = RequestMethod.POST)
	public String add(@ModelAttribute("brand") Brand brand) {
		brandService.addBrand(brand);
		return "redirect:/brand/display";
	}
}
package org.hov.controller;

import org.hov.model.Category;
import org.hov.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/category")
public class CategoryController {	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(value = {"", "/", "/display"})
	public String display() {
		return "displaycategory";
	}
	
	@RequestMapping("/add")
	public String add(ModelMap map) {
		map.addAttribute("category", new Category());
		return "addcategory";
	}
	
	@RequestMapping(value = {"/add"}, method = RequestMethod.POST)
	public String add(@ModelAttribute("category") Category category) {
		categoryService.addCategory(category);
		return "redirect:/category/display";
	}
}

package org.hov.controller;

import org.hov.model.SubCategory;
import org.hov.service.SubCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/subcategory")
public class SubCategoryController {
	@Autowired
	SubCategoryService subCategoryService;

	@RequestMapping(value = {"", "/", "/display"})
	public String display() {
		return "displaysubcategory";
	}
	
	@RequestMapping("/add")
	public String add(ModelMap map) {
		map.addAttribute("subcategory", new SubCategory());
		return "addsubcategory";
	}
	
	@RequestMapping(value = {"/add"} ,method = RequestMethod.POST)
	public String add1(@ModelAttribute("subcategory") SubCategory sc) {
		subCategoryService.addSubCategory(sc);
		return "redirect:/subcategory/display";
	}
}
package org.hov.controller;

import org.hov.model.Item;
import org.hov.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ItemService itemService;
	
	@RequestMapping(value = {"", "/", "/display"})
	public String display() {
		return "displayproduct";
	}
	
	@RequestMapping("/add")
	public String add(ModelMap map) {
		map.addAttribute("product", new Item());
		return "addproduct";
	}

	@RequestMapping(value={"/add"}, method=RequestMethod.POST)
	public String add(@ModelAttribute("product") Item item) {
		itemService.addItem(item);
		return "redirect:/product/display";
	}
}
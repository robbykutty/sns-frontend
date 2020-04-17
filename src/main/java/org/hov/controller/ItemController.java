package org.hov.controller;

import java.util.UUID;

import org.hov.model.Item;
import org.hov.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/product")
public class ItemController {
	@Autowired
	ItemService itemService;
	
	@RequestMapping("/add")
	public String add(ModelMap map) {
		map.addAttribute("item", new Item());
		return "additem";
	}

	@RequestMapping(value={"/add"}, method=RequestMethod.POST)
	public String add(@ModelAttribute("item") Item item) {
		itemService.addItem(item);
		return "redirect:/product/displayall";
	}
	
	@RequestMapping("/edit/{itemid}")
	public String edit(@PathVariable("itemid") String itemid, ModelMap map) {
		map.addAttribute("i", itemService.getItemById(UUID.fromString(itemid)));
		return "additem";
	}
	
	@RequestMapping(value={"/update"}, method=RequestMethod.POST)
	public String edit(@ModelAttribute("i") Item item) {
		itemService.updateItem(item);
		return "redirect:/product/displayall";
	}
	
	@RequestMapping("/displayall")
	public String displayAll(ModelMap map) {
		map.addAttribute("itemlist", itemService.getItemList());
		return "displayallproducts";
	}
	
	@RequestMapping("/display/{itemid}")
	public String openProduct(@PathVariable("itemid") String itemid, ModelMap map) {
		map.addAttribute("item", itemService.getItemById(UUID.fromString(itemid)));
		return "displayproduct";
	}
	
	@RequestMapping("/delete/{itemid}")
	public String delete(@PathVariable("itemid") UUID itemid) {
		itemService.removeItem(itemid);
		return "redirect:/product/displayall";
	}
}
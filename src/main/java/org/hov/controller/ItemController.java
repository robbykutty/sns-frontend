package org.hov.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String add(@ModelAttribute("item") Item item, @RequestParam("image") MultipartFile productImage, ModelMap map) {
		
		String path="D:\\Development\\Workspace\\Eclipse J2EE 2019\\sns-frontend\\src\\main\\webapp\\WEB-INF\\resources\\images\\";
		Path p=Paths.get(path+item.getItemName());
		if (!Files.exists(p)) {    
			try {
				Files.createDirectory(p);
				System.out.println("Directory created");
			}
			catch (Exception e) {
				e.printStackTrace();
			}
        }
		
		List<String> files=displayImage(item.getItemName());
		
		path=String.valueOf(p.toString()+"\\"+(files.size()+1)+".jpg");
		System.out.println(path);
		File imageFile=new File(path);
		
		if(!productImage.isEmpty()) {
			try {
				byte buffer[]=productImage.getBytes();
				FileOutputStream fos=new FileOutputStream(imageFile);
				BufferedOutputStream bos=new BufferedOutputStream(fos);
				bos.write(buffer);
				bos.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		itemService.addItem(item);
		map.addAttribute("msg", "Item Added Successfully!!");
		map.addAttribute("type", "success");
		map.addAttribute("pagename", "/product/displayall");
		return "popup";
	}
	
	public List<String> displayImage(String itemname)
	{
		List<String> images=new ArrayList();
		try {
			String path="D:\\Development\\Workspace\\Eclipse J2EE 2019\\sns-frontend\\src\\main\\webapp\\WEB-INF\\resources\\images\\";
			Path p=Paths.get(path+itemname);
			DirectoryStream<Path> files=Files.newDirectoryStream(p,"*.*");
			
			for(Path file:files) {
				FileInputStream fis=new FileInputStream(file.toString());
				byte[] arr=new byte[fis.available()];
				fis.read(arr);
				
				//images.add(fis.getFileName());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return images;
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
		
		List<String> images = new ArrayList<String>();
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
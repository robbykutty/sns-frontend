package org.hov.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.hov.model.Item;
import org.hov.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.instamojo.wrapper.api.ApiContext;
import com.instamojo.wrapper.api.Instamojo;
import com.instamojo.wrapper.api.InstamojoImpl;
import com.instamojo.wrapper.exception.ConnectionException;
import com.instamojo.wrapper.exception.HTTPException;
import com.instamojo.wrapper.model.PaymentOrder;
import com.instamojo.wrapper.model.PaymentOrderResponse;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	ItemService itemService;
	
	@RequestMapping("/buynow/${itemid}")
	public void buy(@PathVariable("itemid") String itemid, HttpServletResponse resp) {
		Item item = itemService.getItemById(UUID.fromString(itemid));
		
		try {
		/*
		 * Get a reference to the instamojo api
		 */
		ApiContext context = ApiContext.create("6ISO6VIbIeteqm5FPXmBNCtIbcmBR8dqI3uY3VXW", 
											   "T6RWd2POOL6pMd7eUJOb9tBJmdInFDherIk3JI2bA4MWmIu4lTbi8QqpuBzaSegENT4tkBw0FLiSRffcay5hoJD9SGMxPlXIcgXQoNd7rssq7xd21n1Ep5uiInWcVRPo", 
											   ApiContext.Mode.LIVE);
		Instamojo api = new InstamojoImpl(context);

		/*
		 * Create a new payment order
		 */
		PaymentOrder order = new PaymentOrder();
		order.setName("Tester");
		order.setEmail("exdev.robin@outlook.com");
		order.setPhone("9967377479");
		order.setCurrency("INR");
		order.setAmount(item.getItemPrice());
		order.setDescription(item.getItemName());
		order.setRedirectUrl("http://www.someexample.com");
		order.setWebhookUrl("http://www.someurl.com/");
		order.setTransactionId(UUID.randomUUID().toString());


		    PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
		   // System.out.println(paymentOrderResponse.getPaymentOrder().getStatus());
		    resp.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());

		}catch (Exception e) {
		    e.printStackTrace();
		}
	}
}

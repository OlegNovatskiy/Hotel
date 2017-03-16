package com.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.components.interfaces.ICustomerRe;

@Controller
@RequestMapping("/registry")
public class CustomerReController {

	@Autowired
	private ICustomerRe iCustomerRe;
	
	@RequestMapping(value="/customers", method = RequestMethod.GET)
	public ModelAndView showCustomers(ModelAndView model){
		
		model.setViewName("registry/customer/customers");
		model.addObject("customers", iCustomerRe.getCustomers());
		
		return model;
	}
	
	@RequestMapping(value="/customer/{id}", method = RequestMethod.GET)
	public ModelAndView searchCustomer(ModelAndView model, @PathVariable Integer id){
		
		model.setViewName("registry/customer/customer");
		model.addObject("customer", iCustomerRe.getCustomer(id));
		
		return model;
	}
	
}

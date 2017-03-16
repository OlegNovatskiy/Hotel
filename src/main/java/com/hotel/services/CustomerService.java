package com.hotel.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.components.entity.Customer;
import com.hotel.components.interfaces.ICustomerRe;

@Service
public class CustomerService {

	@Autowired
	private ICustomerRe iCustomerRe;
	
	public List<Customer> getCustomers(){
		
		return iCustomerRe.getCustomers();
	}
	
	public Customer getCustomer(Integer id){
		
		return iCustomerRe.getCustomer(id);
	}
}

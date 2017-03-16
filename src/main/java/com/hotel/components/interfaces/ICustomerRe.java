package com.hotel.components.interfaces;

import java.util.List;

import com.hotel.components.entity.Customer;

public interface ICustomerRe {

	public List<Customer> getCustomers();
	
	public Customer getCustomer(Integer id);
	
}

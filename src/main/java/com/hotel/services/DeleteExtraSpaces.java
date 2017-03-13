package com.hotel.services;

import org.springframework.stereotype.Service;

import com.hotel.components.entity.Customer;

@Service
public class DeleteExtraSpaces {

	/**
	 * Deleting extra spaces in data of customer
	 * 
	 * @param customer
	 * @return customer
	 */
	public Customer deleteInCustomer(Customer customer) {

		customer.setFirstName(customer.getFirstName().trim());
		customer.setLastName(customer.getLastName().trim());
		customer.setMiddleName(customer.getMiddleName().trim());
		customer.setCountry(customer.getCountry().trim());
		customer.setRegion(customer.getRegion().trim());
		customer.setCity(customer.getCity().trim());
		customer.setDistrict(customer.getDistrict().trim());
		customer.setStreet(customer.getStreet().trim());
		customer.setBuildNumber(customer.getBuildNumber().trim());
		customer.setLogin(customer.getLogin().trim());
		customer.setEmail(customer.getEmail().trim());
		customer.setPassword(customer.getPassword().trim());
		customer.setConfirmPassword(customer.getConfirmPassword().trim());
		customer.setPasportNumber(customer.getPasportNumber().trim());

		return customer;
	}

}

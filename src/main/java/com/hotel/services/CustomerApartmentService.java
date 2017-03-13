package com.hotel.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.components.entity.Booking;
import com.hotel.components.entity.CustomerApartment;
import com.hotel.components.entity.CustomerFilterApartments;
import com.hotel.components.interfaces.ICustomer;

@Service
public class CustomerApartmentService {

	@Autowired
	private ICustomer iCustomer;

	public List<CustomerApartment> getApartmens(CustomerFilterApartments filterApartment) {
		return iCustomer.getApartmens(filterApartment);
	}

	/**
	 * Booking apartment.
	 * 
	 * @param booking - object of booking - type {@link Booking}
	 * @return Integer status of booking: 1 - success, 2 - failed.
	 */
	public Byte bookingApartment(Booking booking) {
		return iCustomer.bookingApartment(booking);
	}

	public CustomerApartment getApartment(String numberApartment){
		return iCustomer.getApartment(numberApartment);
	}
}

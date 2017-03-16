package com.hotel.components.interfaces;

import java.util.List;

import com.hotel.components.entity.Booking;
import com.hotel.components.entity.CustomerApartment;
import com.hotel.components.entity.CustomerFilterApartments;

public interface ICustomerCu {

	public List<CustomerApartment> getApartmens(CustomerFilterApartments filterApartment);
	
	/**
	 * Booking apartment.
	 * 
	 * @param booking - object of booking - type {@link Booking}
	 * @return Integer status of booking: 1 - success, 2 - failed.
	 */
	public Byte bookingApartment(Booking booking);
	
	public CustomerApartment getApartment(String numberApartment);
	
}

package com.hotel.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.components.entity.Booking;
import com.hotel.components.interfaces.IBooking;

@Service
public class BookingService {

	@Autowired
	private IBooking iBooking;
	
	/**
	 * Booking apartment.
	 * 
	 * @param object
	 *            of booking with needed information
	 * @return status of booking: 1 - apartment is booked 2 - apartment is used
	 *         now 3 - It apartment is not located in hotel
	 */
	public Integer bookingApartment(Booking booking){
		return iBooking.bookingApartment(booking);
	}
	
	public List<Booking> searchBookedItems(){
		return iBooking.searchBookedItems();
	}
}

package com.hotel.components.interfaces;

import java.util.List;

import com.hotel.components.entity.Booking;

public interface IBooking {
	
	/**
	 * Booking apartment.
	 * 
	 * @param object
	 *            of booking with needed information
	 * @return status of booking: 1 - apartment is booked 2 - apartment is used
	 *         now 3 - It apartment is not located in hotel
	 */
	public Integer bookingApartment(Booking booking);
	
	
	public List<Booking> searchBookedItems();
}

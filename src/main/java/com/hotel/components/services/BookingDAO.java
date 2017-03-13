package com.hotel.components.services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hotel.components.entity.Apartment;
import com.hotel.components.entity.Booking;
import com.hotel.components.interfaces.IBooking;

@Repository
public class BookingDAO implements IBooking {

	private static Logger log = Logger.getLogger(BookingDAO.class);
	private static final String CHECK_USING_APARTMENT = "SELECT booking FROM apartments WHERE number = '%s' ";
	private static final String UPDATE_STATUS_APARTMENT = "UPDATE apartments SET booking = %s WHERE number = '%s' ";
	private static final String INSERT_BOOKING_ITEM = "INSERT INTO booking (number_apartment, first_name, last_name, middle_name, email, phone_number, begin_date, finish_date) VALUES ('%s','%s','%s','%s','%s','%s','%s','%s');	";
	private static final String SELECT_BOOKINF_ITEMS = "SELECT * FROM booking;";
	
	public static class BookedItemMap implements RowMapper<Booking> {

		@Override
		public Booking mapRow(ResultSet rs, int rowNum) throws SQLException {

			Booking booking = new Booking();
			booking.setId(rs.getInt(1));
			booking.setNumberApartment(rs.getString(2));
			booking.setFirstName(rs.getString(3));
			booking.setLastName(rs.getString(4));
			booking.setMiddleName(rs.getString(5));
			booking.setEmail(rs.getString(6));
			booking.setPhoneNumber(rs.getString(7));
			booking.setBeginDate(rs.getDate(8));
			booking.setFinishDate(rs.getDate(9));
			return booking;
		}

	}
	
	
	@Autowired
	private JdbcTemplate jdbc;

	@Override
	/**
	 * Booking apartment.
	 * 
	 * @param object
	 *            of booking with needed information
	 * @return status of booking: 1 - apartment is booked 2 - apartment is used
	 *         now 3 - It apartment is not located in hotel
	 */
	public Integer bookingApartment(Booking booking) {

		Integer code;
		Boolean used;
		
		try {

			used = jdbc.queryForObject(String.format(CHECK_USING_APARTMENT, booking.getNumberApartment()),
					Boolean.class);
		} catch (Exception e) {

			log.error(e.getMessage());
			code = 3;

			return code;
		}

		if (used) {

			code = 2;

			return code;
		} else {

			code = 1;
			jdbc.update(String.format(UPDATE_STATUS_APARTMENT, true, booking.getNumberApartment()));
			String insertBookingApartment = String.format(INSERT_BOOKING_ITEM, booking.getNumberApartment(),
					booking.getFirstName(), booking.getLastName(), booking.getMiddleName(), booking.getEmail(),
					booking.getPhoneNumber(), booking.getBeginDate(), booking.getFinishDate());
			jdbc.update(insertBookingApartment);
			return code;
		}
	}
	
	@Override
	public List<Booking> searchBookedItems(){
		
		List<Booking> items = jdbc.query(SELECT_BOOKINF_ITEMS, new BookedItemMap());
		return jdbc.query(SELECT_BOOKINF_ITEMS, new BookedItemMap());
	}

}

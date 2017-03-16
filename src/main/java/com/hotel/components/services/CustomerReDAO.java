package com.hotel.components.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.hotel.components.entity.Customer;
import com.hotel.components.interfaces.ICustomerRe;

@Repository
public class CustomerReDAO implements ICustomerRe {

	private static final String SELECT_SHORT_CUSTOMER = " SELECT id, first_name, last_name, middle_name, email, phone_number, birth_date, passport FROM kerpach_hotel.customers ";
	private static final String SELECT_FULL_CUSTOMER_BY_ID = " SELECT * FROM kerpach_hotel.customers WHERE id = %d";

	@Autowired
	private JdbcTemplate jdbc;

	@Override
	public List<Customer> getCustomers() {

		return jdbc.query(SELECT_SHORT_CUSTOMER, new BeanPropertyRowMapper<>(Customer.class));
	}

	@Override
	public Customer getCustomer(Integer id) {

		return jdbc.queryForObject(String.format(SELECT_FULL_CUSTOMER_BY_ID, id),
				new BeanPropertyRowMapper<>(Customer.class));
	}

}

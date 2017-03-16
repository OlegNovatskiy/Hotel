package com.hotel.components.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.hotel.components.entity.Attribute;
import com.hotel.components.entity.Booking;
import com.hotel.components.entity.CustomerApartment;
import com.hotel.components.entity.CustomerFilterApartments;
import com.hotel.components.interfaces.ICustomerCu;
import com.mysql.jdbc.Statement;

@Repository
public class CustomerDAO implements ICustomerCu{

	private static final String SELECTED_FIELDS_APARTMENTS = " SELECT DISTINCT apa.id, apa.number, apa.price, apa.description, apa.image, fig.tit FROM apartments AS apa ";
	private static final String INNER_JOIN_USE_APARTMENTS = " INNER JOIN use_apartments AS ua on ua.apartment_id = apa.id ";
	private static final String INNER_JOIN_ATTRIBUTE_FOR_CONDITION = " INNER JOIN attributes as attr on attr.apartments_id = apa.id  ";
	private static final String INNER_JOIN_ATTRIBUTE_OF_APARTMENT = " INNER JOIN (SELECT GROUP_CONCAT(atrt.title SEPARATOR ', ') AS tit, atrs.apartments_id FROM attributes_type AS atrt INNER JOIN attributes AS atrs ON atrs.attribute_id = atrt.id inner join apartments AS apa ON apa.id = atrs.apartments_id GROUP BY apa.id) AS fig ON fig.apartments_id = apa.id ";
	private static final String CONDITION_DATE_APARTMENTS = " WHERE (('%1$s' > ua.begin_date AND '%2$s'> ua.begin_date AND  '%1$s' > ua.finish_date AND '%2$s'> ua.finish_date) OR  ('%1$s' < ua.begin_date AND '%2$s'< ua.begin_date AND  '%1$s' < ua.finish_date AND '%2$s'< ua.finish_date)) ";
	private static final String CONDITION_USING_APARTMENTS = " WHERE apa.id not in (select distinct apartment_id from use_apartments) ";
	private static final String CONDITION_NUMBER_APARTMENT = " WHERE apa.number = '%s' ";
	private static final String UNION_QUERIES = " UNION ";
	private static final String INSERT_CUSTOMER = " INSERT INTO customers (first_name, last_name, middle_name, email, phone_number) VALUES ('%s', '%s', '%s', '%s', '%s') ";
	private static final String INSERT_BOOKING_APARTMENT = "INSERT INTO use_apartments (apartment_id, customer_id, begin_date, finish_date, status) VALUES ( %d, %d, '%s','%s','BOOKING')";
	
	private static Logger log = Logger.getLogger(CustomerDAO.class);
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public static class FilterApartmentsMap implements RowMapper<CustomerApartment> {

		@Override
		public CustomerApartment mapRow(ResultSet rs, int rowNum) throws SQLException {

			CustomerApartment customerApartment = new CustomerApartment();
			customerApartment.setId(rs.getInt(1));
			customerApartment.setNumber(rs.getString(2));
			customerApartment.setPrice(rs.getInt(3));
			customerApartment.setDescription(rs.getString(4));
			customerApartment.setImage(rs.getString(5));
			customerApartment.setAttributes(rs.getString(6));
			return customerApartment;
		}

	}
	
	public static class AttributesMap implements RowMapper<Attribute> {

		@Override
		public Attribute mapRow(ResultSet rs, int rowNum) throws SQLException {

			Attribute attribute = new Attribute();
			attribute.setId(rs.getInt(1));
			attribute.setTitle(rs.getString(2));

			return attribute;
		}

	}

	@Override
	public CustomerApartment getApartment(String numberApartment){
		
		StringBuilder query = new StringBuilder();
		query.append(SELECTED_FIELDS_APARTMENTS);
		query.append(INNER_JOIN_ATTRIBUTE_OF_APARTMENT);
		query.append(String.format(CONDITION_NUMBER_APARTMENT, numberApartment));
		
		return jdbcTemplate.queryForObject(query.toString(), new FilterApartmentsMap());
	}
	
	@Override
	public List<CustomerApartment> getApartmens(CustomerFilterApartments filterApartment) {
		
		String querySelectApartments = concatQuery(filterApartment);

		return jdbcTemplate.query(querySelectApartments, new FilterApartmentsMap());
	}

	/**
	 * Booking apartment.
	 * 
	 * @param booking - object of booking - type {@link Booking}
	 * @return Integer status of booking: 1 - success, 2 - failed.
	 */
	@Override
	public Byte bookingApartment(Booking booking) {
		
		try{
			String queryInsertCustomer = String.format(INSERT_CUSTOMER, booking.getFirstName(), booking.getLastName(), booking.getMiddleName(), booking.getEmail(), booking.getPhoneNumber());

			KeyHolder keyHolder = new GeneratedKeyHolder();
			PreparedStatementCreator preStatement = new PreparedStatementCreator() {

				@Override
				public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

					return con.prepareStatement(queryInsertCustomer, Statement.RETURN_GENERATED_KEYS);
				}
			};

			jdbcTemplate.update(preStatement, keyHolder);
			Integer generateIdCustomer = keyHolder.getKey().intValue();
			
			
			jdbcTemplate.update(String.format(INSERT_BOOKING_APARTMENT, booking.getIdApartment(), generateIdCustomer, booking.getBeginDate(), booking.getFinishDate()));
			
			return 1;
		}catch(Exception e){
			
			log.error(e.getMessage());
			
			return 2;
		}
	}
	
	public String concatQuery(CustomerFilterApartments filterApartment) {
		
		StringBuilder query = new StringBuilder();
		String conditionsAttrs = conditionsAttributes(filterApartment);
		
		query.append(SELECTED_FIELDS_APARTMENTS);
		query.append(INNER_JOIN_ATTRIBUTE_FOR_CONDITION);
		query.append(INNER_JOIN_ATTRIBUTE_OF_APARTMENT);
		query.append(CONDITION_USING_APARTMENTS);
		query.append(conditionsAttrs);
		query.append(UNION_QUERIES);
		query.append(SELECTED_FIELDS_APARTMENTS);
		query.append(INNER_JOIN_ATTRIBUTE_FOR_CONDITION);
		query.append(INNER_JOIN_USE_APARTMENTS);
		query.append(INNER_JOIN_ATTRIBUTE_OF_APARTMENT);
		
		String begDate = filterApartment.getBeginDate().toString();
		String finDate = filterApartment.getFinishDate().toString();
		query.append(String.format(CONDITION_DATE_APARTMENTS, begDate, finDate));
		query.append(conditionsAttrs);
		
		
		return query.toString();
	}
	
	public String conditionsAttributes(CustomerFilterApartments filterApartment) {
		
		StringBuilder query = new StringBuilder();
		
		addIntegerCondition(query, "people_count", filterApartment.getPeopleCount());
		addIntegerCondition(query, "bed_count", filterApartment.getBedCount());
		addIntegerCondition(query, "rooms_count", filterApartment.getRoomCount());

		if (filterApartment.getMinPrice() != null && filterApartment.getMinPrice() > 0) {
				query.append(String.format(" AND %s > %d ", "price", filterApartment.getMinPrice()));
		}

		if (filterApartment.getMaxPrice() != null && filterApartment.getMaxPrice() > 0) {
				query.append(String.format(" AND %s < %d ", "price", filterApartment.getMaxPrice()));
		}


		if (filterApartment.getAttributes() != null && filterApartment.getAttributes().length > 0) {
			StringBuilder attributes = new StringBuilder();
			for (Integer itr = 0; itr < filterApartment.getAttributes().length; itr++) {
				if (itr < filterApartment.getAttributes().length - 1) {
					attributes.append(String.format("%s, ", filterApartment.getAttributes()[itr]));
				} else {
					attributes.append(String.format("%s ", filterApartment.getAttributes()[itr]));
				}
			}

				String posibleId = " SELECT apartments_id from (SELECT apartments_id, COUNT(apartments_id) AS `cnt` FROM attributes AS attrs WHERE attrs.attribute_id in ( %s ) GROUP BY apartments_id HAVING cnt = %d ) as t ";
				posibleId = String.format(posibleId, attributes.toString(), filterApartment.getAttributes().length);
				
				query.append(String.format(" AND %s in ( %s )", " apa.id ", posibleId));
		}


		return query.toString();
		
	}
	
	private void addIntegerCondition(StringBuilder query, String fieldName, Integer value) {

		if (value != null && value > 0) {
				query.append(String.format(" AND %s = %d ", fieldName, value));
		}
	}	
	
	
}

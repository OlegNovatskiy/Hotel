package com.hotel.components.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.hotel.components.entity.Apartment;
import com.hotel.components.entity.Attribute;
import com.hotel.components.entity.FilterApartments;
import com.hotel.components.interfaces.IApartment;
import com.mysql.jdbc.Statement;

@Repository
public class ApartmentDAO implements IApartment {

	private static final String QUERY_ADD_APARTMENT = "INSERT INTO kerpach_hotel.apartments (number, people_count, bed_count, rooms_count, price, image, description) VALUES ('%s',%d,%d,%d, %d,'%s', '%s')";
	private static final String QUERY_SAVE_ATTRIBUTES_OF_APARTMENT = "INSERT INTO kerpach_hotel.attributes (apartments_id ,attribute_id) VALUES (%d, %s)";
	private static final String QUERY_SELECT_APARTMENT = "SELECT * FROM kerpach_hotel.apartments WHERE id = %d";
	private static final String QUERY_SELECT_APARTMENTS = "SELECT apa.id, apa.number, apa.people_count, apa.bed_count, apa.rooms_count, apa.price, apa.occupied FROM kerpach_hotel.apartments AS apa";
	private static final String QUERY_SELECT_ATTRIBUTES = "SELECT atrt.id, atrt.title FROM kerpach_hotel.attributes_type AS atrt INNER JOIN attributes as atrs on atrs.attribute_id = atrt.id WHERE atrs.apartments_id = %d";

	public static class ApartmentMap implements RowMapper<Apartment> {

		@Override
		public Apartment mapRow(ResultSet rs, int rowNum) throws SQLException {

			Apartment apartment = new Apartment();
			apartment.setId(rs.getInt(1));
			apartment.setNumber(rs.getString(2));
			apartment.setPeopleCount(rs.getInt(3));
			apartment.setBedCount(rs.getInt(4));
			apartment.setRoomCount(rs.getInt(5));
			apartment.setPrice(rs.getInt(6));
			apartment.setBooking(rs.getBoolean(7));
			apartment.setDescription(rs.getString(8));
			return apartment;
		}

	}

	public static class ApartmentsMap implements RowMapper<Apartment> {

		@Override
		public Apartment mapRow(ResultSet rs, int rowNum) throws SQLException {

			Apartment apartment = new Apartment();
			apartment.setId(rs.getInt(1));
			apartment.setNumber(rs.getString(2));
			apartment.setPeopleCount(rs.getInt(3));
			apartment.setBedCount(rs.getInt(4));
			apartment.setRoomCount(rs.getInt(5));
			apartment.setPrice(rs.getInt(6));
			apartment.setBooking(rs.getBoolean(7));
			return apartment;
		}

	}

	@Autowired
	private JdbcTemplate jdbc;

	public static class AttributeMap implements RowMapper<Attribute> {

		@Override
		public Attribute mapRow(ResultSet rs, int rowNum) throws SQLException {

			Attribute attribute = new Attribute();
			attribute.setId(rs.getInt(1));
			attribute.setTitle(rs.getString(2));

			return attribute;
		}

	}

	@Override
	/**
	 * Save a apartment with hers attributes into db.
	 * 
	 * @param apartment
	 * @param attributes
	 * 
	 * @return generate id of apartment
	 */
	public Integer addApartment(Apartment apartment, String[] attributes) {

		String sqlApartment = String.format(QUERY_ADD_APARTMENT, apartment.getNumber(), apartment.getPeopleCount(),
				apartment.getBedCount(), apartment.getRoomCount(), apartment.getPrice(), apartment.getImage(), apartment.getDescription());

		KeyHolder keyHolder = new GeneratedKeyHolder();
		PreparedStatementCreator preStatement = new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

				return con.prepareStatement(sqlApartment, Statement.RETURN_GENERATED_KEYS);
			}
		};

		jdbc.update(preStatement, keyHolder);
		Integer generateIdApartment = keyHolder.getKey().intValue();

		for (String idAtrributes : attributes) {
			String sqlAttr = String.format(QUERY_SAVE_ATTRIBUTES_OF_APARTMENT, generateIdApartment, idAtrributes);
			jdbc.update(sqlAttr);
		}

		return generateIdApartment;

	}

	@Override
	public Apartment searchApartment(Integer idApartment) {

		String sqlApartment = String.format(QUERY_SELECT_APARTMENT, idApartment);
		String sqlAttributes = String.format(QUERY_SELECT_ATTRIBUTES, idApartment);
		Apartment apartment = jdbc.queryForObject(sqlApartment, new ApartmentMap());
		List<Attribute> attributes = jdbc.query(sqlAttributes, new AttributeMap());
		apartment.setAttributes(attributes);

		return apartment;

	}

	@Override
	public List<Apartment> searchApartments() {

		return jdbc.query(QUERY_SELECT_APARTMENTS, new ApartmentsMap());
	}

	@Override
	public List<Apartment> searchApartments(FilterApartments filter) {

		String query = designQuerySearchApartments(filter);
		return jdbc.query(query, new ApartmentsMap());
	}

	public String designQuerySearchApartments(FilterApartments filter) {

		StringBuilder query = new StringBuilder(QUERY_SELECT_APARTMENTS);
		Boolean useAnd = false;

		if (filter.getAttributes() != null && filter.getAttributes().length > 0) {
			query.append(" INNER JOIN attributes as attr on attr.apartments_id = apa.id ");
		}

		if (StringUtils.isNotBlank(filter.getNumber())) {

			query.append(String.format(" WHERE number = '%s' ", filter.getNumber()));
			return query.toString();
		}

		useAnd = addIntegerCondition(query, "people_count", filter.getPeopleCount(), useAnd);
		useAnd = addIntegerCondition(query, "bed_count", filter.getBedCount(), useAnd);
		useAnd = addIntegerCondition(query, "rooms_count", filter.getRoomCount(), useAnd);

		if (filter.getMinPrice() != null && filter.getMinPrice() > 0) {
			if (useAnd) {
				query.append(String.format(" AND %s > %d ", "price", filter.getMinPrice()));
			} else {
				query.append(String.format(" WHERE %s > %d ", "price", filter.getMinPrice()));
				useAnd = true;
			}
		}

		if (filter.getMaxPrice() != null && filter.getMaxPrice() > 0) {
			if (useAnd) {
				query.append(String.format(" AND %s < %d ", "price", filter.getMaxPrice()));
			} else {
				query.append(String.format(" WHERE %s < %d ", "price", filter.getMaxPrice()));
				useAnd = true;
			}
		}

		if (filter.getBooking() != null) {
			if (useAnd) {
				query.append(String.format(" AND %s = %s ", "booking", filter.getBooking()));
			} else {
				query.append(String.format(" WHERE %s = %s ", "booking", filter.getBooking()));
				useAnd = true;
			}
		}

		if (filter.getAttributes() != null && filter.getAttributes().length > 0) {
			StringBuilder attributes = new StringBuilder();
			for (Integer itr = 0; itr < filter.getAttributes().length; itr++) {
				if (itr < filter.getAttributes().length - 1) {
					attributes.append(String.format("%s, ", filter.getAttributes()[itr]));
				} else {
					attributes.append(String.format("%s ", filter.getAttributes()[itr]));
				}
			}

			if (useAnd) {
				query.append(String.format(" AND %s in ( %s )", "attribute_id", attributes.toString()));
			} else {
				query.append(String.format(" WHERE %s in ( %s )", "attribute_id", attributes.toString()));
			}
		}
		System.out.println(query);

		return query.toString();
	}

	private Boolean addIntegerCondition(StringBuilder query, String fieldName, Integer value, Boolean useAnd) {

		if (value != null && value > 0) {
			if (useAnd) {
				query.append(String.format(" AND %s = %d ", fieldName, value));
			} else {
				query.append(String.format(" WHERE %s = %d ", fieldName, value));
				useAnd = true;
			}
		}

		return useAnd;
	}

}

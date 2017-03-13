package com.hotel.components.services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hotel.components.entity.Attribute;
import com.hotel.components.interfaces.IAttributes;

@Repository
public class ApartmentAttributesDAO implements IAttributes{

	private static final String QUERY_SELECT_ATTRIBUTES = "SELECT at.id, at.title FROM kerpach_hotel.attributes_type AS at;";

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

	public List<Attribute> getAttributes() {

		return jdbc.query(QUERY_SELECT_ATTRIBUTES, new AttributeMap());

	}

}

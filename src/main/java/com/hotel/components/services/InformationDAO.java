package com.hotel.components.services;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hotel.components.entity.ContactInformations;
import com.hotel.components.interfaces.IInformation;

@Repository
public class InformationDAO implements IInformation{

	private static final String QUERY_SELECT_CONTACT_INFORMATION = "SELECT address, phones, emails FROM contact_informations LIMIT 1";
	private static final String QUERY_SELECT_GLOBAL_INFORMATION = "SELECT global_information FROM contact_informations LIMIT 1";
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public static class ContactInfoMap implements RowMapper<ContactInformations> {

		@Override
		public ContactInformations mapRow(ResultSet rs, int rowNum) throws SQLException {

			ContactInformations contactInformations = new ContactInformations();
			contactInformations.setAddress(rs.getString(1).split("/"));
			contactInformations.setPhoneNumbers(rs.getString(2).split("/"));
			contactInformations.setEmails(rs.getString(3).split("/"));
			return contactInformations;
		}

	}
	
	@Override
	public ContactInformations getContactInformation() {
		
		
		return jdbc.queryForObject(QUERY_SELECT_CONTACT_INFORMATION, new ContactInfoMap());
	}

	@Override
	public String getGlobalInformation() {
		return jdbc.queryForObject(QUERY_SELECT_GLOBAL_INFORMATION, String.class);
	}

}

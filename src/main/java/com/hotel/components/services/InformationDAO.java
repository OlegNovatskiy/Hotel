package com.hotel.components.services;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.hotel.components.entity.ContactInformations;
import com.hotel.components.entity.Information;
import com.hotel.components.interfaces.IInformation;

@Repository
public class InformationDAO implements IInformation {

	private static final String QUERY_SELECT_CONTACT_INFORMATION = "SELECT address, phones, emails FROM contact_informations LIMIT 1";
	private static final String QUERY_SELECT_GLOBAL_INFORMATION = "SELECT global_information FROM contact_informations LIMIT 1";
	private static final String QUERY_SELECT_ALL_INFORMATION = "SELECT address, phones, emails, global_information FROM contact_informations LIMIT 1";
	private static final String UPDATE_ALL_INFORMATION = "UPDATE contact_informations SET address = '%s', phones='%s', emails='%s', global_information='%s' WHERE id = 1 ";
	
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

	public static class AllInfoMap implements RowMapper<Information> {

		@Override
		public Information mapRow(ResultSet rs, int rowNum) throws SQLException {

			Information information = new Information();
			information.setAddress(rs.getString(1).split("/"));
			information.setPhoneNumbers(rs.getString(2).split("/"));
			information.setEmails(rs.getString(3).split("/"));
			information.setGlobalInformation(rs.getString(4));
			return information;
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

	@Override
	public Information getAllInformation() {
		return jdbc.queryForObject(QUERY_SELECT_ALL_INFORMATION, new AllInfoMap());
	}

	@Override
	public Integer setAllInformation(Information information) {

		jdbc.update(String.format(UPDATE_ALL_INFORMATION, String.join("/", information.getAddress()),
				String.join("/", information.getPhoneNumbers()), String.join("/", information.getEmails()),
				information.getGlobalInformation()));

		return 1;
	}

}

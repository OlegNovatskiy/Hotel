package com.hotel.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.components.entity.Apartment;
import com.hotel.components.entity.Attribute;
import com.hotel.components.entity.FilterApartments;
import com.hotel.components.interfaces.IApartment;
import com.hotel.components.interfaces.IAttributes;

@Service
public class ApartmentService {

	@Autowired
	private IAttributes iAttributes;

	@Autowired
	private IApartment iApartment;

	/**
	 * Saving a apartment with hers attributes into db.
	 * 
	 * @param apartment
	 * @param attributes
	 * @return
	 */
	public Integer addApartment(Apartment apartment, String[] attributes) {

		return iApartment.addApartment(apartment, attributes);
	}

	/**
	 * Return all type of attributes from db.
	 * 
	 * @return
	 */
	public List<Attribute> getAttributes() {

		return iAttributes.getAttributes();
	}

	/**
	 * Search apartment with attributes.
	 * 
	 * @param idApartment
	 * @return Apartment
	 */
	public Apartment searchApartment(Integer idApartment) {

		return iApartment.searchApartment(idApartment);
	}

	/**
	 * Search apartments without attributes
	 * 
	 * @return List<Apartment>
	 */
	public List<Apartment> searchApartments() {
		return iApartment.searchApartments();
	}
	
	/**
	 * Filter apartments without attributes 
	 * 
	 * @return List<Apartment>
	 */
	public List<Apartment> searchApartments(FilterApartments filter) {
		return iApartment.searchApartments(filter);
	}
}

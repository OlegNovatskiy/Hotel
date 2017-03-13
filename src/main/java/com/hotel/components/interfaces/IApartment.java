package com.hotel.components.interfaces;

import java.util.List;

import com.hotel.components.entity.Apartment;
import com.hotel.components.entity.FilterApartments;

public interface IApartment {

	public Integer addApartment(Apartment apartment, String[] attributes);

	public Apartment searchApartment(Integer idApartment);

	public List<Apartment> searchApartments();

	public List<Apartment> searchApartments(FilterApartments filter);

}

package com.hotel.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.components.entity.ContactInformations;
import com.hotel.components.interfaces.IInformation;

@Service
public class InformationService{

	@Autowired
	private IInformation iInformation;
	
	public ContactInformations getContactInformation() {
		return iInformation.getContactInformation();
	}

	public String getGlobalInformation() {
		return iInformation.getGlobalInformation();
	}

}

package com.hotel.components.interfaces;

import com.hotel.components.entity.ContactInformations;
import com.hotel.components.entity.Information;

public interface IInformation {

	public ContactInformations getContactInformation();
	
	public String getGlobalInformation();
	
	public Information getAllInformation();
	
	public Integer setAllInformation(Information information);
	
}

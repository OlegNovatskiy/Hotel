package com.hotel.components.entity;

public class Information {
	private String[] address;
	private String[] phoneNumbers;
	private String[] emails;
	private String globalInformation;
	
	
	
	public String getGlobalInformation() {
		return globalInformation;
	}

	public void setGlobalInformation(String globalInformation) {
		this.globalInformation = globalInformation;
	}

	public String[] getAddress() {
		return address;
	}

	public void setAddress(String[] address) {
		this.address = address;
	}

	public String[] getPhoneNumbers() {
		return phoneNumbers;
	}

	public void setPhoneNumbers(String[] phoneNumbers) {
		this.phoneNumbers = phoneNumbers;
	}

	public String[] getEmails() {
		return emails;
	}

	public void setEmails(String[] emails) {
		this.emails = emails;
	}

}


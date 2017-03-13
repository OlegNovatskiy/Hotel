package com.hotel.components.entity;

import java.sql.Date;

public class Booking {

	private Integer id;
	private Date beginDate;
	private Date finishDate;
	private String firstName;
	private String lastName;
	private String middleName;
	private String phoneNumber;
	private String email;
	private String numberApartment;
	private Integer idApartment;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNumberApartment() {
		return numberApartment;
	}

	public void setNumberApartment(String numberApartment) {
		this.numberApartment = numberApartment;
	}

	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public Integer getIdApartment() {
		return idApartment;
	}

	public void setIdApartment(Integer idApartment) {
		this.idApartment = idApartment;
	}

	@Override
	public String toString() {
		return String.format("Id: %d - PIB: %s %s %s; Phone: %s; Room: %s; Date begin: %s; Date end: %s; Email: %s.",
				this.id, this.firstName, this.lastName, this.middleName, this.phoneNumber, this.numberApartment,
				this.getBeginDate().toString(), this.getFinishDate().toString(), this.getEmail());
	}

}

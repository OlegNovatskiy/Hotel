package com.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.components.entity.Booking;
import com.hotel.services.BookingService;

@Controller
@RequestMapping("/registry")
public class BookingController {
	
	@Autowired
	private BookingService bookingService;

	@RequestMapping(value = {"/booking", "/booking/{numberRoom}"}, method = RequestMethod.GET)
	public ModelAndView displayBookingForm(@PathVariable(value = "numberRoom", required=false) String numberApartment, ModelAndView model){
		
		model.setViewName("registry/booking/booking");
		Booking booking = new Booking();
		booking.setNumberApartment(numberApartment);
		model.addObject("booking", booking);
		
		return model;		
	}
	
	@RequestMapping(value = "/booking", method = RequestMethod.POST)
	public ModelAndView sendBookingData(@ModelAttribute Booking booking, ModelAndView model){
		
		Integer code = bookingService.bookingApartment(booking); 
		
		if(code == 1){
			return new ModelAndView("redirect:bookedApartments");
		}
		if(code == 2 || code ==3){
			model.addObject("errorNumberApartment", code == 2 ? "Цей номер зараз використовується" : "Такого номеру не існує");
			model.setViewName("registry/booking/booking");
			model.addObject("booking", booking);
		}
		
		return model;		
	}
	
	@RequestMapping(value="/bookedApartments", method = RequestMethod.GET)
	public ModelAndView displayBookedApartments(ModelAndView model){
		
		model.setViewName("registry/booking/bookedApartments");
		model.addObject("bookedItems", bookingService.searchBookedItems());
		
		return model;		
	}
	
}

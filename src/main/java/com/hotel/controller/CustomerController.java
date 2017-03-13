package com.hotel.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.components.entity.Booking;
import com.hotel.components.entity.CustomerFilterApartments;
import com.hotel.services.ApartmentService;
import com.hotel.services.CustomerApartmentService;
import com.hotel.services.InformationService;

@RequestMapping("/customer")
@Controller
public class CustomerController {

	private static final String ATTRIBUTES = "attributes";
	private static final String CONTACT_INFORMATION = "contactInformation";
	private static final String FILTER_APARTMENT = "filterApartment";
	private static final String BOOKING = "booking";
	
	@Autowired
	private ApartmentService apartmentService;
	
	@Autowired
	private CustomerApartmentService customerApartmentService;
	
	@Autowired
	private InformationService informationService;
	
	@RequestMapping(value = {"","/", "/home"}, method=RequestMethod.GET)
	public ModelAndView index(ModelAndView model){
		
		model.setViewName("customer/home");
		model.addObject(ATTRIBUTES, apartmentService.getAttributes());
		model.addObject("globalInformation", informationService.getGlobalInformation());
		model.addObject(CONTACT_INFORMATION, informationService.getContactInformation());
		model.addObject(FILTER_APARTMENT, new CustomerFilterApartments());
		
		return model;
	}
	
	@RequestMapping(value="/booking", method = RequestMethod.PUT)
	public String bookingRegistry(ModelAndView model, @ModelAttribute Booking booking){
		
		Byte status = customerApartmentService.bookingApartment(booking);
		System.out.println(booking.getNumberApartment());
		if(status == 1){
			
			return "redirect:/customer/success/" + booking.getNumberApartment();
		}
		if(status == 2){
			
			return "redirect:/customer/booking";
		}else{
			
			return "redirect:/customer/home";
		}
		
	}
	
	@RequestMapping(value="/booking", method = { RequestMethod.POST})
	public ModelAndView booking(ModelAndView model, HttpServletRequest request){
		
		Booking bookingObject = new Booking();
		bookingObject.setBeginDate(Date.valueOf(request.getParameter("beginDate")));
		bookingObject.setFinishDate(Date.valueOf(request.getParameter("finishDate")));
		bookingObject.setIdApartment(Integer.valueOf(request.getParameter("idApartment")));
		bookingObject.setNumberApartment(request.getParameter("numberApartment"));
		
		model.setViewName("customer/booking/booking");
		model.addObject(CONTACT_INFORMATION, informationService.getContactInformation());
		model.addObject(BOOKING, bookingObject);
		return model;
	}
	
	@RequestMapping(value="/success/{number}", method = RequestMethod.GET)
	public ModelAndView bookingSuccess(ModelAndView model, @PathVariable("number") String number){
		
		model.addObject("number", number);
		model.setViewName("customer/booking/success");
		model.addObject(CONTACT_INFORMATION, informationService.getContactInformation());
		model.addObject(FILTER_APARTMENT, new CustomerFilterApartments());
		model.addObject(ATTRIBUTES, apartmentService.getAttributes());
		
		return model;
	}
	
	@RequestMapping(value = "/apartment/{number}", method=RequestMethod.GET)
	public ModelAndView apartments(ModelAndView model, @PathVariable("number") String number){
		
		model.addObject("apartment", customerApartmentService.getApartment(number));
		model.setViewName("customer/apartment");
		model.addObject(CONTACT_INFORMATION, informationService.getContactInformation());
		model.addObject(FILTER_APARTMENT, new CustomerFilterApartments());
		model.addObject(ATTRIBUTES, apartmentService.getAttributes());
		
		return model;
	}
	
	@RequestMapping(value = "/apartments", method=RequestMethod.POST)
	public ModelAndView apartments(HttpServletRequest request,  ModelAndView model, @ModelAttribute CustomerFilterApartments filterApartment){
		
		filterApartment.setAttributes(request.getParameterValues("attrs"));
		model.addObject("apartments", customerApartmentService.getApartmens(filterApartment));
		model.setViewName("customer/apartments");
		model.addObject(CONTACT_INFORMATION, informationService.getContactInformation());
		model.addObject(ATTRIBUTES, apartmentService.getAttributes());
		model.addObject(FILTER_APARTMENT, filterApartment);
		
		return model;
	}
	
	@RequestMapping(value = "/apartments", method=RequestMethod.GET)
	public ModelAndView apartments(ModelAndView model){
		
		model.setViewName("customer/apartments");
		model.addObject(CONTACT_INFORMATION, informationService.getContactInformation());
		model.addObject(ATTRIBUTES, apartmentService.getAttributes());
		model.addObject(FILTER_APARTMENT, new CustomerFilterApartments());
		
		return model;
	}
}

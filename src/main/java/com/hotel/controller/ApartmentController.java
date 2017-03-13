package com.hotel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.components.entity.Apartment;
import com.hotel.components.entity.Attribute;
import com.hotel.components.entity.FilterApartments;
import com.hotel.services.ApartmentService;

@Controller
@RequestMapping("/registry")
public class ApartmentController {

	private static final String ATTRIBUTES = "attributes";
	
	@Autowired
	private ApartmentService apartmentService;

	@RequestMapping(value = { "/home", "/", "" }, method = RequestMethod.GET)
	public ModelAndView index(Model model) {

		ModelAndView modelandview = new ModelAndView();

		modelandview.setViewName("registry/home");

		return modelandview;
	}

	@RequestMapping(value = { "/apartments" }, method = RequestMethod.GET)
	public ModelAndView apartments(Model model) {

		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("registry/apartment/apartments");

		model.addAttribute(ATTRIBUTES, apartmentService.getAttributes());
		model.addAttribute("apartments", apartmentService.searchApartments());

		return modelandview;
	}

	@RequestMapping(value = { "/apartments" }, method = RequestMethod.POST)
	public ModelAndView apartments(HttpServletRequest request, FilterApartments filter, Model model) {

		ModelAndView modelandview = new ModelAndView("registry/apartment/apartments");

		filter.setAttributes(request.getParameterValues("attrs"));
		model.addAttribute(ATTRIBUTES, apartmentService.getAttributes());
		model.addAttribute("apartments", apartmentService.searchApartments(filter));

		return modelandview;
	}

	@RequestMapping(value = { "/apartment/add" }, method = RequestMethod.GET)
	public ModelAndView displayFormAddApartments(Model model) {

		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("registry/apartment/addApartment");

		model.addAttribute("apartment", new Apartment());
		model.addAttribute("attributes", apartmentService.getAttributes());

		return modelandview;
	}

	@RequestMapping(value = { "/apartment/add" }, method = RequestMethod.POST)
	public ModelAndView addApartments(@ModelAttribute Apartment apartment,
			@ModelAttribute(value = ATTRIBUTES) ArrayList<Attribute> attributes, Model model,
			HttpServletRequest request) {

		Integer idApartment = apartmentService.addApartment(apartment, request.getParameterValues("attrs"));

		if (idApartment != 0 && idApartment != null) {

			return new ModelAndView(String.format("redirect:%d", idApartment));
		} else {

			ModelAndView mymodel = new ModelAndView();
			mymodel.setViewName("registry/apartment/addApartment");
			model.addAttribute("apartment", apartment);
			model.addAttribute(ATTRIBUTES, attributes);

			return mymodel;
		}

	}

	@RequestMapping(value = { "/apartment/edit/{id}" }, method = RequestMethod.GET)
	public ModelAndView editApartments(@PathVariable("id") Integer id, Model model) {

		ModelAndView modelandview = new ModelAndView();

		modelandview.setViewName("registry/apartment/editApartments");

		return modelandview;
	}

	@RequestMapping(value = { "/apartment/{id}" }, method = RequestMethod.GET)
	public ModelAndView displayApartments(@PathVariable(value = "id") Integer idApartment, Model model) {

		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("registry/apartment/displayApartment");

		model.addAttribute("apartment", apartmentService.searchApartment(idApartment));

		return modelandview;
	}

}

package com.hotel.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;
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
	public ModelAndView addApartments(@ModelAttribute("apartment") Apartment apartment,
			@ModelAttribute(value = ATTRIBUTES) ArrayList<Attribute> attributes, Model model,
			HttpServletRequest request, HttpServletResponse response) {

		String nameImage = null;
		try {
			nameImage = uploadPhoto(request);
			apartment.setImage(nameImage);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

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

	private String uploadPhoto(HttpServletRequest request) throws ServletException, IOException {

		final Part filePart = request.getPart("imageApartment");
		final String fileExtension = FilenameUtils
				.getExtension(Paths.get(filePart.getSubmittedFileName()).getFileName().toString());
		String source = "src/main/webapp/Images/";
		String fileName = String.format("%s.%s", UUID.randomUUID().toString(), fileExtension);

		OutputStream out = null;
		InputStream filecontent = null;

		out = new FileOutputStream(new File(String.format("%s%s", source, fileName)));
		filecontent = filePart.getInputStream();

		int read = 0;
		final byte[] bytes = new byte[1024];

		while ((read = filecontent.read(bytes)) != -1) {
			out.write(bytes, 0, read);
		}

		out.close();
		filecontent.close();

		return fileName;
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

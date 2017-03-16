package com.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.components.entity.Information;
import com.hotel.services.InformationService;

@Controller
@RequestMapping("/registry")
public class InformationController {
	
	@Autowired
	private InformationService informationService;
	
	
	/**
	 * Return contact and global information about hotel.
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/information", method = RequestMethod.GET)
	public ModelAndView showInformation(ModelAndView model){
		
		model.setViewName("registry/information/info");
		model.addObject("allInformation", informationService.getAllInformation());
		
		return model;
	}
	
	
	/**
	 * Update contact and global information about hotel.
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/information", method = RequestMethod.PUT)
	public String updateInformation(@ModelAttribute("allInformation") Information information){
		
		informationService.setAllInformation(information);
		
		return "redirect:information";
	}
}

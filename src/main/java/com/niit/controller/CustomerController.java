package com.niit.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.model.Customer;
import com.niit.model.User;
import com.niit.service.CustomerService;

@Controller
public class CustomerController {

	 
	@Autowired
	private CustomerService customerService;
	 
	@RequestMapping("/registrationform")
	public String getRegistrationForm(Model model)
	{
		model.addAttribute("customer",new Customer());
	
		return "registration";
	}
	
		
	@RequestMapping("/savecustomer")
	public String registerCustomer(@Valid @ModelAttribute(name="customer") Customer customer,BindingResult result,Model model)
	{   
		if(result.hasErrors())
		{
	   
			return "registration";
	 
		}
		
		String username = customer.getUser().getUsername();
        User user =customerService.validateUser(username);	   
		
		
		String email = customer.getEmail();
		Customer customer1 =customerService.validateCustomer(email);
		if(customer1!=null||user!=null)
		{   
			model.addAttribute("duplicateUser","Username already Exist");
			model.addAttribute("duplicateEmail","Email address already exist");
			return "registration";
		}
		
		customerService.registerCustomer(customer);
		return "login";
	}
	
	 
}

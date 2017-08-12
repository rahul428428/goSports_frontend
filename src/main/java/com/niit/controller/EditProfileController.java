package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.model.Customer;
import com.niit.service.CustomerService;

@Controller
public class EditProfileController {

	@Autowired
	private CustomerService customerService;

	@RequestMapping("/editprofile")
	public String editProfile(Model model) {
		
		User user =(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String username = user.getUsername();
		
		Customer customerObj = customerService.getCustomerByUsername(username);
		 model.addAttribute("customerObj",customerObj);
		
		return "editprofile";
		
	}

	@RequestMapping("/updatecustomer")
	public String updateCustomer(@RequestParam String firstname, @RequestParam String lastname ,@RequestParam String mobilenumber, 
			                   @RequestParam String password, @RequestParam String bstreet,
			                   @RequestParam String bapartment,@RequestParam String bcity,
			                   @RequestParam String bstate, @RequestParam String bcountry,
			                   @RequestParam String bzip,@RequestParam String sstreet,
			                   @RequestParam String sapartment,@RequestParam String scity,
			                   @RequestParam String sstate, @RequestParam String scountry,
			                   @RequestParam String szip){
		
		 
		         User user =(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		         
		         String username = user.getUsername();
		        
		         
		         Customer customer =customerService.getCustomerByUsername(username);
		         customer.setFirstname(firstname); 
		         customer.setLastname(lastname);
		         customer.setPhone(mobilenumber);
		         customer.getBillingAddress().setStreetname(bstreet);
                 customer.getBillingAddress().setApartmentnumber(bapartment);	
                 customer.getBillingAddress().setCity(bcity);
                 customer.getBillingAddress().setState(bstate);
                 customer.getBillingAddress().setCountry(bcountry);
                 customer.getBillingAddress().setZipcode(bzip);
                 
                 customer.getShippingAddress().setStreetname(sstreet); 
                 customer.getShippingAddress().setApartmentnumber(sapartment);
                 customer.getShippingAddress().setCity(scity);
                 customer.getShippingAddress().setState(sstate);
                 customer.getShippingAddress().setCountry(scountry);
                 customer.getShippingAddress().setZipcode(szip);
                 customer.getUser().setPassword(password);
                 
                 customerService.updateUser(customer.getUser());
              
                 customerService.updateCustomer(customer);
                 
		       return "index";
	}

}

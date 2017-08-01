package com.niit.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.model.Customer;
import com.niit.model.User;
import com.niit.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@RequestMapping("/registrationform")
	public String getRegistrationForm(Model model) {

		model.addAttribute("customer", new Customer());
		return "registration";
	}

	@RequestMapping("/savecustomer")
	public String registerCustomer(@Valid @ModelAttribute(name = "customer") Customer customer, BindingResult result,
			Model model) {

		if (result.hasErrors()) {

			return "registration";

		}

		String username = customer.getUser().getUsername();
		User user = customerService.validateUser(username);

		String email = customer.getEmail();
		Customer customer1 = customerService.validateCustomer(email);
		if (customer1 != null || user != null) {
			model.addAttribute("duplicateUser", "Username already Exist");
			model.addAttribute("duplicateEmail", "Email address already exist");
			return "registration";
		}

		customerService.registerCustomer(customer);
		return "login";
	}

	@RequestMapping("/editprofile")
	public String editProfile() {
		return "editprofile";
	}

	@RequestMapping("/forgotpasswordform")
	public String forgotPassword() {

		return "forgotpassword";

	}

	@RequestMapping("/securityquestionform")
	public String securityQuestion(@RequestParam String username, Model model) {
		Customer customer = customerService.getCustomerByUsername(username);

		if (customer == null) {

			model.addAttribute("uname", "User does not Exist");

			return "forgotpassword";

		}

		model.addAttribute("customer", customer);
		return "securityquestionanswer";

	}

	@RequestMapping("/updatepassword")
	public String updatePassword(@RequestParam String username, @RequestParam String securityanswer,
			@RequestParam String pswd, Model model, @ModelAttribute(name = "customer") Customer customer) {

		Customer customer1 = customerService.getCustomerByAnswer(securityanswer);
		Customer customer2 = customerService.getCustomerByUsername(username);
		
		if(customer2== null)
		{
			model.addAttribute("uname", "User does not Exist");
			return "securityquestionanswer";
		}

		if (customer1 == null) {
			model.addAttribute("useranswer", "Security answer does not match !!");
			return "securityquestionanswer";

		}
		
		customerService.updateUser(pswd, username);
		return "login" ;

	}

}

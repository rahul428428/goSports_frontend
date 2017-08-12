package com.niit.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

  @Controller 	
  public class HomeController {

  @RequestMapping({"/","/index"})
  public String home()
  {
 	 return "index";
  }	   
    
  @RequestMapping("/registration")
  public String registrationPage()
   {
		
	 return "registration";
	 
   }
  
  
  @RequestMapping("/login")
  public String loginPage()
  {
	  return "login";
  }
  
  @RequestMapping("/navigationbar")
  public String navigationBar()
  {
	  return "responsivenavbar";
  }
 


}
	
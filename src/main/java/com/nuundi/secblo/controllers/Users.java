package com.nuundi.secblo.controllers;

import java.io.IOException;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nuundi.secblo.models.User;
import com.nuundi.secblo.services.UserService;
import com.nuundi.secblo.validators.UserValidator;



@Controller
public class Users {
	private final UserService userServe;
	//private final PoolRepository poolRepo;
	// NEW
	private final UserValidator userValidate;  
	
	public Users(UserService userServe,  UserValidator userValidate) {
		this.userServe = userServe;
		this.userValidate = userValidate;
		//this.poolRepo = poolRepo;
	}
	
	@RequestMapping("/registration")
	public String registerForm(@ModelAttribute("user") User user) {
		System.out.println("Testing registration page!!!!!! ");
		return "registrationPage.jsp";
	}
	
	 @RequestMapping(value="/registration", method=RequestMethod.POST)
	    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
	    	System.out.println("Users.java - registration POST");
	    	userValidate.validate(user,  result);
	    	// if result has errors, return the registration page (don't worry about validations just now)
	    	if (result.hasErrors()) {
	    		return "registrationPage.jsp";
	    	}
	    	User a = userServe.findByEmail(user.getEmail());
	    	if (a != null) {
	    		model.addAttribute("duplicate","E-mail already exists in DB.");
	    		return "registrationPage.jsp";
	    	}
	        // else, save the user in the database, save the user id in session, and redirect them to the home route
	    	User u = userServe.registerUser(user);
	    	System.out.println("Users.java - registration POST - Registered User ID: "+u.getId());
	    	session.setAttribute("userId", u.getId());	    	
	    	return "redirect:/";
	   
	    }
	 
	    // Home
	    @RequestMapping("/")
	    public String home(HttpSession session, Model model) {
//	    	System.out.println("Users.java - home");
//	        // get user from session, save him in the model and return the home page  	    	
//	    	Long userId = (Long) session.getAttribute("userId");	    	
//	    	User u = userServe.findUserById(userId);
//	    	model.addAttribute("user", u);
//	    	return "homepage.jsp";	 
	    	
	    	System.out.println("Users.java - home");
	        // get user from session, save him in the model and return the home page  	    	
	    	Long userId = (Long) session.getAttribute("userId");
	    	if (userId != null) { 
	    	User u = userServe.findUserById(userId);
	    	model.addAttribute("user", u); // save in model
	    	System.out.println(u + " Home"); 	 
	    	return "homepage.jsp"; 	
 			} else {
 				return "homepage.jsp"; 
 			}
	    }
	    
	    // Logout
	    @RequestMapping("/logout")
	    public String logout(HttpSession session) {
	    	System.out.println("Users.java - logout");
	        // invalidate session
	    	session.invalidate();
	        // redirect to home page
	    	return "redirect:/";
	    }
	    
	    // Login 
	    @RequestMapping(value="/login", method=RequestMethod.POST)
	    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, @ModelAttribute("user") User user) {
	        // if the user is authenticated, save their user id in session
	    	boolean isAuthenticated = userServe.authenticateUser(email,  password);
	    	if (isAuthenticated) {
	    		User u = userServe.findByEmail(email);
	    		System.out.println("Users.java - login POST - Login User ID: "+u.getId());
	    		session.setAttribute("userId", u.getId());	    	
	        	return "redirect:/";	        	
		    	}  else { // else, add error messages and return the login page
		    		model.addAttribute("error", "Invalid Credentials. Please try again.");
		    		System.out.println("Invalid credentials - return to registration page");
		    		return "registrationPage.jsp";
//		    		return "homepage.jsp";
		    	}
	    }
	    
	    // Methods to access different contents
 		@RequestMapping(value = "/vulnhub/jarbas1", method = RequestMethod.GET)
 		public String Jarbas1(HttpSession session, Model model) throws IOException {
 			// System.out.println("User - Jarbas1");
 	        // get user from session
 			Long userId = (Long) session.getAttribute("userId");
 			// System.out.println(userId + "Jarbas1");
 			if (userId != null) { 	    	
 	    	User u = userServe.findUserById(userId);
 	    	model.addAttribute("user", u);
 	    	System.out.println(u + " Jarbas1"); 	 
 			return "jarbas1.jsp";  	
 			} else {
 				return "jarbas1.jsp"; 
 			}

 		}   	
 		
 		@RequestMapping(value = "/vulnhub/bsides2018vancouver", method = RequestMethod.GET)
 		public String Bsides2018vancouver(HttpSession session, Model model) throws IOException {	
 	        // get user from session
 			Long userId = (Long) session.getAttribute("userId");
 			// System.out.println(userId + "Bsides2018vancouver");
 			if (userId != null) { 	    	
 	    	User u = userServe.findUserById(userId);
 	    	model.addAttribute("user", u);
 	    	System.out.println(u + " Bsides2018vancouver"); 	 
 	    	return "bsides2018vancouver.jsp";  	
 			} else {
 				return "bsides2018vancouver.jsp"; 
 			}
 		}
	    
}

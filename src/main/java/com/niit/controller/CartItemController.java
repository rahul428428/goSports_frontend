package com.niit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Customer;
import com.niit.model.Product;
import com.niit.service.CartItemService;
import com.niit.service.CustomerService;
import com.niit.service.ProductService;

@Controller
public class CartItemController {

	@Autowired
	private ProductService productService;
   
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CartItemService cartItemService;
	
	
	
	@RequestMapping("/cartaddtocart{id}")
	public String addCartItem(@PathVariable int id, @RequestParam int units,Model model)
	{
		
		Product product =  productService.getProductById(id);
		
		
		// To get User(logged in) Details , get Principal   object  from securitycontextholder
		User user =(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String username = user.getUsername();
		
		Customer customer = customerService.getCustomerByUsername(username);
	
		Cart cart = customer.getCart();
		
		List<CartItem>  cartItems = cart.getCartItems();
		System.out.println(cart.getCartItems().size());
		
		//check If purchased product is already existing in the cartitem  table; 
		for(CartItem  cartItem:cartItems)
		{
				
			if(cartItem.getProduct().getId()==id)
			{
				//product id in table (productid in database) == id(input)
				 
				cartItem.setQuantity(units);
				cartItem.setTotalPrice(product.getPrice()*units);
				cartItemService.addCartItem(cartItem); // update cartitem units & totalprice;				 
				return "redirect:/cartgetcart";
			}
				
		}
		
		CartItem cartItem = new CartItem();
		
		cartItem.setQuantity(units);
		cartItem.setTotalPrice(product.getPrice() * units);
		cartItem.setProduct(product);  //product_id column in cartItem table
		cartItem.setCart(cart); // cart_id column in cartItem table
		cartItemService.addCartItem(cartItem); //insert
		return "redirect:/cartgetcart";
		
	}
	
	
	@RequestMapping("/cartgetcart")
	public String  getCart(Model model)
	{
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String username =  user.getUsername();
	   
		Customer customer = customerService.getCustomerByUsername(username);
		
		Cart cart = customer.getCart();
		
		model.addAttribute("cart",cart);
		
		return "cart";
	}
	
	
	@RequestMapping("/cart_removecartitem{cartItemId}")
	public String removeCartItem(@PathVariable int cartItemId,Model model )
	{
		
		 cartItemService.removeCartItem(cartItemId);

			User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			String username =  user.getUsername();
		   
			Customer customer = customerService.getCustomerByUsername(username);
			
			Cart cart = customer.getCart();
			
			model.addAttribute("cart",cart);
			
			return "cart";
		 
	}
	
	@RequestMapping("/cart_clearcart{cartId}")
	public String removeAllCartItems(@PathVariable int cartId,Model model)
	{
		
		cartItemService.removeAllCartItems(cartId);

		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String username =  user.getUsername();
	   
		Customer customer = customerService.getCustomerByUsername(username);
		
		Cart cart = customer.getCart();
		
		model.addAttribute("cart",cart);
		
		return "cart";
		
	}
	
	
	
}
 

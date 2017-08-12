package com.niit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Customer;
import com.niit.model.CustomerOrder;
import com.niit.model.Product;
import com.niit.model.ShippingAddress;
import com.niit.service.CartItemService;
import com.niit.service.CustomerOrderService;
import com.niit.service.CustomerService;
import com.niit.service.ProductService;

@Controller
public class CustomerOrderController {

	@Autowired
	private CustomerOrderService customerOrderService;

	@Autowired
	private CartItemService cartItemService;

	@Autowired
	private ProductService productService;
	
	@Autowired 
	CustomerService customerService;

	@RequestMapping("/cartshippingaddressform{cartId}")
	public String getShippingAddress(@PathVariable int cartId, Model model) {
		Cart cart = cartItemService.getCart(cartId);
		Customer customer = cart.getCustomer();
		model.addAttribute("shipingAddress", customer.getShippingAddress());
		model.addAttribute("cartid", cartId);
		return "shippingaddressform";

	}

	@RequestMapping("/cartorder{cartId}")
	public String creatOrder(@PathVariable int cartId, @ModelAttribute ShippingAddress shippingAddress, Model model) {
		Cart cart = cartItemService.getCart(cartId);
		Customer customer = cart.getCustomer();
		customer.setShippingAddress(shippingAddress);
		cart.setCustomer(customer);
		CustomerOrder customerOrder = customerOrderService.createOrder(cart);
		model.addAttribute("order", customerOrder);
		model.addAttribute("cartid", cartId);
		model.addAttribute("cart", cart);
		return "orderdetails";

	}

	@RequestMapping("/cartconfirm{id}")
	public String confirm(@ModelAttribute CustomerOrder customerOrder, @PathVariable int id) {
		int qty = 0; // purchased quantity by user
		int prodId = 0; // product id
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		String username = user.getUsername();

		Customer customer = customerService.getCustomerByUsername(username);
		
		Cart  cart = customer.getCart();
		List<CartItem> cartItems = cart.getCartItems();

		for (CartItem cartItem : cartItems) {

			qty = cartItem.getQuantity(); // Finding total quantities purchased
											// by user.
			Product product = cartItem.getProduct();
            
			int ProductQuantity = product.getQuantity();
			
			if(qty==ProductQuantity)
			{
				product.setQuantity(0);
			}
            
			if(qty!=ProductQuantity)
			{
			product.setQuantity(ProductQuantity - qty);
			}
			
			productService.updateProduct(product);

		}

		cartItemService.removeAllCartItems(id);
		return "thanks";
	}

}

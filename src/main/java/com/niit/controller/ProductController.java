package com.niit.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.service.ProductService;

@Controller
public class ProductController {
	
     
  
	@Autowired
   	private ProductService productService ;
           
    
     
	@RequestMapping("/admin_getproductform")
	public String getProductForm(Model model)
	{   
		List<Category> categories = productService.getAllCategories();
		model.addAttribute("categories",categories);
		model.addAttribute("product",new Product()); // Product product =new Product();
		return "productform";
	}

	@RequestMapping("/saveproduct")
	public String saveProduct(@Valid @ModelAttribute(name="product") Product product ,BindingResult result,Model model)
	{   
		if(result.hasErrors())
		{    List<Category> categories = productService.getAllCategories();
		     model.addAttribute("categories",categories);
			 return "productform";
		}
		productService.saveProduct(product);
		
		MultipartFile image = product.getImage(); 
		Path path = Paths.get("C:\\Users\\My Pc\\workspace\\ecommerce\\src\\main\\webapp\\WEB-INF\\resources\\images\\" + product.getId() + ".png");
		
					
		try{
                File file = new File(path.toString());				
				image.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
	
		return "redirect:/getallproducts" ;
	}
	
	@RequestMapping("/getallproducts")
	public String getAllProducts(Model model)
	{
		List<Product> products =productService.getAllProducts();
		List<Category> categories =productService.getAllCategories();
		model.addAttribute("categories",categories);
		model.addAttribute("products",products); // 1st Parameter is Key and 2nd Parameter is value;
		return "productlist";
	}
	
	@RequestMapping("/viewproduct{id}")
	public String getProductById(@PathVariable int id,Model model)
	{
		Product product = productService.getProductById(id);
		model.addAttribute("product",product);
		return "viewproduct";
		
	}
	
	@RequestMapping("/deleteproduct/{id}")
	public String deleteProduct(@PathVariable int id)
	{
		productService.deleteProduct(id);
		
		Path path =Paths.get("C:\\Users\\My Pc\\workspace\\ecommerce\\src\\main\\webapp\\WEB-INF\\resources\\images\\" + id + ".png");
		
		if(Files.exists(path))
		{
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			
		}
		return "redirect:/getallproducts";
	}
	
	@RequestMapping("/admin_geteditform{id}")
	public String getEditForm(@PathVariable int id,Model model)
	{
		Product product =productService.getProductById(id);
		List<Category> categories =productService.getAllCategories();
		model.addAttribute("categories",categories);
		model.addAttribute("productObj",product);
		return "editform";
	}
	
	@RequestMapping("/editproduct")
	public String editProduct(@Valid @ModelAttribute(name="productObj") Product product,BindingResult result , Model model)
	{ 
	  if(result.hasErrors())
	  {   
		  List<Category> categories = productService.getAllCategories();
		  model.addAttribute("categories",categories);
		  return "editform";
	  }
	  
	    productService.updateProduct(product); 
	  
		MultipartFile image = product.getImage(); 
		Path path = Paths.get("C:\\Users\\My Pc\\workspace\\ecommerce\\src\\main\\webapp\\WEB-INF\\resources\\images\\" + product.getId() + ".png");
		
					
		try{
              File file = new File(path.toString());
            
				image.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
	  		 	  
	  return "redirect:/getallproducts"; //redirecting to handler get all products to retrieve left products 
	  
	}
	
	@RequestMapping("searchbyCategory{cid}")
	public String selectByCategory(@PathVariable int cid,Model model)
	{
		List<Product> products = productService.getProductByCategory(cid);
	    model.addAttribute("products",products);
		 return "productlist";
	}
	
	
	
	@RequestMapping("/searchproduct")
	public String searchProduct(@RequestParam String SearchKeyword,Model model)
	{
		List <Product> products =productService.getAllProducts();
		model.addAttribute("products",products);
		 
		 model.addAttribute("searchCondition",SearchKeyword);		
	     return "productlist";
		 
	}
	
	
	
}

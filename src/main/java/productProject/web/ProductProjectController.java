package productProject.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductProjectController {

	@Autowired
	ProductProjectService service;

	@Autowired
	IncludeValidator inval;


	@RequestMapping(value = { "/product/new" , "addproduct.html"} , method = RequestMethod.GET)
	public ModelAndView addProduct() {
		ModelAndView moView = new ModelAndView("productAddPage");
		moView.addObject("product" , new Product());
		
		return moView;
	}
	
	@RequestMapping(value = "/product/add" , method = RequestMethod.POST)
	public ModelAndView addNewProduct(@Valid @ModelAttribute Product product , BindingResult result) {
		ModelAndView moView = new ModelAndView();
		moView.addObject("product" , product);

		if(result.hasErrors() == false) {
			moView.setViewName("list");
			service.createProduct(product);
			moView.addObject("products" , service.findAllProducts());
		}else {

			moView.setViewName("productAddPage");
		}
		return moView;
	}
	
	@RequestMapping(value = "/product/accessory/add" , method = RequestMethod.POST)
	public ModelAndView addAccessoryToProduct(@Valid @ModelAttribute Accessory accessory , BindingResult result) {
		ModelAndView moView = new ModelAndView("ViewProductPage");
		inval.validate(accessory, result);
		if(result.hasErrors() == true) {
			moView.addObject("accessory" , accessory);
		}else {
			service.createAccessory(accessory);
			Accessory nAccessory = new Accessory();
			moView.addObject("accessory" , nAccessory);
		}
		
		Product product = service.findProductById(accessory.getProduct().getId());
		moView.addObject("product" , product);
		
		return moView;
	}
	
	@RequestMapping(value = { "/product/view/{id}" , "/product/{id}"} , method = RequestMethod.GET)
	public ModelAndView viewProduct(@PathVariable long id) {
		ModelAndView moView = new ModelAndView("ViewProductPage");
		Product product = service.findProductById(id);
		Accessory accessory = new Accessory();
		moView.addObject("product" , product);
		moView.addObject("accessory" , accessory);
		
		return moView;
	}
	@RequestMapping(value = "/product/accessory/delete/{productId}/{accessoryId}" , method = RequestMethod.GET)
	public ModelAndView deleteAccessory(@PathVariable long productId , @PathVariable long accessoryId) {
		ModelAndView moView = new ModelAndView("ViewProductPage");
		service.deleteAccessory(accessoryId);
		Product product = service.findProductById(productId);
		Accessory accessory = new Accessory();
		
		moView.addObject("product" , product);
		moView.addObject("accessory" , accessory);
		
		return moView;
	}
	
	@RequestMapping(value = {"/list" , "list.html"} , method = RequestMethod.GET)
	public ModelAndView listOfProducts() {
		ModelAndView moView = new ModelAndView("list");
		moView.addObject("products" , service.findAllProducts());
		
		return moView;
	}
	
	@RequestMapping(value = "/product/delete/{id}" , method = RequestMethod.GET)
	public ModelAndView deleteProduct(@PathVariable long id) {
		ModelAndView moView = new ModelAndView("list");
		service.deleteProduct(id);
		moView.addObject("products" , service.findAllProducts());
		
		return moView;
	}

	@RequestMapping(value = "/login.html", method = RequestMethod.GET)
	public String displayLoginPage() {
		return "login";
	}

	@RequestMapping(value = "/product/update/{id}/{name}", method = RequestMethod.GET)
	public ModelAndView updateProduct(@PathVariable("id") Long id, @PathVariable("name") String name) {
		    ModelAndView moView = new ModelAndView("updateInfo");

			Product productOld = service.findProductById(id);
			productOld.setAvailability(name);
			service.update(productOld);

			return moView;

	}	
	
}

package com.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.util.Date;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.catalina.connector.Request;
import org.apache.commons.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItem;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;


import com.controller.products.Products;
import com.controller.products.ProductsDAO;
import com.controller.products.ProductsDAOImpl;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.controller.cart.Cart;
import com.controller.cart.CartDAO;
import com.controller.categories.Categories;
import com.controller.categories.CategoriesDAO;
import com.controller.categories.CategoriesDAOImpl;


import com.controller.profiles.*;


@Controller
public class HomeController {

	@Autowired
	ProductsDAO pdao;
	
	@Autowired
	CategoriesDAO cdao;
	
	@Autowired
	ProfilesDAO pdao1;
	
	@Autowired
	CartDAO cartdao;

	public String LoginTest()
	{
	    //Date d = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	
	    	System.out.println(auth.getName());
	
	    	return "true";
	    }
		
		return "false";
	}
	
	@RequestMapping("/")
	public ModelAndView index()
	{
		ModelAndView m4 = new ModelAndView("index");
		System.out.println("rahul maghav");
		return m4;
	}
	
	
	@RequestMapping("/contactus")
	public ModelAndView contactus()
	{
		ModelAndView m1 = new ModelAndView("contactus");
	
		return m1;
	}
	
	@RequestMapping(value="/loginpage",method=RequestMethod.GET)
	public ModelAndView login()
	{
		ModelAndView m2 = new ModelAndView("loginpage");
			
		return m2;
	}
	
		
	
	@RequestMapping("/aboutus")
	public ModelAndView aboutus()
	{
		ModelAndView m5 = new ModelAndView("aboutus");
		
		return m5;
	}
	
	
	@RequestMapping("/addproduct")
	public ModelAndView addproduct()
	{
		ModelAndView m6 = new ModelAndView("addproduct");
	
		m6.addObject("catnames", cdao.getAllCategories());
		
		m6.addObject("Product", new Products());
		
			return m6;
	}
	
	
	@RequestMapping("/viewproduct")
	public ModelAndView viewproduct(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView("viewproduct");
		
		mv.addObject("productdata", pdao.getAllProducts());
		
		String currUser="";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	
			if(request.isUserInRole("ROLE_SUPPLIER"))
	    	{

	        currUser=auth.getName();
			
	    	mv.addObject("productdata", pdao.getProductsbySupplierName(currUser));
	    	return mv;
	    	}
	
	    	
	    }

		
	
		
		return mv;
	}
	

	@RequestMapping("/categoryproducts/{name}")
	public ModelAndView categoryproducts(HttpServletRequest request,@PathVariable("name")String name1)
	{
		ModelAndView mv = new ModelAndView("categoryproducts");
		
		System.out.println(name1);
		System.out.println(pdao.getProductsbyCategoryName(name1));
		
		mv.addObject("productdata", pdao.getProductsbyCategoryName(name1));
		
		/*String currUser="";
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	
			if(request.isUserInRole("ROLE_SUPPLIER"))
	    	{

	        currUser=auth.getName();
			
	    	mv.addObject("productdata", pdao.getProductsbySupplierName(currUser));
	    	return mv;
	    	}
	
	    	
	    }

*/		
	
		
		return mv;
	}
	

	
	@RequestMapping("/DeleteOneProduct/{id}")
	public ModelAndView DeleteOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("redirect:/viewproduct");
		
		pdao.delete(abc);
		
		return mv;
	}
	
	
	@RequestMapping("/DeleteProducts")
	public ModelAndView DeleteProducts(HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView("redirect:/viewproduct");
		
		if(req.getParameterValues("delete") != null)
		for(String params : req.getParameterValues("delete"))
		{
			System.out.println(params);
			
			int id  = Integer.parseInt(params);
			
			pdao.delete(id);
		}	
		
		return mv;
	}


	
	@RequestMapping("/UpdateOneProduct/{id}")
	public ModelAndView UpdateOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("updateproduct");
	
		
		Products p = pdao.getProductsbyId(abc);
		
//		if( p.getImage() != null && !p.getImage().equals("") )
//		{
//			URL url = new URL(p.getImage());
//			BufferedImage img = ImageIO.read(url);
//			File f = new File("downloaded.jpg");
//			ImageIO.write(img, "jpg", f);
//			
//			FileInputStream fis = new FileInputStream(f);
//			
//			FileItem file = new DiskFileItem("mainFile", Files.probeContentType(f.toPath()), false, f.getName(), (int)f.length(), f.getParentFile());
//			
//			p.setTheImage(new CommonsMultipartFile(file));
//		}
			
		
		mv.addObject("Product",p);
		
		mv.addObject("catnames", cdao.getAllCategories());
	
		//mv.addObject("Product", new Products());
		return mv;
	}
	
	@RequestMapping("/ViewOneProduct/{id}")
	public ModelAndView ViewOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("viewoneproduct");
		
		mv.addObject("productdata",pdao.getProductsbyId(abc));
		
		return mv;
	}
	
	
	@RequestMapping(value="/UpdateProductToDB",method=RequestMethod.POST)
	public ModelAndView UpdateProductToDB( HttpServletRequest req,@Valid @ModelAttribute("Product") Products p ,BindingResult result)
	{
		ModelAndView mv = new ModelAndView("redirect:/viewproduct");
		
		MultipartFile file = p.getTheImage();

		if( result.hasErrors() )
		{
			System.out.println( result.getAllErrors() );
			
			mv = new ModelAndView("viewproduct");
			mv.addObject("Product", p);
			System.out.println("Error");
			return mv;
		}
		
		

		
/*		String params[] = req.getParameterValues("product");
		
		Products p = new Products();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0:	p.setPid(Integer.parseInt(params[i])); break;
			case 1:	p.setName(params[i]); break;
			case 2:	p.setDescription(params[i]); break;
			case 3:	p.setCategory(params[i]); break;
			case 4:	p.setPrice(params[i]); break;
		
			}
		}
		
*/		
		
		
		//this.pdao.update(p);
		
		System.out.println(p.getImage());
		
		try
		{
			Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
					  "cloud_name", "dilcuc7rj",
					  "api_key", "758658521721747",
					  "api_secret", "E_o3pxZ1w5qaYI0uPblapchN6vw"));
			
			String path = req.getRealPath("/");
			
			System.out.println(path);
			
			byte b[] = new byte[ file.getInputStream().available() ];
			
			file.getInputStream().read(b);
			
			FileOutputStream fos = new FileOutputStream( path + "/image.jpg" );
		
			fos.write(b);
			
			fos.close();
			
			File f = new File(path + "/image.jpg");
			
			Map uploadResult = cloudinary.uploader().upload(f, ObjectUtils.emptyMap());
			
			System.out.println( uploadResult.get("secure_url") );
			String s=uploadResult.get("secure_url").toString();
			p.setImage(s);
		}
		catch( Exception e ){
			e.printStackTrace();
		}

		System.out.println(p.getImage());
		
		
		this.pdao.update(p);
		
		
		
		return mv;
	}


	
	
	@RequestMapping(value="/AddCartToDB",method=RequestMethod.POST)
	public ModelAndView AddCartToDB( @RequestParam("quantity") int q,@RequestParam("id")int abc  )
	{
		ModelAndView mv = new ModelAndView("redirect:/cart");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 if (auth != null && !auth.getName().equals("anonymousUser"))
		 {
		String currUser=auth.getName();
		
		boolean found = false;
		int id = -1;
		
		for( Cart c1 : cartdao.getProductsbyName(currUser) )
		{
			if( c1.getUsername().equals(currUser) && c1.getPid()==abc  )
			{
				found = true;
				id = c1.getId();
				break;
		    					
			}
			
		}
		
		if( found )
		{
			Cart c = cartdao.getCartbyId(id);

			Products p=pdao.getProductsbyId(abc);
			String qty1=p.getQuantity();
			int i=Integer.parseInt(qty1);
			i=i-q;
			String qty = String.valueOf(i);
			p.setQuantity(qty);
		    this.pdao.update(p);
           
			c.setQuantity(q);
			this.cartdao.update(c);
			System.out.println("updated");
			return mv;

		}

		System.out.println(auth.getName());
		
    	Cart c = new Cart();
		
    	Products p=pdao.getProductsbyId(abc);
		String qty1=p.getQuantity();
		int i=Integer.parseInt(qty1);
		i=i-q;
		System.out.println("i "+i);
		String qty = String.valueOf(i);
		p.setQuantity(qty);
		System.out.println(p.getQuantity());
		this.pdao.update(p);
	
		
		
		c.setUsername( auth.getName() );
		c.setPid(abc);
		c.setQuantity(q);
		
		this.cartdao.insert(c);
		
		
		
		 }
		 
	    /*if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	
	    	System.out.println(auth.getName());
	
	    	Cart c = new Cart();
			
			c.setUsername( auth.getName() );
			c.setPid(abc);
			c.setQuantity(q);
			
			this.cartdao.insert(c);
	    }
		*/
		 return mv;
	}	
	

	
	
	@RequestMapping(value="/AddProductToDB",method=RequestMethod.POST)
	public ModelAndView AddProductToDB( HttpServletRequest req  ,@Valid @ModelAttribute("Product") Products p ,BindingResult result )
	{
		ModelAndView mv = new ModelAndView("redirect:/addproduct");
		
		MultipartFile file = p.getTheImage();
		
		if( result.hasErrors() )
		{
			System.out.println( result.getAllErrors() );
			
			mv = new ModelAndView("addproduct");
			mv.addObject("Product", p);
			System.out.println("Error");
			return mv;
		}
		
		
		
		
		
		
		//String params[] = req.getParameterValues("product");
		
		//Products p = new Products();
	
		
		
		//for( int i = 0 ; i<params.length ; i++ )
		//{
			//switch(i)
			//{
			//case 0:	p.setName(params[i]); break;
			//case 1:	p.setDescription(params[i]); break;
			/*case 2:	p.setCategory(params[i]); break;*/
			//case 2:	p.setPrice(params[i]); break;
	//		}
		//}
	
		
		try
		{
			Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
					  "cloud_name", "dilcuc7rj",
					  "api_key", "758658521721747",
					  "api_secret", "E_o3pxZ1w5qaYI0uPblapchN6vw"));
			
			String path = req.getRealPath("/");
			
			System.out.println(path);
			
			byte b[] = new byte[ file.getInputStream().available() ];
			
			file.getInputStream().read(b);
			
			FileOutputStream fos = new FileOutputStream( path + "/image.jpg" );
		
			fos.write(b);
			
			fos.close();
			
			File f = new File(path + "/image.jpg");
			
			Map uploadResult = cloudinary.uploader().upload(f, ObjectUtils.emptyMap());
			
			System.out.println( uploadResult.get("secure_url") );
		String s=uploadResult.get("secure_url").toString();
		p.setImage(s);
		}
		catch( Exception e ){
			e.printStackTrace();
		}
			

		this.pdao.insert(p);
		
		return mv;
	}
	

	
	
	
	
	
	
	
	
	@RequestMapping("/addcategory")
	public ModelAndView addcategory()
	{
		ModelAndView m7 = new ModelAndView("addcategory");
		
		m7.addObject("Category", new Categories());
		
		return m7;
	}
	
	@RequestMapping("/viewcategory")
	public ModelAndView viewcategory()
	{
		ModelAndView mv = new ModelAndView("viewcategory");
		
		mv.addObject("categorydata", cdao.getAllCategories());
		
		return mv;
	}
	

	@RequestMapping("/DeleteOneCategory/{id}")
	public ModelAndView DeleteOneCategory(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("redirect:/viewcategory");
		
		cdao.delete(abc);
		
		return mv;
	}
	
	

	@RequestMapping("/DeleteCategories")
	public ModelAndView DeleteCategories(HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView("redirect:/viewcategory");
		
		if(req.getParameterValues("delete") != null)
		for(String params : req.getParameterValues("delete"))
		{
			System.out.println(params);
			
			int id  = Integer.parseInt(params);
			
			cdao.delete(id);
		}	
		
		return mv;
	}

	
	
	@RequestMapping("/UpdateOneCategory/{id}")
	public ModelAndView UpdateOneCategory(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("updatecategory");
		
		mv.addObject("categorydata",cdao.getCategoriesbyId(abc));
		
		return mv;
	}
	

	@RequestMapping("/ViewOneCategory/{id}")
	public ModelAndView ViewOneCategory(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("viewonecategory");
		
		mv.addObject("categorydata",cdao.getCategoriesbyId(abc));
		
		return mv;
	}

	

	@RequestMapping(value="/UpdateCategoryToDB",method=RequestMethod.POST)
	public ModelAndView UpdateCategoryToDB( HttpServletRequest req )
	{
		ModelAndView mv = new ModelAndView("redirect:/viewcategory");
		
		String params[] = req.getParameterValues("category");
		
		Categories c = new Categories();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0:	c.setCatid(Integer.parseInt(params[i])); break;
			case 1:	c.setName(params[i]); break;
			case 2:	c.setDescription(params[i]); break;
			
			}
		}
			
		this.cdao.update(c);
		
		return mv;
	}


	
	@RequestMapping(value="/AddCategoryToDB",method=RequestMethod.POST)
	public ModelAndView AddCategoryToDB( HttpServletRequest req, @Valid @ModelAttribute("Category") Categories c ,BindingResult result )
	{
		ModelAndView mv = new ModelAndView("redirect:/addcategory");
		
		/*String params[] = req.getParameterValues("category");
		
		Categories c = new Categories();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0:	c.setName(params[i]); break;
			case 1:	c.setDescription(params[i]); break;
			
			}
		}*/
		
		
		if( result.hasErrors() )
		{
			mv = new ModelAndView("addcategory");
			mv.addObject("Category", c);
			System.out.println("Error");
			return mv;
		}
				

		
		this.cdao.insert(c);
		
		return mv;
	}
	
	
	
	
	
	
	@RequestMapping("/addprofile")
	public ModelAndView addprofile()
	{
		ModelAndView m8 = new ModelAndView("addprofile");
		
		m8.addObject("Profile", new Profiles());
		
		return m8;
	}
	
	
	@RequestMapping("/viewprofile")
	public ModelAndView viewprofile()
	{
		ModelAndView mv = new ModelAndView("viewprofile");
		
		mv.addObject("profiledata", pdao1.getAllProfiles());
		
		return mv;
	}

	
	@RequestMapping("/DeleteOneProfile/{id}")
	public ModelAndView DeleteOneProfile(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("redirect:/viewprofile");
		
		pdao1.delete(abc);
		
		return mv;
	}
	

	
	@RequestMapping("/DeleteProfiles")
	public ModelAndView DeleteProfiles(HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView("redirect:/viewprofile");
		
		if(req.getParameterValues("delete") != null)
		for(String params : req.getParameterValues("delete"))
		{
			System.out.println(params);
			
			int id  = Integer.parseInt(params);
			
			pdao1.delete(id);
		}	
		
		return mv;
	}

	

	@RequestMapping("/UpdateOneProfile/{id}")
	public ModelAndView UpdateOneProfile(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("updateprofile");
		
		mv.addObject("profiledata",pdao1.getProfilesbyId(abc));
		
		return mv;
	}
	

	@RequestMapping("/ViewOneProfile/{id}")
	public ModelAndView ViewOneProfile(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("viewoneprofile");
		
		mv.addObject("profiledata",pdao1.getProfilesbyId(abc));
		
		return mv;
	}

	

	@RequestMapping(value="/UpdateProfileToDB",method=RequestMethod.POST)
	public ModelAndView UpdateProfileToDB( HttpServletRequest req )
	{
		ModelAndView mv = new ModelAndView("redirect:/viewprofile");
		
		String params[] = req.getParameterValues("profile");
		
		Profiles p = new Profiles();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0:	p.setId(Integer.parseInt(params[i])); break;
			
			case 1:	p.setUsername(params[i]); break;
			case 2:	p.setPassword(params[i]); break;
			case 3:	p.setEmail(params[i]); break;
			case 4:	p.setPhone(params[i]); break;
			case 5:	p.setAddress(params[i]); break;
			
			}
		}
			
		this.pdao1.update(p);
		
		return mv;
	}

	
/*
	@RequestMapping(value="/AddProfileToDB",method=RequestMethod.POST)
	public ModelAndView AddProfileToDB( HttpServletRequest req )
	{
		ModelAndView mv = new ModelAndView("addprofile");
		
		String params[] = req.getParameterValues("profile");
		
		Profiles p = new Profiles();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0:	p.setUsername(params[i]); break;
			case 1:	p.setPassword(params[i]); break;
			case 2:	p.setEmail(params[i]); break;
			case 3:	p.setPhone(params[i]); break;
			case 4:	p.setAddress(params[i]); break;
			}
		}
			
		this.pdao1.insert(p);
		
		return mv;
	}
*/
	
	@RequestMapping(value="/AddProfileToDB",method=RequestMethod.POST)
	public ModelAndView AddProfileToDB( HttpServletRequest req, @Valid @ModelAttribute("Profile") Profiles p ,BindingResult result )
	{
		ModelAndView mv = new ModelAndView("redirect:/addprofile");
		
		
		
		if( result.hasErrors() )
		{
			mv = new ModelAndView("addprofile");
			mv.addObject("Profile", p);
			System.out.println("Error");
			return mv;
		}
		
	
		else if( !(p.getConfirmpassword()).equals(p.getPassword()))
		{
			mv = new ModelAndView("addprofile");
			mv.addObject("Profile", p);
			System.out.println("password don't match");
			return mv;
		}
	
		
	else if(pdao1.getAllEmail().contains(p.getEmail()))
		{
			mv = new ModelAndView("addprofile");
			mv.addObject("Profile", p);
			System.out.println("Email Already Exists");
			return mv;
		}
		
	
		
		this.pdao1.insert(p);
		
		return mv;
		
	}

	
	
}

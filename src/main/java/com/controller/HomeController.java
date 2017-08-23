package com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;


import com.controller.products.Products;
import com.controller.products.ProductsDAO;
import com.controller.products.ProductsDAOImpl;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
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
	
	@RequestMapping("/signup")
	public ModelAndView signup()
	{
		ModelAndView m3 = new ModelAndView("signup");
		
		return m3;
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
		
		return m6;
	}
	
	@RequestMapping("/viewproduct")
	public ModelAndView viewproduct()
	{
		ModelAndView mv = new ModelAndView("viewproduct");
		
		mv.addObject("productdata", pdao.getAllProducts());
		
		return mv;
	}
	
	
	@RequestMapping("/DeleteOneProduct/{id}")
	public ModelAndView DeleteOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("redirect:/viewproduct");
		
		pdao.delete(abc);
		
		return mv;
	}
	
	
	@RequestMapping("/UpdateOneProduct/{id}")
	public ModelAndView UpdateOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("updateproduct");
	
		
		
		mv.addObject("productdata",pdao.getProductsbyId(abc));
		
		mv.addObject("catnames", cdao.getAllCategories());
		
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
	public ModelAndView UpdateProductToDB( HttpServletRequest req,  @RequestParam("file") MultipartFile file )
	{
		ModelAndView mv = new ModelAndView("redirect:/viewproduct");
		
		String params[] = req.getParameterValues("product");
		
		Products p = new Products();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0:	p.setPid(Integer.parseInt(params[i])); break;
			case 1:	p.setName(params[i]); break;
			case 2:	p.setDescription(params[i]); break;
			//case 3:	p.setCategory(params[i]); break;
			case 3:	p.setPrice(params[i]); break;
		
			}
		}
			
		//this.pdao.update(p);
		
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

		
		this.pdao.update(p);
		
		
		
		return mv;
	}

	
	
	@RequestMapping(value="/AddProductToDB",method=RequestMethod.POST)
	public ModelAndView AddProductToDB( HttpServletRequest req , @RequestParam("file") MultipartFile file )
	{
		ModelAndView mv = new ModelAndView("addproduct");
		
		String params[] = req.getParameterValues("product");
		
		Products p = new Products();
	
		
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0:	p.setName(params[i]); break;
			case 1:	p.setDescription(params[i]); break;
			/*case 2:	p.setCategory(params[i]); break;*/
			case 2:	p.setPrice(params[i]); break;
			}
		}
			
		//this.pdao.insert(p);
		
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
	public ModelAndView AddCategoryToDB( HttpServletRequest req )
	{
		ModelAndView mv = new ModelAndView("addcategory");
		
		String params[] = req.getParameterValues("category");
		
		Categories c = new Categories();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0:	c.setName(params[i]); break;
			case 1:	c.setDescription(params[i]); break;
			
			}
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

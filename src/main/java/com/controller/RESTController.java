package com.controller;

import org.apache.http.HttpRequest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.controller.cart.Cart;
import com.controller.cart.CartDAO;
import com.controller.products.Products;
import com.controller.products.ProductsDAO;
import com.controller.profiles.Profiles;
import com.controller.profiles.ProfilesDAO;

@RestController
public class RESTController {

	@Autowired
	CartDAO cartdao;
	
	@Autowired
	ProductsDAO pdao;
	
	@Autowired
	ProfilesDAO pfdao;

	
	
	@RequestMapping(value="/deletefromcart",method=RequestMethod.POST)
	public String deletefromcart(@RequestBody String data)
	{
		System.out.println("deletefromcart");
	
		System.out.println(data);
		
		try{
			JSONParser jparr = new JSONParser();
			
			JSONObject inp = (JSONObject)jparr.parse(data);
			
			System.out.println(inp);
			
			int id = Integer.parseInt( inp.get("id").toString() );
			
			
			Cart c=cartdao.getCartbyId(id);
			int q=c.getQuantity();
			
			Products p=pdao.getProductsbyId(c.getPid());
			String qty1=p.getQuantity();
			int i=Integer.parseInt(qty1);
			i=i+q;
			String qty = String.valueOf(i);
			p.setQuantity(qty);
			this.pdao.update(p);
			
			cartdao.delete(id);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return "{\"msg\":\"Deleted\"}";
	}
	
	
	
	@RequestMapping(value="/getAllCartItems",method=RequestMethod.POST)
	public String getAllCartItems()
	{
		System.out.println("getAllCartItems");
	
		String currUser = "";
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    	currUser = auth.getName();
		
		JSONArray jarr = new JSONArray();
		
		for( Cart c : cartdao.getAllCart() )
		{
			if( c.getUsername().equals(currUser) )
			{
				JSONObject jobj = new JSONObject();
				
				Products p = pdao.getProductsbyId(c.getPid());
				
				jobj.put("qty", c.getQuantity());
				jobj.put("id", c.getId());
				jobj.put("pname",  p.getName() );
				jobj.put("pcat", p.getCategory() );
				jobj.put("pdesc", p.getDescription() );
				jobj.put("pprice", p.getPrice());
				jobj.put("pimg", p.getImage());
				jobj.put("shipaddr", c.getShippingaddress());
				jobj.put("billaddr", c.getBillingaddress());
			
				jarr.add(jobj);
			}
			
		}
		
		System.out.println(jarr.toJSONString());
		
		return jarr.toJSONString();
	}
	

	
	@RequestMapping(value="/DeleteCartItems",method=RequestMethod.POST)
	public String DeleteCartItems()
	{
		System.out.println("DeleteCartItems");
	
		String currUser = "";
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    	currUser = auth.getName();
		
		
		
		for( Cart c : cartdao.getAllCart() )
		{
			if( c.getUsername().equals(currUser) )
			{
		
				
			int a=c.getId();
			cartdao.delete(a);
				
			}
			
		}
		
		
		
		return "{\"msg\":\"Deleted Items\"}";
	}

	
	
	@RequestMapping(value="/getAddress",method=RequestMethod.POST)
	public String getAddress()
	{
		System.out.println("getAddress");
		
		String currUser = "";
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    	currUser = auth.getName();
	    
	    JSONObject jobj = new JSONObject();
			
		for( Profiles p : pfdao.getAllProfiles())
		{
			
			if( p.getUsername().equals(currUser))
			{	
				String addr = p.getAddress();
				
				System.out.println(addr);
				jobj.put("billaddr", p.getAddress());
				jobj.put("shipaddr", p.getAddress());
				
				
				return jobj.toJSONString();
			}
			
		}
		
		return jobj.toJSONString();
	}
	
	
	
	@RequestMapping(value="/UpdateCartToDB",method=RequestMethod.POST)
	public String UpdateCartToDB(@RequestBody String data)
	{
		System.out.println("UpdateCartToDB");
		
		String currUser = "";
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    	currUser = auth.getName();
		
	    System.out.println(data);
				
		try{
			JSONParser jparr = new JSONParser();
			
			JSONObject inp = (JSONObject)jparr.parse(data);
			
			System.out.println(inp);

			String ship = inp.get("ship").toString();
			String bill = inp.get("bill").toString();
			cartdao.update(currUser, ship, bill);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return "{\"msg\":\"Updated\"}";
	    
	    
	}
}

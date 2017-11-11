package oss.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import oss.model.User;
import oss.service.UserService;
import oss.service.UserServiceImplement;

@Controller


public class UserController {

	UserService userService=new UserServiceImplement();
	
	@RequestMapping(value="/")
	public String blank() {
		
		return "redirect:/user/list";
	}
	
	@RequestMapping(value="/user/list", method=RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView model = new ModelAndView("user/list");
		model.addObject("listUser",userService.listUser());
		
		return model;
	}
	
	@RequestMapping(value = "/user/lista",method = RequestMethod.GET)
	@ResponseBody
	public List<User> getPatientById() {
		
		List<User> list =userService.listUser();		
		return list;   
	}
	
	
	
	@RequestMapping(value="/user/add", method=RequestMethod.POST)
	public String add(@ModelAttribute("userAdd")  User user) {
		
		System.out.println(user.getName());
		userService.add(user);
		
		return "redirect:/user/list";
	}
	
	@RequestMapping(value="/user/update", method=RequestMethod.GET)
	public String update(@RequestParam("name") String name, @RequestParam("surname") String surname, @RequestParam("telNo") String telNo, @RequestParam("id") String id) {
	
		User user = userService.findUserById(id);
		
		if(name != "") {
			user.setName(name);
		}
		
		if(surname != "") {
			user.setSurname(surname);
		}
		
		if(telNo != "") {
			user.setTelNo(telNo);
		}

		userService.update(user);
			
		return "redirect:/user/list";
	}
	
	
	@RequestMapping(value="/user/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable("id") String id) {
		
		
		User user = userService.findUserById(id);
		userService.delete(user);
		
		return "redirect:/user/list";
	}
}

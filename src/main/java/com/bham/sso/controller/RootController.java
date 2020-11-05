package com.bham.sso.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 
* <p>Title: RootController.java</p>
* <p>Description: </p>
* <p>Copyright: Copyright (c) 2017</p>
* <p>Company: UOB</p>
* @author RuJia
* @date 2017年1月31日
* @version 1.0
 */
@RestController
public class RootController {
	@RequestMapping("/")
	public String onRootAccess() {
		String hostname = System.getenv("HOSTNAME");
		String Color = "Blue";
		return "<h1 style=\"background-color:" + Color + "; color: white;\">DPVO ECS workshop</h1>"
			  +"<h2 style=\"background-color:" + Color + "; color: white;\">Version 0.2 </h2>"
			  +"<h3 style=\"background-color:" + Color + "; color: white;\">" + hostname + "</h3>";
	}
}

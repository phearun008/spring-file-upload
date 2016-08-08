package file.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ViewController {

	@RequestMapping(value = "/jquery", method = RequestMethod.GET)
	public String jqueryPage(){
		return  "jquery";
	}
	
	@RequestMapping(value = "/angular", method = RequestMethod.GET)
	public String angularPage(){
		return  "angular";
	}
	
	@RequestMapping(value = "/upload-folder", method = RequestMethod.GET)
	public String uploadToFolder(){
		return  "upload-to-folder";
	}
}

package file.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import file.entity.File;
import file.service.FileUploadService;

@RestController
@RequestMapping("/api/v1")
public class UploadController {

	@Autowired
	private FileUploadService uploadService;
	
	/***
	 * Request URL: http://localhost:5555/api/v1/upload?folder=folder1
	 * 
	 * Upload to default folder or to specific folder
	 * @param files
	 * @return
	 */
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public File upload(@RequestParam("files") List<MultipartFile> files, 
					   @RequestParam(value="folder", required=false) String folder){
		return uploadService.upload(files, folder);
	}
}

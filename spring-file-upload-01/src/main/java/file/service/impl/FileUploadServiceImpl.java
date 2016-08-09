package file.service.impl;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import file.entity.File;
import file.service.FileUploadService;
import file.util.Console;

/***
 * Create Date: 8/8/2016 02:00PM
 * @author PHEARUN
 */

@Service
public class FileUploadServiceImpl implements FileUploadService{

	@Override
	public File upload(List<MultipartFile> files, String folder) {
		
		File fileUpload = new File();
		
		if(files.isEmpty()){
			Console.logError("File is empty!");
			fileUpload.setMessage("File is not present! Please choose file to upload!!!");
			
		}else{
			
			if(folder=="" || folder==null)
				folder = "default";
			String UPLOAD_PATH = "/opt/project/" + folder;
			
			java.io.File path = new java.io.File(UPLOAD_PATH);
			if(!path.exists())
				path.mkdirs();
			
			List<String> names = new ArrayList<>();
			for(MultipartFile file: files){
				String fileName = file.getOriginalFilename();
				fileName = UUID.randomUUID().toString() + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				try {
					Files.copy(file.getInputStream(), Paths.get(UPLOAD_PATH, fileName));
					names.add(fileName);
				} catch (Exception e) { 
					Console.logError(e);
					fileUpload.setMessage("Fail to upload!, " + e.getMessage());
				}
			}
			fileUpload.setProjectPath("/resources/" + folder);
			fileUpload.setServerPath(UPLOAD_PATH);
			fileUpload.setNames(names);
			fileUpload.setMessage("File has been uploaded successfully!!!");
		}
		return fileUpload;
	}

	
}

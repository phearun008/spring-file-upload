package file.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import file.entity.File;

public interface FileUploadService {
	
	/***
	 * Upload to default location
	 */
	public File upload(List<MultipartFile> files, String folder);
	
	
}

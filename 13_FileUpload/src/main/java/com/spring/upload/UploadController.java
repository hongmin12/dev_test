package com.spring.upload;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class UploadController {
	
	@Inject
	private Upload upload;
	
	
	@RequestMapping("upload.go")
	public String upload() {
		return "upload_form";
	}
	
	
	@RequestMapping("upload_ok.go")
	public String uploadOk(Model model, MultipartHttpServletRequest mRequest) {
		
		if(this.upload.fileUpload(mRequest)) {
			model.addAttribute("result", "파일 업로드 성공!!!");
		}else {
			model.addAttribute("result", "파일 업로드 실패~~~");
		}
		
		return "upload_result";
		
	}

}

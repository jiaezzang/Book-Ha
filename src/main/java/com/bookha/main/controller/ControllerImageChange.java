package com.bookha.main.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bookha.model.ModelFileSaveName;

@RestController
public class ControllerImageChange {
	private String path = "C:/imageSaveStorage/";
	
	@RequestMapping(value = "/img_change.do", method = RequestMethod.POST)
	public ModelAndView img_change(@RequestParam("image") MultipartFile multi, HttpServletRequest request,
			HttpServletResponse response) {

		String url = null;
		ModelAndView mv = new ModelAndView();

		try {
			String uploadPath = path;
			String originFilename = multi.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			long size = multi.getSize();
			ModelFileSaveName Model_FileSaveName = new ModelFileSaveName();
			String saveFileName = Model_FileSaveName.GenSaveFileName(extName);

			//System.out.println("saveFileName : " + saveFileName);

			if (!multi.isEmpty()) {
				File file = new File(uploadPath, saveFileName);
				multi.transferTo(file);

				mv.addObject("filename", saveFileName);
				mv.addObject("uploadPath", file.getAbsolutePath());
				mv.addObject("url", uploadPath + saveFileName);
				//System.out.println("url : " + uploadPath + saveFileName);

				mv.setViewName("image_Url_Json");
			} else {
				mv.setViewName("error");
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("[Error] " + e.getMessage());
		}
		return mv;
	}
}

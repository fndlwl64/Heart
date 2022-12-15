package com.heartpet.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.swing.filechooser.FileSystemView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.heartpet.action.AnimalDAO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Service
public class FileUploadImage {

	public boolean upload(HttpServletRequest request, List<MultipartFile> files) {
		String rootPath = request.getSession().getServletContext().getRealPath("/resources/upload");
//		String otherPath = FileSystemView.getFileSystemView().getDefaultDirectory().getPath()
//				+ "/GitHub/Heart/src/main/webapp/resources/upload";
		System.out.println(request.getSession().getServletContext().getRealPath("/resources/upload"));
		for (MultipartFile file : files) {
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
//			// 랜덤으로 파일명 생성 
			UUID uuid = UUID.randomUUID();

			

			try {
//				File toFile = new File(rootPath + "/" + fileRealName);
//				file.transferTo(toFile);
				File otherFile = new File(rootPath + "/" + uuid.toString() + fileExtension);
				file.transferTo(otherFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
				return false;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true;
	}
	
	public String[] uploadAnimalImg(HttpServletRequest request, List<MultipartFile> files) {
		String rootPath = request.getSession().getServletContext().getRealPath("/resources/upload");
//		String otherPath = FileSystemView.getFileSystemView().getDefaultDirectory().getPath()
//				+ "upload";
		
		String[] imgs = {"","",""};
		int i = 0;
	
		for (MultipartFile file : files) {
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			// 랜덤으로 파일명 생성 
			UUID uuid = UUID.randomUUID();

			imgs[i] = fileRealName;
			

			try {
				File toFile = new File(rootPath + "/" + imgs[i]);
				file.transferTo(toFile);
				File otherFile = new File(rootPath + "/" + uuid.toString() + fileExtension);
				file.transferTo(otherFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();

			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		return imgs;
	}
	
}

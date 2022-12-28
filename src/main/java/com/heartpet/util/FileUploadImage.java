package com.heartpet.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.heartpet.model.AnimalDTO;
import com.heartpet.model.NoticeDTO;

@Service
public class FileUploadImage {

//	public boolean upload(HttpServletRequest request, List<MultipartFile> files) {
//		String rootPath = request.getSession().getServletContext().getRealPath("/resources/upload");
////		String otherPath = FileSystemView.getFileSystemView().getDefaultDirectory().getPath()
////				+ "/GitHub/Heart/src/main/webapp/resources/upload";
//		
//		System.out.println(request.getSession().getServletContext().getRealPath("/resources/upload"));
//		for (MultipartFile file : files) {
//			String fileRealName = file.getOriginalFilename();
//			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
////			// 랜덤으로 파일명 생성 
//			UUID uuid = UUID.randomUUID();
//
//			
//
//			try {
////				File toFile = new File(rootPath + "/" + fileRealName);
////				file.transferTo(toFile);
//				File otherFile = new File(rootPath + "/" + uuid.toString() + fileExtension);
//				file.transferTo(otherFile);
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//				return false;
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		return true;
//	}
	
	//animal img insert
	public String[] uploadAnimalImg(HttpServletRequest request, List<MultipartFile> files, String folderName) {
//		String otherPath = FileSystemView.getFileSystemView().getDefaultDirectory().getPath()
//				+ "upload";
		//파일 경로 + 디렉토리 생성(날짜 + folderName)
		Calendar cal = Calendar.getInstance();
	    String dateString;
	    dateString = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
		String rootPath = request.getSession().getServletContext().getRealPath("/resources/upload/"+dateString+"/"+folderName);
	    File mkfile = new File(rootPath);
	    mkfile.mkdirs();
		
		String[] imgs = {"","",""};
		int i = 0;
	
		//파일 업로드
		for (MultipartFile file : files) {
			if(file.getOriginalFilename().equals("")) {//업로드할 파일 없으면 스킵
				continue;
			}
			
			// 랜덤으로 파일명 생성
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length()); 
			UUID uuid = UUID.randomUUID();
			String randomName =  uuid.toString() + fileExtension;
			
			//이미지 1,2,3에 쓸 이미지 이름 저장 (날짜 + folderName 경로 포함)
			imgs[i] = dateString + "/" + folderName + "/" + randomName;	
			//이미지 파일 생성
			try {
//				File toFile = new File(rootPath + "/" + imgs[i]);
//				file.transferTo(toFile);
				File otherFile = new File(rootPath  + "/" + randomName);
				file.transferTo(otherFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();

			} catch (IOException e) {
				e.printStackTrace();
			}
			i++;
		}
		return imgs;
	}
	
    
    ////////////////////////////////////////////////////////////////////////////////
	
	//animal img update
	public AnimalDTO uploadAnimalImg(HttpServletRequest request, List<MultipartFile> files, String folderName, AnimalDTO animalDTO) {
//		String otherPath = FileSystemView.getFileSystemView().getDefaultDirectory().getPath()
//				+ "upload";
		Calendar cal = Calendar.getInstance();
	    String dateString;
	    dateString = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
		String rootPath = request.getSession().getServletContext().getRealPath("/resources/upload/"+dateString+"/"+folderName);
	    File mkfile = new File(rootPath);
	    mkfile.mkdirs();
		
		int i = 0;
	
		for (MultipartFile file : files) {
			if(file.getOriginalFilename().equals("")) {//업로드할 파일 없으면 스킵
				continue;
			}
			//기존 파일 삭제
			String deleteImg = null;
			if(i == 0 ) {deleteImg = animalDTO.getAnimal_img1();};
			if(i == 1 ) {deleteImg = animalDTO.getAnimal_img2();};
			if(i == 2 ) {deleteImg = animalDTO.getAnimal_img3();};
			
			if(!deleteImg.equals("")) {
				String deletePath = request.getSession().getServletContext().getRealPath("/resources/upload")+"/"+deleteImg;
				File deleteFile = new File(deletePath);
				System.out.println(deleteFile.delete());;
			}
			
			// 랜덤으로 파일명 생성 
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			UUID uuid = UUID.randomUUID();
			String randomName =  uuid.toString() + fileExtension;
			//이미지 1,2,3에 쓸 이미지 이름 저장 (날짜 + folderName 경로 포함)
			if(i == 0 ) {animalDTO.setAnimal_img1(dateString + "/" + folderName + "/" + randomName);};
			if(i == 1 ) {animalDTO.setAnimal_img2(dateString + "/" + folderName + "/" + randomName);};
			if(i == 2 ) {animalDTO.setAnimal_img3(dateString + "/" + folderName + "/" + randomName);};
			//이미지 파일 생성
			try {
//				File toFile = new File(rootPath + "/" + imgs[i]);
//				file.transferTo(toFile);
				File otherFile = new File(rootPath  + "/" + randomName);
				file.transferTo(otherFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();

			} catch (IOException e) {
				e.printStackTrace();
			}
			i++;
		}
		return animalDTO;
	}
	//animal 
	public void deleteAnimalImg(HttpServletRequest request, AnimalDTO animalDTO) {
		for(int i=0;i<3;i++) {
			String deleteImg = null;
			if(i == 0 ) {deleteImg = animalDTO.getAnimal_img1();};
			if(i == 1 ) {deleteImg = animalDTO.getAnimal_img2();};
			if(i == 2 ) {deleteImg = animalDTO.getAnimal_img3();};
			if(deleteImg != null && !deleteImg.equals("")) {
				String deletePath = request.getSession().getServletContext().getRealPath("/resources/upload")+"/"+deleteImg;
				File deleteFile = new File(deletePath);
				System.out.println(deleteFile.delete());;
			}
		}
		
	}
	
	////////////////////////////////////////////////////////////////////////////////
    // uploadFile(insert) : FolderName / dateString 순서 변경 / insert-update 등 선택가능 
    ////////////////////////////////////////////////////////////////////////////////
    public List<String> uploadFile(HttpServletRequest request, List<MultipartFile> files, 
            String folderName, int fileTotal) throws IllegalStateException, IOException {        
        // List<String> 타입으로 return 예정
        List<String> folderFiles = new ArrayList<String>();
        Calendar cal = Calendar.getInstance();
        String dateString = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
        String subPath = "/resources/upload/"+folderName + "/" + dateString;
        String rootPath = request.getSession().getServletContext().getRealPath(subPath);
        
        System.out.println("rootPath : "+rootPath);
        
        // 폴더 없으면 생성
        File mkfile = new File(rootPath);
        // 경로에 해당하는 directory 전체 생성
        if (!mkfile.exists()) {
            mkfile.mkdirs();
        }
        
        // 파일명 생성 및 업로드
        for(int i=0; i<files.size(); i++) {
            String realName = files.get(i).getOriginalFilename();
            if(realName.equals("")) { // img 하나도 안 들어오는 경우
                folderFiles.add("");
            }else {
                System.out.println("realName : " + realName);    
                // .부터 확장자 분리
                String fileExt = realName.substring(realName.lastIndexOf("."), realName.length()); 
                System.out.println("fileExt : " + fileExt);
    
                // insert : reviewImg_insert_1_숫자.확장자 // update : reviewImg_update_1_숫자.확장자
                String fileRename = folderName + "_insert_" + (i+1) + "_" + System.currentTimeMillis() + fileExt;
                System.out.println("fileRename : " + fileRename);            
                // 파일 이름 DB 저장 
                folderFiles.add(subPath + "/" + fileRename);            
                // 실제 파일 이동
            files.get(i).transferTo(new File(rootPath + "/" + fileRename));
            }
        }
        
        // 총 파일 수만큼 for문 돌림
        for(int i=0; i<(fileTotal-files.size()); i++) {
            folderFiles.add("");
        }
        return folderFiles;
    }
    
    ////////////////////////////////////////////////////////////////////////////////
    // updateFile : FolderName / dateString 순서 변경 / insert-update 등 선택가능 
    ////////////////////////////////////////////////////////////////////////////////
    public List<String> updateFile(HttpServletRequest request, List<MultipartFile> files, 
            String folderName, List<String> origin_files, int fileTotal) throws IllegalStateException, IOException {        
        // List<String> 타입으로 return 예정
        List<String> folderFiles = new ArrayList<String>();
        Calendar cal = Calendar.getInstance();
        String dateString = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
        String subPath = "/resources/upload/"+folderName + "/" + dateString;
        String rootPath = request.getSession().getServletContext().getRealPath(subPath);
        
        // 폴더 없으면 생성
        File mkfile = new File(rootPath);
        // 경로에 해당하는 directory 전체 생성
        if (!mkfile.exists()) {
            mkfile.mkdirs();
        }
        
        //파일 업로드
        for(int i=0; i<files.size(); i++) {
            String realName = files.get(i).getOriginalFilename();
            System.out.println("realName : " + realName);
            System.out.println("origin_files.get : " + i + ":" + origin_files.get(i));
            
            // 업로드할 파일 없으면 원래 값 추가
            if(realName.equals("")) {               
                folderFiles.add(origin_files.get(i));
            }else { // 업로드할 파일 있으면
                // 기존 파일 있을 때 삭제
                if(origin_files.get(i) != null && !origin_files.get(i).equals("")) {
                    String deletePath = request.getSession().getServletContext().getRealPath(origin_files.get(i));
                    if(deletePath != null) {
                        File deleteFile = new File(deletePath);
                        if(deleteFile.exists()) {                       
                            deleteFile.delete();
                        }
                    }                   
                }               
                
                // Rename 과정
                // .부터 확장자 분리
                String fileExt = realName.substring(realName.lastIndexOf("."), realName.length()); 
                System.out.println("fileExt : " + fileExt);
                
                // update : 폴더명_update_1_숫자.확장자
                String fileRename = folderName + "_update_" + (i+1) + "_" + System.currentTimeMillis() + fileExt;
                System.out.println("fileRename : " + fileRename);            
                // 파일 이름 DB 저장 
                folderFiles.add(subPath + "/" + fileRename);            
                // 실제 파일 이동
                files.get(i).transferTo(new File(rootPath + "/" + fileRename));              
            }            
        }        
        return folderFiles;
    }
        
    ////////////////////////////////////////////////////////////////////////////////
    // deleteFile : request, 기존 파일명
    ////////////////////////////////////////////////////////////////////////////////
    public void deleteFile(HttpServletRequest request, List<String> origin_files) {        
        for(int i=0; i<origin_files.size(); i++) {            
            if(origin_files.get(i) != null && !origin_files.get(i).equals("")) {
                String deletePath = request.getSession().getServletContext().getRealPath(origin_files.get(i));
                if(deletePath != null) {
                    File deleteFile = new File(deletePath);
                    if(deleteFile.exists()) {                       
                        deleteFile.delete();
                    }
                }                   
            }
        }        
    }
    
    ////////////////////////////////////////////////////////////////////////////////

	
	//animal img insert
	public String[] uploadNoticeImg(HttpServletRequest request, List<MultipartFile> files, String folderName) {
//		String otherPath = FileSystemView.getFileSystemView().getDefaultDirectory().getPath()
//				+ "upload";
		//파일 경로 + 디렉토리 생성(날짜 + folderName)
		Calendar cal = Calendar.getInstance();
	    String dateString;
	    dateString = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
		String rootPath = request.getSession().getServletContext().getRealPath("/resources/upload/"+dateString+"/"+folderName);
	    File mkfile = new File(rootPath);
	    mkfile.mkdirs();
		
		String[] imgs = {"","",""};
		int i = 0;
	
		//파일 업로드
		for (MultipartFile file : files) {
			if(file.getOriginalFilename().equals("")) {//업로드할 파일 없으면 스킵
				continue;
			}
			
			// 랜덤으로 파일명 생성
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length()); 
			UUID uuid = UUID.randomUUID();
			String randomName =  uuid.toString() + fileExtension;
			
			//이미지 1,2,3에 쓸 이미지 이름 저장 (날짜 + folderName 경로 포함)
			imgs[i] = dateString + "/" + folderName + "/" + randomName;	
			//이미지 파일 생성
			try {
//				File toFile = new File(rootPath + "/" + imgs[i]);
//				file.transferTo(toFile);
				File otherFile = new File(rootPath  + "/" + randomName);
				file.transferTo(otherFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();

			} catch (IOException e) {
				e.printStackTrace();
			}
			i++;
		}
		return imgs;
	}
	
	//animal img update
	public NoticeDTO uploadNoticeImg(HttpServletRequest request, List<MultipartFile> files, String folderName, NoticeDTO dto) {
//		String otherPath = FileSystemView.getFileSystemView().getDefaultDirectory().getPath()
//				+ "upload";
		Calendar cal = Calendar.getInstance();
	    String dateString;
	    dateString = String.format("%04d-%02d-%02d", cal.get(Calendar.YEAR), cal.get(Calendar.MONTH) + 1, cal.get(Calendar.DAY_OF_MONTH));
		String rootPath = request.getSession().getServletContext().getRealPath("/resources/upload/"+dateString+"/"+folderName);
	    File mkfile = new File(rootPath);
	    mkfile.mkdirs();
		
		int i = 0;
	
		for (MultipartFile file : files) {
			if(file.getOriginalFilename().equals("")) {//업로드할 파일 없으면 스킵
				continue;
			}
			//기존 파일 삭제
			String deleteImg = null;
			if(i == 0 ) {deleteImg = dto.getNotice_img1();};
			if(i == 1 ) {deleteImg = dto.getNotice_img2();};
			
			if(!deleteImg.equals("")) {
				String deletePath = request.getSession().getServletContext().getRealPath("/resources/upload")+"/"+deleteImg;
				File deleteFile = new File(deletePath);
				System.out.println(deleteFile.delete());;
			}
			
			// 랜덤으로 파일명 생성 
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
			UUID uuid = UUID.randomUUID();
			String randomName =  uuid.toString() + fileExtension;
			//이미지 1,2,3에 쓸 이미지 이름 저장 (날짜 + folderName 경로 포함)
			if(i == 0 ) {dto.setNotice_img1(dateString + "/" + folderName + "/" + randomName);};
			if(i == 1 ) {dto.setNotice_img2(dateString + "/" + folderName + "/" + randomName);};
		
			
			//이미지 파일 생성
			try {
//				File toFile = new File(rootPath + "/" + imgs[i]);
//				file.transferTo(toFile);
				File otherFile = new File(rootPath  + "/" + randomName);
				file.transferTo(otherFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();

			} catch (IOException e) {
				e.printStackTrace();
			}
			i++;
		}
		return dto;
	}
}

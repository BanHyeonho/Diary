package www.util;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import www.dto.DiaryVo;
import www.dto.MemberVo;

public class FileSave {
	
	
	//회원가입시 사용
	public MemberVo join(HttpServletRequest request){
		
		MemberVo vo = new MemberVo();
		
		//파일 처리에 유효한 request(multipart)인지 확인
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
		//파일이 전송되었을때
		if(isMultipart){
			//디스크기반 파일 아이템 팩토리
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			int maxMem = 1*1024*1024; //1MB	
			int maxRequest = 10*1024*1024;//10MB
			
			factory.setSizeThreshold(maxMem);//메모리 처리 사이즈 결정
			//메모리에 처리하기에 큰아이템이라면 임시파일생성 
			//디스크에서 처리할 임시 파일 경로 지정				
			factory.setRepository(new File(request.getSession().getServletContext().getRealPath("tmpFile")));
			//업로드 처리 객체
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(maxRequest);//업로드 허용크기 설정
			//업로드 파싱(추출)
			List<FileItem> items = null;
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//업로드 데이터 반복자 얻기
			Iterator iter = items.iterator();
			//업로드 데이터 하나씩 처리하는 루틴
			while(iter.hasNext()){
				FileItem item = (FileItem)iter.next();
				//사이즈가 0인 빈파일이 업로드 되면 처리하지 않음
				if(item.getSize()<=0){
					continue;
				}
				//텍스트 폼 데이터 처리
				if(item.isFormField()){
					try{
					switch(item.getFieldName()){
					case "id" :
						vo.setId(item.getString("UTF-8"));
						break;
					case "name":
						vo.setName(item.getString("UTF-8"));
						break;
					case "password":
						vo.setPassword(item.getString("UTF-8"));
						break;
					case "nick":
						vo.setNick(item.getString("UTF-8"));
						break;
					case "gender":
						vo.setGender(item.getString("UTF-8"));
						break;
					case "birth":
						vo.setBirth(item.getString("UTF-8"));
						break;
					case "email":
						vo.setEmail(item.getString("UTF-8"));
						break;
					case "phone":
						vo.setPhone(item.getString("UTF-8"));
						break;
					case "addr":
						vo.setAddr(item.getString("UTF-8"));
						break;	
					case "pwq":
						vo.setPwq(item.getString("UTF-8"));
						break;
					case "answer":
						vo.setAnswer(item.getString("UTF-8"));
						break;
					}
					}catch(Exception e){
						e.printStackTrace();
					}
				}else{//파일 데이터처리
					String filename = item.getName();
					
					//실제 업로드
					File up = new File(request.getSession().getServletContext().getRealPath("upload"),filename);
					//파일이 존재할경우
					if(up.exists()){
						filename+="_"+System.currentTimeMillis();
						up = new File(request.getSession().getServletContext().getRealPath("upload"),filename);
					}
					
					vo.setPicture(filename);
										
					try {
						item.write(up); //realPath에 업로드
						item.delete(); //임시파일에 삭제
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}// while end
			
		}
		
		return vo;
	}
	
	public DiaryVo diaryWrite(HttpServletRequest request){
		DiaryVo vo = new DiaryVo();
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			
			int maxMem = 1*1024*1024; //1MB	
			int maxRequest = 10*1024*1024;//10MB
			
			factory.setSizeThreshold(maxMem);
			
			factory.setRepository(new File(request.getSession().getServletContext().getRealPath("tmpFile")));
			
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(maxRequest);
			
			List<FileItem> items = null;
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Iterator iter = items.iterator();
			
			while(iter.hasNext()){
				FileItem item = (FileItem)iter.next();
				
				if(item.getSize()<=0){
					continue;
				}
				if(item.isFormField()){
					try{
					switch(item.getFieldName()){
					case "id" :
						vo.setId(item.getString("UTF-8"));
						break;
					case "nick":
						vo.setNick(item.getString("UTF-8"));
						break;
					case "dtitle":
						vo.setDtitle(item.getString("UTF-8"));
						break;
					case "place":
						vo.setPlace(item.getString("UTF-8"));
						break;
					case "contents":
						vo.setContents(item.getString("UTF-8"));
						break;
					case "mapposition":
						vo.setMapposition(item.getString("UTF-8"));
						break;
					case "sdate":
						vo.setSdate(item.getString("UTF-8"));
						break;
					case "edate":
						vo.setEdate(item.getString("UTF-8"));
						break;
					case "dpublic":
						vo.setDpublic(item.getString("UTF-8"));
						break;
					}
					}catch(Exception e){
						e.printStackTrace();
					}
				}else{
					String filename = item.getName();
					
					
					File up = new File(request.getSession().getServletContext().getRealPath("upload"),filename);
					
					if(up.exists()){
						filename+="_"+System.currentTimeMillis();
						up = new File(request.getSession().getServletContext().getRealPath("upload"),filename);
					}
					
					if(vo.getDpicture()==null){
						vo.setDpicture(filename);	
					}else{
						vo.setDpicture(vo.getDpicture()+"/"+filename);
					}
					
					
					
					try {
						item.write(up);
						item.delete();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}// while end
			
		}
		
		
		
		
		return vo;
	}

}

package www.util;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import www.dto.MemberVo;

public class FileSave {

	private FileSave(){}
	
	private static class Inner{
		private static final FileSave util = new FileSave();
	}
	public static FileSave getInstance(){
		return FileSave.Inner.util;
	}
	
	public MemberVo upload(HttpServletRequest request){
		
		MemberVo vo = new MemberVo();
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
//					switch(item.getFieldName()){
//					case "idx" :
//						vo.setIdx(Integer.parseInt(item.getString("UTF-8")));
//						break;
//					case "writer":
//						vo.setWriter(item.getString("UTF-8"));
//						break;
//					case "writerId":
//						vo.setWriterId(item.getString("UTF-8"));
//						break;
//					case "subject":
//						vo.setSubject(item.getString("UTF-8"));
//						break;
//					case "content":
//						vo.setContent(item.getString("UTF-8"));
//						break;
//					}
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
					
					vo.setPicture(filename);
					
					
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

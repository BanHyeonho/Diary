package www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import www.service.MyPageService;
//@Controller
public class MsgController {
	
	@Autowired
	MyPageService sv;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MsgController.class);
	
//	public @ResponseBody Map<String,String> sendmsg(MsgVo vo){
//		return null;
//	}//쪽지보내기

	
	
}

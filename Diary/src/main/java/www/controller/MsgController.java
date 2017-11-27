package www.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.dto.MsgVo;
import www.service.MyPageService;
@Controller
public class MsgController {
	
	@Autowired
	MyPageService sv;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MsgController.class);
	
	@RequestMapping(value="/sendmsg.do",method = RequestMethod.POST)
	public @ResponseBody Map<String,String> sendmsg(MsgVo vo){
		
		logger.info(vo.toString());
		sv.sendmsg(vo);
		Map<String,String> map = new HashMap<String,String>();
		map.put("result", "메세지 보내기에 성공하였습니다");
		return map;
	}//쪽지보내기

	@RequestMapping(value="/msg_chk.do", method = RequestMethod.GET)
	public @ResponseBody Map<String,List<MsgVo>> msg_chk(String id){
		Map <String,List<MsgVo>> map = new HashMap<String, List<MsgVo>>();
		sv.msgchk(id);
		
		map.put("chk", sv.msgchk(id));
		
		return map;
		
	}
	
}

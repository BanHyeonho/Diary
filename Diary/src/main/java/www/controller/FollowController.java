package www.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import www.dto.FollowVo;
import www.service.MyPageService;

@Controller
public class FollowController {
	
	@Autowired
	MyPageService sv;
	
	
	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);

	@RequestMapping(value="/addFollow.do",method=RequestMethod.GET)
	public @ResponseBody Map<String, String> addFollow(FollowVo vo) {
		
		sv.addfollow(vo);
		
		Map<String, String> map = new HashMap<String, String>();
		return map;
	} // 팔로우하기
	
	@RequestMapping(value="/deleteFollow.do",method=RequestMethod.GET)
	public @ResponseBody Map<String, String> deleteFollow(FollowVo vo) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("followdelte", "팔로우가 해제되었습니다.");
		sv.deletefollow(vo.getIdx());
		
		return map;
	} // 팔로우 삭제
//
//	public ModelAndView followDiary(String id) {
//		return null;
//	} // 팔로우의 글들보기
}

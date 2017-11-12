package www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import www.service.MyPageService;

//@Controller
public class FollowController {
	
	@Autowired
	MyPageService sv;
	
	
	private static final Logger logger = LoggerFactory.getLogger(FollowController.class);

//	public @ResponseBody Map<String, String> addFollow(FollowVo vo) {
//		return null;
//	} // 팔로우하기
//
//	public @ResponseBody Map<String, String> deleteFollow(FollowVo vo) {
//		return null;
//	} // 팔로우 삭제
//
//	public ModelAndView followDiary(String id) {
//		return null;
//	} // 팔로우의 글들보기
}

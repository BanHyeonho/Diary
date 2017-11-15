package www.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.dto.CommunityVo;
import www.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	CommunityService sv;

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	@RequestMapping(value="/communitywrite.do",method = RequestMethod.GET)
	public ModelAndView writeCommunity(ModelAndView mav) {
		
		mav.setViewName("user/communitywrite");
	return mav;
		
	} // 글쓰기
	
	@RequestMapping(value="/communityinsert.do",method = RequestMethod.POST)
	public ModelAndView insert(ModelAndView mav, CommunityVo vo){
		
		sv.communityinsert(vo);
		
		mav.setViewName("redirect:/community.do");
	return mav;
	}
	
	@RequestMapping(value="/onecommunity.do",method = RequestMethod.GET)
	public ModelAndView oneCommunity(ModelAndView mav,int idx) {
		logger.info("ff : "+idx);
		mav.addObject("data", sv.oneCommunity(idx));
		mav.setViewName("user/onecommunity");
		
		return mav;
	} // 글보기(게시글중 한개를 확대해서 봄) 글의 인덱스,사용자 아이디
	

//
//	public ModelAndView SearchCommunity(CommunityVo vo) {
//		return null;
//	} // 검색하기
//

//
//	public @ResponseBody Map<String, CommentVo> writeCcomment(CommentVo vo) {
//		return null;
//	}// 댓글쓰기
//
//	public @ResponseBody Map<String, CommentVo> updateCcomment(CommentVo vo) {
//		return null;
//	}// 댓글수정
//
//	public @ResponseBody Map<String, String> deleteCcomment(int idx) {
//		return null;
//	} // 댓글삭제
}

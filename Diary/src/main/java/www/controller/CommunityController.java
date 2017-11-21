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

import www.dto.CommentVo;
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
		
		mav.addObject("data", sv.oneCommunity(idx));
		
		List<CommentVo> list = sv.ccomment(idx);
		
		for (CommentVo vo : list) {
			logger.info("ff : "+vo);
		}
		
		mav.addObject("list",sv.ccomment(idx) );
		
		mav.setViewName("user/onecommunity");
		
		return mav;
	} // 글보기(게시글중 한개를 확대해서 봄) 글의 인덱스,사용자 아이디
	
	@RequestMapping(value="/ccommentinsert.do",method = RequestMethod.POST)
	public @ResponseBody Map<String, CommentVo> Ccommentinsert(CommentVo vo) {
		logger.info("ff : "+vo);
		sv.ccommentinsert(vo);
		
		Map<String, CommentVo> map = new HashMap<String, CommentVo>();
		
		return map;
	}// 댓글쓰기
	
	@RequestMapping(value="/deleteccomment.do",method = RequestMethod.GET)
	public @ResponseBody Map<String, String> deleteCcomment(int idx) {
		
		sv.deleteccomment(idx);
		
		Map<String, String> map = new HashMap<String, String>();
		
		return map;
	} // 댓글삭제
	
	@RequestMapping(value="/deletecommu.do",method = RequestMethod.GET)
	public ModelAndView deletecommunity(ModelAndView mav,int idx){
		
		sv.deletecommunity(idx);
		
		mav.setViewName("redirect:/community.do");
		
		return mav;
	}//만남의장 글보기 에서 만남의장 게시글 삭제
	
	@RequestMapping(value="/updatecommu.do",method = RequestMethod.POST)
	public ModelAndView updatecommu(ModelAndView mav,CommunityVo vo){
		
		mav.addObject("update", vo);
		mav.setViewName("user/updatecommunity");
		
		return mav;
	}//만남의장 글 수정
	
	@RequestMapping(value="/updatecommu2.do",method = RequestMethod.POST)
	public ModelAndView updatecommu2(ModelAndView mav,CommunityVo vo){
		
		logger.info("GG"+vo.toString());
		
		sv.updatecommu(vo);
		
		mav.setViewName("redirect:/onecommunity.do?idx="+vo.getIdx());
		
		return mav;
	}//만남의장 글 수정처리

//
//	public ModelAndView SearchCommunity(CommunityVo vo) {
//		return null;
//	} // 검색하기
//
//
//	public @ResponseBody Map<String, CommentVo> updateCcomment(CommentVo vo) {
//		return null;
//	}// 댓글수정
//

}

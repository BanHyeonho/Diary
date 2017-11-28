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

import jdk.nashorn.internal.runtime.options.LoggingOption.LoggerInfo;
import www.dto.CommentVo;
import www.dto.CommunityVo;
import www.dto.HitCountVo;
import www.dto.ReportVo;
import www.service.CommunityService;

@Controller
public class CommunityController {

	@Autowired
	CommunityService sv;

	@RequestMapping(value="/communitywrite.do",method = RequestMethod.GET)
	public ModelAndView writeCommunity(ModelAndView mav) {
		mav.addObject("active", "2");
		mav.setViewName("user/communitywrite");
	return mav;
		
	} // 글쓰기
	
	@RequestMapping(value="/communityinsert.do",method = RequestMethod.POST)
	public ModelAndView insert(ModelAndView mav, CommunityVo vo){
		
		sv.communityinsert(vo);
		mav.addObject("active", "2");
		mav.setViewName("redirect:/community.do");
	return mav;
	}
	
	@RequestMapping(value="/onecommunity.do",method = RequestMethod.GET)
	public ModelAndView oneCommunity(ModelAndView mav,HitCountVo vo) {
		
		mav.addObject("data", sv.oneCommunity(vo));
		
		List<CommentVo> list = sv.ccomment(vo.getLinkedidx());
		
		mav.addObject("list",sv.ccomment(vo.getLinkedidx()));
		
		mav.setViewName("user/onecommunity");
		mav.addObject("active", "2");
		return mav;
	} // 글보기(게시글중 한개를 확대해서 봄) 글의 인덱스,사용자 아이디
	
	@RequestMapping(value="/ccommentinsert.do",method = RequestMethod.POST)
	public @ResponseBody Map<String, CommentVo> Ccommentinsert(CommentVo vo) {
		
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
		mav.addObject("active", "2");
		mav.addObject("update", vo);
		mav.setViewName("user/updatecommunity");
		
		return mav;
	}//만남의장 글 수정
	
	@RequestMapping(value="/updatecommu2.do",method = RequestMethod.POST)
	public ModelAndView updatecommu2(ModelAndView mav,CommunityVo vo){
		
		sv.updatecommu(vo);
		
		mav.setViewName("redirect:/onecommunity.do?idx="+vo.getIdx());
		
		return mav;
	}//만남의장 글 수정처리

//
	@RequestMapping(value="/csearch.do",method=RequestMethod.POST)
	public ModelAndView SearchCommunity(ModelAndView mav,CommunityVo vo) {
		
		sv.csearch(vo);
		mav.addObject("list", sv.csearch(vo));
		mav.setViewName("user/community");
		mav.addObject("active", "2");
		return mav;
	} // 검색하기
	
	@RequestMapping(value="/creport.do",method=RequestMethod.GET)
	public ModelAndView creport(ModelAndView mav,ReportVo vo){
		
		mav.addObject("report",vo);
		
		mav.setViewName("user/creportForm");
		return mav;
	}
	
	@RequestMapping(value="/creportinsert.do",method=RequestMethod.POST)
	public @ResponseBody Map<String, String> creportinsert(ModelAndView mav,ReportVo vo){
		
		sv.creportinsert(vo);
	
		Map<String, String> map = new HashMap<String, String>();
		
		return map;
	}
	
	@RequestMapping(value="/ccoreport.do",method=RequestMethod.GET)
	public ModelAndView ccreport(ModelAndView mav,ReportVo vo){
		
		vo.setTitle("댓글신고폼");
		mav.addObject("report",vo);
		
		mav.setViewName("user/creportForm");
		return mav;
	}
	
	@RequestMapping(value="/ccoreportinsert.do",method=RequestMethod.POST)
	public @ResponseBody Map<String, String> ccoreportinsert(ModelAndView mav,ReportVo vo){
		
		System.out.println(sv.toString());
		sv.ccoreportinsert(vo);
		
		Map<String, String> map = new HashMap<String, String>();
		
		return map;
	}
		
		
		
		
	
//
//
//	public @ResponseBody Map<String, CommentVo> updateCcomment(CommentVo vo) {
//		return null;
//	}// 댓글수정
//

}

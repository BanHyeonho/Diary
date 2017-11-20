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
import org.springframework.web.servlet.ModelAndView;

import www.dto.CommentVo;
import www.dto.GoodVo;
import www.dto.HitCountVo;
import www.dto.ReportVo;
import www.dto.ScrapVo;
import www.service.DiaryService;

@Controller
public class DiaryController {

	@Autowired
	DiaryService sv;

	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);

	@RequestMapping(value="/oneDiary.do",method=RequestMethod.GET)
	public ModelAndView oneDiary(ModelAndView mav,HitCountVo vo) {
		
		Map<String,Object> map =sv.onediary(vo);
		mav.addObject("data", map);
		mav.setViewName("user/oneDiary");
		return mav;
	} // 글 하나 확대해서 보기

//	public ModelAndView updateDiary(DiaryVo vo) {
//		return null;
//	} // 글 수정
//
//	public ModelAndView deleteDiary(int idx) {
//		return null;
//	} // 글 삭제
	
	@RequestMapping(value="/writeDComment.do",method=RequestMethod.POST)
	public @ResponseBody Map<String, CommentVo> writeDComment(CommentVo vo) {
		
		
		sv.writedcomment(vo);
		
		Map<String, CommentVo> map = new HashMap<String, CommentVo>();
		
		return map;
	} // 댓글 쓰기

//	public @ResponseBody Map<String, String> deleteDComment(int idx) {
//		return null;
//	} // 댓글 삭제
//
//	public @ResponseBody Map<String, CommentVo> updateDComment(CommentVo vo) {
//		return null;
//	} // 댓글 수정

	@RequestMapping(value="/insertScrap.do",method=RequestMethod.GET)
	public @ResponseBody Map<String, String> insertScrap(ScrapVo vo) {
		
		logger.info(vo.toString());
		sv.insertscrap(vo);
		
		Map<String, String> map = new HashMap<String, String>();
		return map;
	} // 스크랩 하기

	@RequestMapping(value="/search.do",method=RequestMethod.GET)
	public ModelAndView search(ModelAndView mav,String keyword,String option) {
		logger.info("사이즈즈즈즈즈");
		logger.info("사이즈"+sv.search(option, keyword).size());
		mav.addObject("list", sv.search(option, keyword));
		mav.setViewName("user/diary");
		return mav;
	} // 여행일지 글 검색
	
	@RequestMapping(value="/good.do",method=RequestMethod.GET)
	public @ResponseBody Map<String, String> good(GoodVo vo) {
		
		sv.good(vo);
		Map<String, String> map = new HashMap<String, String>();
		return map;
	} // 추천하기	글의 인덱스,아이디

	@RequestMapping(value="/reportForm.do",method=RequestMethod.POST)
	public ModelAndView reportForm(ModelAndView mav,ReportVo vo) {
		
		mav.addObject("report", vo);
		mav.setViewName("user/reportForm");
		return mav;
	} // 신고 폼으로 이동
	@RequestMapping(value="/report.do",method=RequestMethod.POST)
	public @ResponseBody Map<String, String> report(ReportVo vo) {
		
		sv.report(vo);
		
		Map<String, String> map = new HashMap<String, String>();
		return map;
	} // 신고 처리
}

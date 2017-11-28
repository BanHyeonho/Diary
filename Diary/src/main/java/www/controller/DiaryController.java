package www.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.dto.CommentVo;
import www.dto.DiaryVo;
import www.dto.GoodVo;
import www.dto.HitCountVo;
import www.dto.ReportVo;
import www.dto.ScrapVo;
import www.service.DiaryService;
import www.util.FileSave;

@Controller
public class DiaryController {

	@Autowired
	DiaryService sv;

	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);

	@RequestMapping(value = "/oneDiary.do", method = RequestMethod.GET)
	public ModelAndView oneDiary(ModelAndView mav, HitCountVo vo) {

		Map<String, Object> map = sv.onediary(vo);
		mav.addObject("data", map);
		mav.addObject("active", "0");
		mav.setViewName("user/oneDiary");
		return mav;
	} // 글 하나 확대해서 보기

	@RequestMapping(value = "/updateDiary.do", method = RequestMethod.POST)
	public ModelAndView updateDiary(ModelAndView mav,DiaryVo vo) {
		logger.info("/updateDiary.do :"+vo.toString());
		mav.addObject("Diary", vo);
		mav.addObject("active", "0");
		mav.setViewName("user/updateDiary");
		return mav;
	} // 글 수정

	@RequestMapping(value = "/updateDiaryAction.do", method = RequestMethod.POST)
	public ModelAndView updateDiaryAction(ModelAndView mav,HttpServletRequest request) {
		
		
		FileSave fs = new FileSave();
		DiaryVo vo = fs.diaryWrite(request);
		logger.info(vo.toString());
		sv.updatediary(vo);
		
		HitCountVo hit = new HitCountVo();
		hit.setId(vo.getId());
		hit.setLinkedidx(vo.getIdx());
		Map<String, Object> map = sv.onediary(hit);
		mav.addObject("data", map);
		mav.addObject("active", "0");
		mav.setViewName("user/oneDiary");
		
		return mav;
	} // 글 수정처리
	
	@RequestMapping(value = "/deleteDiary.do", method = RequestMethod.GET)
	public ModelAndView deleteDiary(ModelAndView mav, int idx) {

		sv.deletediary(idx);

		mav.setViewName("redirect:/diary.do");
		return mav;
	} // 글 삭제

	@RequestMapping(value = "/writeDComment.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Integer> writeDComment(CommentVo vo) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("idx", sv.writedcomment(vo));
		return map;
	} // 댓글 쓰기

	@RequestMapping(value = "/deleteDComment.do", method = RequestMethod.GET)
	 public @ResponseBody Map<String, String> deleteDComment(int idx) {
		sv.deletedcomment(idx);
		Map<String, String> map = new HashMap<String, String>();
	 return map;
	 } // 댓글 삭제

	@RequestMapping(value = "/insertScrap.do", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> insertScrap(ScrapVo vo) {

		logger.info(vo.toString());
		sv.insertscrap(vo);

		Map<String, String> map = new HashMap<String, String>();
		return map;
	} // 스크랩 하기

	@RequestMapping(value = "/search.do", method = RequestMethod.GET)
	public ModelAndView search(ModelAndView mav, String keyword, String option) {

		mav.addObject("list", sv.search(option, keyword));
		mav.addObject("active", "0");
		mav.setViewName("user/diary");
		return mav;
	} // 여행일지 글 검색

	@RequestMapping(value = "/good.do", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> good(GoodVo vo) {

		sv.good(vo);
		Map<String, String> map = new HashMap<String, String>();
		return map;
	} // 추천하기 글의 인덱스,아이디

	@RequestMapping(value = "/reportForm.do", method = RequestMethod.POST)
	public ModelAndView reportForm(ModelAndView mav, ReportVo vo) {

		mav.addObject("report", vo);
		mav.setViewName("user/reportForm");
		return mav;
	} // 신고 폼으로 이동

	@RequestMapping(value = "/report.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> report(ReportVo vo) {

		sv.report(vo);

		Map<String, String> map = new HashMap<String, String>();
		return map;
	} // 신고 처리
	@RequestMapping(value = "/dcoreport.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> dcoreport(ReportVo vo) {

		sv.dcoreport(vo);

		Map<String, String> map = new HashMap<String, String>();
		return map;
	} // 일지 댓글신고 처리
}

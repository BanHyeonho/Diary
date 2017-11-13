package www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.service.DiaryService;

@Controller
public class DiaryController {

//	@Autowired
//	DiaryService sv;

	private static final Logger logger = LoggerFactory.getLogger(DiaryController.class);

	@RequestMapping(value="/oneDiary.do",method=RequestMethod.GET)
	public ModelAndView oneDiary(ModelAndView mav,int idx) {
		
		
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
//
//	public @ResponseBody Map<String, CommentVo> writeDComment(CommentVo vo) {
//		return null;
//	} // 댓글 쓰기
//
//	public @ResponseBody Map<String, String> deleteDComment(int idx) {
//		return null;
//	} // 댓글 삭제
//
//	public @ResponseBody Map<String, CommentVo> updateDComment(CommentVo vo) {
//		return null;
//	} // 댓글 수정
//
//	public @ResponseBody Map<String, String> insertScrap(String id, int idx) {
//		return null;
//	} // 스크랩 하기
//
//	public ModelAndView search(DiaryVo vo) {
//		return null;
//	} // 여행일지 글 검색
//	
//	public @ResponseBody Map<String, String> good(int idx,String id) {
//		return null;
//	} // 추천하기	글의 인덱스,아이디

}

package www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import www.service.DiaryService;
import www.service.MyPageService;

//@Controller
public class DiaryWriteController {
	
	
	@Autowired
	DiaryService sv;
	
	@Autowired
	MyPageService mv;
	
	private static final Logger logger = LoggerFactory.getLogger(DiaryWriteController.class);

//	public ModelAndView copyScrapList(String id) {
//		return null;
//	} // 스크랩 배끼기(자신의스크랩리스트 창보여줌)
//
//	public ModelAndView copyScrap(int idx) {
//		return null;
//	} // 스크랩 리스트의 글하나를 보여줌
//
//	public ModelAndView writeDiary(DiaryVo vo) {
//		return null;
//	} // 글저장 기능
}

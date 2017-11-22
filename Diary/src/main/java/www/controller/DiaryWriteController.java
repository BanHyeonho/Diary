package www.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.dto.DiaryVo;
import www.service.DiaryService;
import www.service.MyPageService;

@Controller
public class DiaryWriteController {
	
	
	@Autowired
	DiaryService sv;
	
	@Autowired
	MyPageService mv;
	
	private static final Logger logger = LoggerFactory.getLogger(DiaryWriteController.class);

	@RequestMapping(value="/copyScrapList.do",method=RequestMethod.GET)
	public ModelAndView copyScrapList(ModelAndView mav ,String id) {
		logger.info("이름이 null 뜬다!"+mv.myScrap(id).size());
		mav.addObject("scrap_listwow", mv.myScrap(id));
//		logger.info("asdfl;kasldfkjasd"+mv.myScrap(id).toString());
		
		mav.setViewName("user/diarywriteList");
		return mav;
	} // 스크랩 배끼기(자신의스크랩리스트 창보여줌)
//
//	public ModelAndView copyScrap(int idx) {
//		return null;
//	} // 스크랩 리스트의 글하나를 보여줌
	
	@RequestMapping(value="/writeDiary.do",method=RequestMethod.POST)
	public ModelAndView writeDiary(DiaryVo vo,ModelAndView mav) {
		
		logger.info(vo.toString());
		sv.diarywrite(vo);
		mav.setViewName("redirect:/diary.do");
		return mav;
	} // 글저장 기능
}

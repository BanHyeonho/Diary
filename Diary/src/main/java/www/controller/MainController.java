package www.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import www.dto.CommunityVo;
import www.dto.MemberVo;
import www.dto.TopVo;
import www.service.MainService;
import www.util.FileSave;

@Controller
public class MainController {

	@Autowired
	MainService sv;

	// @Autowired
	// MyPageService ms;

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView mainn(ModelAndView mav) {

		List<TopVo> list = sv.Top();
		//logger.info(""+list.size());
		mav.addObject("list", list);
		mav.setViewName("user/main");
		return mav;
	} // 메인으로 이동(로고 눌렀을때)

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public ModelAndView join(ModelAndView mav) {

		mav.setViewName("user/join");
		return mav;
	} // 회원가입 폼으로 이동

	@RequestMapping(value = "/joinAction.do", method = RequestMethod.POST)
	public ModelAndView joinAction(ModelAndView mav, HttpSession session,HttpServletRequest request) {
			
			
			FileSave fs = new FileSave();
			MemberVo vo = fs.join(request);
			sv.memberjoin(vo);
			session.setAttribute("user", vo);
			mav.setViewName("redirect:/main.do");
			return mav;
			
	
	} // 회원가입 처리

	@RequestMapping(value = "/idchk.do", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> idchk(MemberVo vo) {
		String result = sv.idchk(vo.getId());
		Map<String, String> map = new HashMap<String, String>();
		if (result == null) {
			map.put("result", "사용가능한 아이디입니다.");
		} else {
			map.put("result", "아이디가 이미 존재합니다.");
		}
		return map;
	} // 중복 아이디 확인

	@RequestMapping(value = "/nickchk.do", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> nickchk(MemberVo vo) {
		String result = sv.nickchk(vo.getNick());
		Map<String, String> map = new HashMap<String, String>();
		if (result == null) {
			map.put("result", "사용가능한 닉네임입니다.");
		} else {
			map.put("result", "닉네임이 이미 존재합니다.");
		}
		return map;
	} // 중복 닉네임 확인

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(MemberVo vo, HttpSession session) {

		return sv.login(vo, session);
	} // 로그인처리(관리자면 관리자로 이동)

	@RequestMapping(value = "/community.do", method = RequestMethod.GET)
	 public ModelAndView community(ModelAndView mav) {
		 
		List<CommunityVo> list=sv.community();
		//logger.info("개수"+list.size());
		mav.addObject("list", list); 
		mav.addObject("active", "2");
		mav.setViewName("user/community");
		return mav;
	 } // 만남의장으로 이동
	
	@RequestMapping(value = "/diary.do", method = RequestMethod.GET)
	 public ModelAndView diary(ModelAndView mav) {
		
		mav.addObject("list", sv.diary());
		mav.addObject("active", "0");
		mav.setViewName("user/diary");
	 return mav;
	 } // 여행일지로 이동
	
	@RequestMapping(value = "/diarywrite.do", method = RequestMethod.GET)
	 public ModelAndView diarywrite(ModelAndView mav) {
		mav.addObject("active", "1");
		mav.setViewName("user/diarywrite");
	 return mav;
	 } // 여행일지쓰기로 이동

	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(ModelAndView mav,String i,String msg) {
		
		mav.addObject("i", i);
		mav.addObject("msg",msg);
		mav.setViewName("user/mypage");
		
		return mav;
	} // 마이페이지로 이동 개인정보 변경탭

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(ModelAndView mav, HttpSession session) {

		session.invalidate();
		mav.setViewName("redirect:/main.do");
		return mav;
	} // 로그아웃 처리

	@RequestMapping(value = "/pwSearch.do", method = RequestMethod.GET)
	public ModelAndView pwSearch(ModelAndView mav) {
		mav.setViewName("user/pwSearch");
		return mav;
	} // 비밀번호 찾기로 이동

	@RequestMapping(value = "/pwSearchAction.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, String> pwSearchAction(MemberVo vo) {
		//logger.info(vo.toString());
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", sv.pwchk(vo));

		return map;
	} // 비밀번호 찾기 처리

}

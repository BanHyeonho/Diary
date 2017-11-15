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

import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.MemberVo;
import www.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService sv;
	
	/*@Autowired
	MyPageService ms;*/

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping(value="/admin.do",method=RequestMethod.GET)
	public ModelAndView admin(ModelAndView mav) {
//		List<MemberVo> list = sv.allmember();
//		for (MemberVo memberVo : list) {
//			logger.info(memberVo.toString());
//		}
		mav.addObject("mlist",sv.allmember());
		mav.addObject("idx", "0");
		mav.setViewName("admin/admin");
		return mav;
	} // 회원리스트 보기
	
	@RequestMapping(value="/memberSearch.do",method=RequestMethod.GET)
	public ModelAndView memberSearch(ModelAndView mav,String option,String keyword) {	//combo 아이디 인지 닉네임인지 값
		mav.addObject("mlist",sv.searchMember(option, keyword));
		mav.addObject("idx", "0");
		mav.setViewName("admin/admin");
		return mav;
	} // 회원검색(아이디,닉네임)
	
	@RequestMapping(value="/blackMember.do",method=RequestMethod.GET)
	public @ResponseBody Map<String, List<MemberVo>> blackMember(String report) {
		logger.info(report);
		Map<String,List<MemberVo>> map = new HashMap<String, List<MemberVo>>();
		map.put("blacklist",sv.blacklist());
		return map;
	} // 블랙리스트 보기

//	public ModelAndView oneMember(MemberVo vo){
//		return null;
//	}//	회원한명 정보 상세히 보기
//	
//	public @ResponseBody Map<String, String> reportMsg(MsgVo vo) {
//		return null;
//	} // 경고쪽지 보내기
//
//	public ModelAndView deleteMember(String id) {
//		return null;
//	} // 계정삭제
//
	@RequestMapping(value="/alldiary.do",method=RequestMethod.GET)
	public ModelAndView alldiary(ModelAndView mav){
//		List<DiaryVo> list =sv.alldiary();
//		for(DiaryVo diaryVo: list){
//			logger.info(diaryVo.toString());
//		}
		mav.addObject("dlist",sv.alldiary());
		mav.addObject("idx", "1");
		mav.setViewName("admin/admin");
		return mav;
	}//여행일지글 리스트 보기 
	
	@RequestMapping(value="/diarySearch.do",method=RequestMethod.GET)
	public ModelAndView diarySearch(ModelAndView mav,String option,String keyword) {
		
		logger.info(option);
		logger.info(keyword);
	
		mav.addObject("dlist",sv.diarySearch(option, keyword));
		mav.addObject("idx", "1");
		mav.setViewName("admin/admin");
		return mav;
	} // 여행일지 검색(글제목,닉네임)
	
	@RequestMapping(value="/reportdlist.do",method=RequestMethod.GET)
	public @ResponseBody Map<String, List<DiaryVo>> reportdlist(String report) {
		logger.info(report);
		Map<String,List<DiaryVo>> map = new HashMap<String, List<DiaryVo>>();
		map.put("reportdlist",sv.reportdlist());
		return map;
	} // 여행일지 신고된글 리스트 보기

//	public @ResponseBody Map<String,String> reportOk(MemberVo vo,int idx) {
//		return null;
//	} // 여행일지 신고확정 글쓴이에게 경고카운트 누적
//	
//	public @ResponseBody Map<String,String> reportcancel(DiaryVo vo) {
//		return null;
//	} // 여행일지 신고취소
	
	@RequestMapping(value="/deletediary.do",method=RequestMethod.GET)
	public @ResponseBody Map<String,String> deletediary(DiaryVo vo) {
		Map<String,String> map = new HashMap<String,String>();
		sv.deletediary(vo.getIdx());
		map.put("deletediary","deletediary");
		return map;
	} // 여행일지 글삭제

	
	@RequestMapping(value="/allcommunity.do",method=RequestMethod.GET)
	public ModelAndView allcommunity(ModelAndView mav){
		
		mav.addObject("clist",sv.allcommunity());
		mav.addObject("idx", "2");
		mav.setViewName("admin/admin");
		return mav;
	}//커뮤니티글 리스트보여주기
	
	@RequestMapping(value="/reportclist.do",method=RequestMethod.GET)
	public @ResponseBody Map<String, List<CommunityVo>> reportclist(String report) {
		logger.info(report);
		Map<String,List<CommunityVo>> map = new HashMap<String, List<CommunityVo>>();
		map.put("reportclist",sv.reportclist());
		return map;
	} 
	
//	public @ResponseBody Map<String,String> reportCOk(MemberVo vo,int idx) {
//		return null;
//	} // 커뮤니티 신고확정 글쓴이에게 경고카운트 누적
//	
//	
//	public @ResponseBody Map<String,String> reportCcancel(CommunityVo vo) {
//		return null;
//	} // 커뮤니티 신고취소
//
	@RequestMapping(value="/deletecommunity.do",method=RequestMethod.GET)
	public @ResponseBody Map<String,String> deletecommunity(CommunityVo vo) {
		Map<String,String> map = new HashMap<String,String>();
		sv.deletecommunity(vo.getIdx());
		map.put("deletecommunity","deletecommunity");
		return map;
	} // 커뮤니티 글삭제
//	public ModelAndView reportReason(int idx){
//		
//		return null;
//	}//여행일지 글 신고사유 보기
//	
//	public ModelAndView reportCReason(int idx){
//		
//		return null;
//	}//커뮤니티 글 신고사유 보기
//	
//	
//	public ModelAndView searchDiary(String keyword,int choose){		//choose 닉네임 인지 제목인지 여행일지에서 검색
//		return null;
//	}
//	
//	public ModelAndView searchCommunity(String keyword,int choose){		//choose 닉네임 인지 제목인지 커뮤니티에서 검색
//		return null;
//	}
	
//	@RequestMapping(value="/reportcomment.do",method=RequestMethod.GET)
//	public ModelAndView reportcomment(ModelAndView mav,int report){
//		
//		mav.addObject("rclist",sv.reportcomment());
//		mav.addObject("idx", "3");
//		mav.setViewName("admin/admin");
//		return mav;
//	}//댓글 리스트 글보여주기
	
	
}

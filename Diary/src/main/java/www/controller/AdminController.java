package www.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
//		
//		for (MemberVo memberVo : list) {
//			logger.info(memberVo.toString());
//		}
		mav.addObject("mlist",sv.allmember());
		mav.setViewName("admin/admin");
		return mav;
	} // 회원리스트 보기
//
//	public ModelAndView blackMember(int report) {
//		return null;
//	} // 블랙리스트 보기
//
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
//	public ModelAndView reportlist(int report) {	//일지테이블 dreportcount
//		return null;
//	} // 여행일지 신고된글 리스트 보기
//
//	public @ResponseBody Map<String,String> reportOk(MemberVo vo,int idx) {
//		return null;
//	} // 여행일지 신고확정 글쓴이에게 경고카운트 누적
//	
//	public @ResponseBody Map<String,String> reportcancel(DiaryVo vo) {
//		return null;
//	} // 여행일지 신고취소
//
//	public @ResponseBody Map<String,String> deletereport(DiaryVo vo) {
//		return null;
//	} // 여행일지 글삭제
//
	@RequestMapping(value="/memberSearch.do",method=RequestMethod.GET)
	public ModelAndView memberSearch(ModelAndView mav,MemberVo vo) {	//combo 아이디 인지 닉네임인지 값
		sv.searchMember(vo);
		mav.addObject("mlist",sv.searchMember(vo));
		mav.setViewName("admin/admin");
		return mav;
	} // 회원검색(아이디,닉네임)
//	
//	public ModelAndView reportClist(int report) {	//커뮤니티 테이블 creportcount
//		return null;
//	} // 커뮤니티 신고된글 리스트 보기
//
//	
//	public @ResponseBody Map<String,String> reportCOk(MemberVo vo,int idx) {
//		return null;
//	} // 커뮤니티 신고확정 글쓴이에게 경고카운트 누적
//	
//	
//	public @ResponseBody Map<String,String> reportCcancel(CommunityVo vo) {
//		return null;
//	} // 커뮤니티 신고취소
//
//	public @ResponseBody Map<String,String> deleteCreport(CommunityVo vo) {
//		return null;
//	} // 커뮤니티 글삭제
//	
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
	
}

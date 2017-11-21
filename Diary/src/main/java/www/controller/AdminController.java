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
import www.dto.DiaryVo;
import www.dto.MemberVo;
import www.dto.ReportVo;
import www.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService sv;

	/*
	 * @Autowired MyPageService ms;
	 */

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public ModelAndView admin(ModelAndView mav) {
		// List<MemberVo> list = sv.allmember();
		// for (MemberVo memberVo : list) {
		// logger.info(memberVo.toString());
		// }
		mav.addObject("mlist", sv.allmember());
		mav.addObject("idx", "0");
		mav.setViewName("admin/admin");
		return mav;
	} // 계정관리-회원리스트 보기

	@RequestMapping(value = "/memberSearch.do", method = RequestMethod.GET)
	public ModelAndView memberSearch(ModelAndView mav, String option, String keyword) { 
		mav.addObject("mlist", sv.searchMember(option, keyword));
		mav.addObject("idx", "0");
		mav.setViewName("admin/admin");
		return mav;
	} // 계정관리-회원검색(아이디,닉네임)

	@RequestMapping(value = "/blackMember.do", method = RequestMethod.GET)
	public @ResponseBody Map<String, List<MemberVo>> blackMember(String report) {
		logger.info(report);
		Map<String, List<MemberVo>> map = new HashMap<String, List<MemberVo>>();
		map.put("blacklist", sv.blacklist());
		return map;
	} // 계정관리-블랙리스트 보기

	@RequestMapping(value = "/oneMember.do", method = RequestMethod.GET)
	public ModelAndView oneMember(ModelAndView mav, MemberVo vo) {
		mav.addObject("userinfo", sv.oneMember(vo.getId()));
		mav.setViewName("admin/oneMember");
		return mav;
	}// 계정관리-정보보기버튼-회원한명 정보 상세히 보기
	
	@RequestMapping(value = "/confirm.do", method = RequestMethod.GET)
	public ModelAndView confirm(ModelAndView mav,MemberVo vo ) {
		// List<MemberVo> list = sv.allmember();
		// for (MemberVo memberVo : list) {
		// logger.info(memberVo.toString());
		// }

		sv.updatedmember(vo);
		mav.setViewName("redirect:/admin.do");
		return mav;
	} // 계정관리-정보보기후 신고회수 고치고 확인 버튼눌렀을때

	// public @ResponseBody Map<String, String> reportMsg(MsgVo vo) {
	// return null;
	// } // 경고쪽지 보내기
	 
	@RequestMapping(value = "/deleteAccount.do", method = RequestMethod.GET)
	 public ModelAndView deleteAccount(ModelAndView mav,MemberVo vo) {
		sv.deleteAccount(vo.getId());
		mav.setViewName("redirect:/admin.do");
		return mav;
	 } // 계정보기-정보보기버튼 클릭후 계정삭제
	
	@RequestMapping(value = "/alldiary.do", method = RequestMethod.GET)
	public ModelAndView alldiary(ModelAndView mav) {
		// List<DiaryVo> list =sv.alldiary();
		// for(DiaryVo diaryVo: list){
		// logger.info(diaryVo.toString());
		// }
		mav.addObject("dlist", sv.alldiary());
		mav.addObject("idx", "1");
		mav.setViewName("admin/admin");
		return mav;
	}// 일지게시판-여행일지글 리스트 보기

	@RequestMapping(value = "/diarySearch.do", method = RequestMethod.GET)
	public ModelAndView diarySearch(ModelAndView mav, String option, String keyword) {

//		logger.info(option);
//		logger.info(keyword);

		mav.addObject("dlist", sv.diarySearch(option, keyword));
		mav.addObject("idx", "1");
		mav.setViewName("admin/admin");
		return mav;
	} // 일지게시판-여행일지 검색(글제목,닉네임)

	@RequestMapping(value = "/reportdlist.do", method = RequestMethod.GET)
	public @ResponseBody Map<String, List<DiaryVo>> reportdlist(String report) {
		//logger.info(report);
		Map<String, List<DiaryVo>> map = new HashMap<String, List<DiaryVo>>();
		map.put("reportdlist", sv.reportdlist());
		return map;
	} // 일지게시판-여행일지 신고된글 리스트 보기

	@RequestMapping(value = "/deletediary.do", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> deletediary(DiaryVo vo) {
		Map<String, String> map = new HashMap<String, String>();
		sv.deletediary(vo.getIdx());
		map.put("deletediary", "deletediary");
		return map;
	} // 일지게시판-여행일지 글삭제
	
	@RequestMapping(value = "/viewDiary.do", method = RequestMethod.GET)
	public ModelAndView viewDiary(ModelAndView mav, DiaryVo vo) {
		logger.info(""+sv.viewDiary(vo.getIdx()));
		mav.addObject("viewDiary", sv.viewDiary(vo.getIdx()));
		mav.setViewName("admin/viewDiary");
		return mav;
	}// 일지게시판 글보기버튼-상세히 보기
	
	@RequestMapping(value = "/dreportReason.do", method = RequestMethod.GET)
	public ModelAndView dreportReason(ModelAndView mav, ReportVo vo,String d) {
		
		mav.addObject("reportReason", sv.dreportReason(vo.getIdx()));
		mav.addObject("d", d);
		mav.setViewName("admin/reportReason");
		return mav;
	}// 일지게시판 신고사유버튼-상세히 보기
	
	@RequestMapping(value = "/guilt.do", method = RequestMethod.GET)
	 public ModelAndView guilt(ModelAndView mav,int idx) {
		
		sv.guilt(idx);
		mav.setViewName("redirect:/alldiary.do");
	 return mav;
	 } // 여행일지 신고확정 글쓴이에게 경고카운트 누적,-유죄
	
	@RequestMapping(value = "/acquit.do", method = RequestMethod.GET)
	public ModelAndView acquit(ModelAndView mav,int idx) {


		sv.acquit(idx);
		mav.setViewName("redirect:/alldiary.do");

		return mav;
	} // 여행일지 신고취소-무죄

	@RequestMapping(value = "/allcommunity.do", method = RequestMethod.GET)
	public ModelAndView allcommunity(ModelAndView mav) {

		mav.addObject("clist", sv.allcommunity());
		mav.addObject("idx", "2");
		mav.setViewName("admin/admin");
		return mav;
	}// 만남의장글 리스트보여주기

	@RequestMapping(value = "/communitySearch.do", method = RequestMethod.GET)
	public ModelAndView communitySearch(ModelAndView mav, String option, String keyword) {

		mav.addObject("clist", sv.communitySearch(option, keyword));
		mav.addObject("idx", "2");
		mav.setViewName("admin/admin");
		return mav;
	} // 만남의장 검색(글제목,닉네임)

	// @RequestMapping(value="/communitySearch.do",method=RequestMethod.GET)
	// public @ResponseBody Map<String, List<CommunityVo>>
	// communitySearch(CommunityVo vo,String option,String keyword) {
	//
	// logger.info(option,keyword);
	// Map<String,List<CommunityVo>> map = new
	// HashMap<String,List<CommunityVo>>();
	// map.put("communitySearch",sv.communitySearch(option, keyword));
	// return map;
	// } // 커뮤니티 검색(글제목,닉네임)
	//

	@RequestMapping(value = "/reportclist.do", method = RequestMethod.GET)
	public @ResponseBody Map<String, List<CommunityVo>> reportclist(String report) {
		//logger.info(report);
		Map<String, List<CommunityVo>> map = new HashMap<String, List<CommunityVo>>();
		map.put("reportclist", sv.reportclist());
		return map;
	} //만남의장 신고된 글리스트보기

	@RequestMapping(value = "/viewCommunity.do", method = RequestMethod.GET)
	public ModelAndView viewCommunity(ModelAndView mav, DiaryVo vo) {
		mav.addObject("viewCommunity", sv.viewCommunity(vo.getIdx()));
		mav.setViewName("admin/viewCommunity");
		return mav;
	}// 만남의장 글보기버튼-상세히 보기
	
	@RequestMapping(value = "/creportReason.do", method = RequestMethod.GET)
	public ModelAndView creportReason(ModelAndView mav, ReportVo vo) {
		
		logger.info(""+vo.getIdx());
		logger.info(""+sv.creportReason(vo.getIdx()).size());
		
		mav.addObject("reportReason", sv.creportReason(vo.getIdx()));
		mav.setViewName("admin/reportReason");
		return mav;
	}// 만남의장 신고사유버튼-상세히 보기
	
	// public @ResponseBody Map<String,String> reportCOk(MemberVo vo,int idx) {
	// return null;
	// } // 커뮤니티 신고확정 글쓴이에게 경고카운트 누적
	//
	//
	// public @ResponseBody Map<String,String> reportCcancel(CommunityVo vo) {
	// return null;
	// } // 커뮤니티 신고취소
	//
	@RequestMapping(value = "/deletecommunity.do", method = RequestMethod.GET)
	public @ResponseBody Map<String, String> deletecommunity(CommunityVo vo) {
		Map<String, String> map = new HashMap<String, String>();
		sv.deletecommunity(vo.getIdx());
		map.put("deletecommunity", "deletecommunity");
		return map;
	} // 커뮤니티 글삭제
  
	
	 @RequestMapping(value="/reportcomment.do",method=RequestMethod.GET)
	 public @ResponseBody Map<String, List<CommentVo>> reportcomment(String report) {
			logger.info(report);
			Map<String, List<CommentVo>> map = new HashMap<String, List<CommentVo>>();
			map.put("reportDcomment", sv.reportDcomment());	// 일지댓글
			map.put("reportCcomment", sv.reportCcomment());	// 만남댓금
			return map;
		}//댓글 리스트 글보여주기
	 
		@RequestMapping(value = "/deleteDcomment.do", method = RequestMethod.GET)
		public @ResponseBody Map<String, String> deleteDcomment(CommentVo vo) {
			Map<String, String> map = new HashMap<String, String>();
			sv.deleteDcomment(vo.getIdx());
			map.put("deleteDcomment", "deleteDcomment");
			return map;
		} //  신고된 댓글삭제
		
//		@RequestMapping(value = "/creportReason.do", method = RequestMethod.GET)
//		public ModelAndView dcoreportReason(ModelAndView mav, ReportVo vo) {
//			
//			logger.info(""+vo.getIdx());
//			logger.info(""+sv.creportReason(vo.getIdx()).size());
//			
//			mav.addObject("dcoreportReason", sv.dcoreportReason(vo.getIdx()));
//			mav.setViewName("admin/coReportreason");
//			return mav;
//		}// 여행일지댓글: 신고사유버튼-상세히 보기
}

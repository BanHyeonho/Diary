package www.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import www.dto.MsgVo;
import www.service.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	MyPageService sv;

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@RequestMapping(value="/updateInfoAction.do",method = RequestMethod.POST)
	public ModelAndView updateInfoAction(ModelAndView mav,MemberVo vo,HttpSession session) {
		
		sv.updateinfo(vo);
		session.setAttribute("user", vo);
		mav.setViewName("redirect:/main.do");
		return mav;
	} // 개인정보 수정 처리

	@RequestMapping(value="/deleteInfoAction.do",method = RequestMethod.GET)
	public ModelAndView deleteInfoAction(ModelAndView mav,String id,HttpSession session) {
		logger.info(id);
		
		session.invalidate();
		sv.deleteinfo(id);
		
		mav.setViewName("redirect:/main.do");
		return mav;
	} // 회원탈퇴
	
	@RequestMapping(value="/myDiary.do",method = RequestMethod.POST)
	public @ResponseBody Map<String,List<DiaryVo>> myDiary(String id) {
		Map<String, List<DiaryVo>> map = new HashMap<String, List<DiaryVo>>();
		
		
		map.put("mydiary", sv.mydiary(id));
		
		
		return map;
	} // 내가쓴글 확인 페이지로 이동(리스트 보여줌)

	@RequestMapping(value="/myCommunity.do" ,method = RequestMethod.POST)
	public @ResponseBody Map<String,List<CommunityVo>> myCommunity(String id) {
		Map<String, List<CommunityVo>> map = new HashMap<String, List<CommunityVo>>();
		
		map.put("mycommu", sv.mycommu(id));
		return map;
	} // 만남의장에 내가쓴글 보기
//
//
//
//	public @ResponseBody Map<String,List<DiaryVo>> myScrap(String id) {
//		return null;
//	} // 스크랩글 보기 로 이동(리스트)
//
//	public @ResponseBody Map<String,String> deleteMyScrap(int idx) {
//		return null;
//	} // 스크랩글 삭제
//
	@RequestMapping(value="/msg.do", method = RequestMethod.POST)
	public @ResponseBody Map<String,List<MsgVo>> msg(String id) {
		Map<String,List<MsgVo>> map = new HashMap<String,List<MsgVo>>();
		logger.info("hghghgh"+sv.msg(id).toString());
		map.put("msg",sv.msg(id));
		return map;
	} // 쪽지함보기(리스트)

	
	@RequestMapping(value="/deleteMsg.do",method = RequestMethod.GET)
	public @ResponseBody Map<String,String> deleteMsg(int idx) {
		
		logger.info(""+idx);
		sv.deletemsg(idx);
		
		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("result", "메세지 삭제 성공");
		return map;
	} // 쪽지 삭제

	@RequestMapping(value="/sendMsgForm.do",method = RequestMethod.POST)
	public ModelAndView sendMsgForm(ModelAndView mav,MsgVo vo) {
		
		mav.addObject("data", vo);
		mav.setViewName("user/msgSend");
		return mav;
	} // 쪽지 보내기폼으로 이동 답장하기
//	
//	public @ResponseBody Map<String,List<FollowVo>> following(String id) {
//		return null;
//	}//내가 팔로우한사람 보는 리스트
//	
//	public @ResponseBody Map<String,List<FollowVo>> followers(String id) {
//		return null;
//	}//나를 팔로우한사람 보는 리스트
//	
//	public ModelAndView blockMember(BlockVo vo){
//		return null;
//	}//차단하기
}

package www.controller;

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

import www.dto.BlockVo;
import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.FollowVo;
import www.dto.MemberVo;
import www.dto.MsgVo;
import www.dto.ScrapVo;
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
		//logger.info(id);
		
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
		
		map.put("mycommu", sv.community(id));
		return map;
	} // 만남의장에 내가쓴글 보기


	@RequestMapping(value="/myScrap.do", method =RequestMethod.POST)
	public @ResponseBody Map<String,List<ScrapVo>> myScrap(String id) {
		Map<String, List<ScrapVo>> map = new HashMap<String,List<ScrapVo>>();
		
		map.put("myScrap",sv.myScrap(id));
		
		
		return map;
	} // 스크랩글 보기 로 이동(리스트)

	@RequestMapping(value="/deleteMyScrap.do", method =RequestMethod.GET)
	public @ResponseBody Map<String,String> deleteMyScrap(ScrapVo vo) {
		
		//sv.deletemyscrap(vo);
		
		Map<String,String> map = new HashMap<String, String>();
		return map;
	} // 스크랩글 삭제

	@RequestMapping(value="/msg.do", method = RequestMethod.POST)
	public @ResponseBody Map<String,List> msg(String id) {
		Map<String,List> map = new HashMap<String,List>();
		//logger.info("hghghgh"+sv.msg(id).toString());
		sv.msgchkupdate(id);
		
		map.put("msg",sv.msg(id)); //쪽지함 리스트
		map.put("block",sv.myblock(id)); //쪽지함 이동시 차단한 회원 안보이게 하기
		
		return map;
	} // 쪽지함보기(리스트)// 쪽지함 이동시 차단 회원 안보이게 함(리스트)

	
	@RequestMapping(value="/deleteMsg.do",method = RequestMethod.GET)
	public @ResponseBody Map<String,String> deleteMsg(int idx) {
		
		//logger.info(""+idx);
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
	
	@RequestMapping(value="/following.do", method = RequestMethod.POST)
	public @ResponseBody Map<String,List<FollowVo>> following(String id) {
		Map<String,List <FollowVo>> map = new HashMap<String,List <FollowVo>>();
		
		map.put("following_go", sv.following(id));
		return map;
	}//내가 팔로우한사람 보는 리스트
	
	@RequestMapping(value="/followers.do", method = RequestMethod.POST)
	public @ResponseBody Map<String,List<FollowVo>> followers(String id) {
		Map<String,List <FollowVo>> map = new HashMap<String,List <FollowVo>>();
		
		map.put("followers_go", sv.followers(id));
		return map;
	}//나를 팔로우한사람 보는 리스트

	@RequestMapping(value="/blockMember.do",method = RequestMethod.GET)
	public @ResponseBody Map<String,String> blockMember(BlockVo vo,ModelAndView mav){
		//logger.info(vo.toString());
		sv.blockMember(vo);
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("result", "차단 성공");
		return map;
	}//차단하기
	@RequestMapping(value="/blockList.do",method = RequestMethod.POST)
	public @ResponseBody Map<String,List<BlockVo>> blockList(String id) {
		Map<String, List<BlockVo>> map = new HashMap<String, List<BlockVo>>();
		
		
		map.put("blocknick", sv.myblock(id));
		
		
		return map;
	} // 내가 차단한 회원 목록을 보여줌 (list)
	@RequestMapping(value="/unBlock.do",method = RequestMethod.GET)
	public @ResponseBody Map<String,String> unBlock(int idx) {
		
		//logger.info(""+idx);
		sv.unBlock(idx);
		
		
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("result", "차단 해제 성공");
		
		return map;
	} 
}

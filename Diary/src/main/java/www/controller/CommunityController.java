package www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import www.service.CommunityService;

//@Controller
public class CommunityController {

	@Autowired
	CommunityService sv;

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

//	public ModelAndView writeCommunity(CommunityVo vo) {
//		return null;
//	} // 글쓰기
//
//	public ModelAndView SearchCommunity(CommunityVo vo) {
//		return null;
//	} // 검색하기
//
//	public ModelAndView oneCommunity(int idx,String id) {
//		return null;
//	} // 글보기(게시글중 한개를 확대해서 봄) 글의 인덱스,사용자 아이디
//
//	public @ResponseBody Map<String, CommentVo> writeCcomment(CommentVo vo) {
//		return null;
//	}// 댓글쓰기
//
//	public @ResponseBody Map<String, CommentVo> updateCcomment(CommentVo vo) {
//		return null;
//	}// 댓글수정
//
//	public @ResponseBody Map<String, String> deleteCcomment(int idx) {
//		return null;
//	} // 댓글삭제
}

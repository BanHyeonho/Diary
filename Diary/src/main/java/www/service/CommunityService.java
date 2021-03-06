package www.service;

import java.util.List;

import www.dto.CommentVo;
import www.dto.CommunityVo;
import www.dto.HitCountVo;
import www.dto.ReportVo;

public interface CommunityService {
	public void communityinsert(CommunityVo vo);//만남의 장 글쓰기
	public List<CommunityVo> csearch(CommunityVo vo);	//만남의장 검색
	public CommunityVo oneCommunity(HitCountVo vo); 	//만남의 장 글 하나보기
	public void ccommentinsert(CommentVo vo);//만남의장에 댓글쓰기
	public void deleteccomment(int idx);	//만남의장 댓글삭제
//	public void updateccomment(CommentVo vo);//만남의장 댓글수정
	public List<CommentVo> ccomment(int idx);//만남의장 댓글출력
	public void deletecommunity(int idx);
	public void updatecommu(CommunityVo vo);//만남의장 수정하기
	public void creportinsert(ReportVo vo);//만남의장 신고
	public void ccoreportinsert(ReportVo vo);//만남의장 게시글 신고
		
}

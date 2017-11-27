package www.dao;

import java.util.List;

import www.dto.CommentVo;
import www.dto.CommunityVo;
import www.dto.HitCountVo;
import www.dto.ReportVo;

public interface CommunityDao {
	public void communityinsert(CommunityVo vo);//만남의 장 글쓰기
	public List<CommunityVo> csearch(CommunityVo vo);	//만남의장 검색
	public CommunityVo oneCommunity(int idx); 	//만남의 장 글 하나보기
	public void chitcount(CommunityVo vo);	//조회수 상승
	public List<CommentVo> ccomment(int idx);   //만남의장 하나의 글에 대한 댓글들가져오기 인덱스는 해당글인덱스
	public void ccommentinsert(CommentVo vo); //만남의장에 댓글쓰기
	public void deleteccomment(int idx);	 //만남의장 댓글삭제
	public void deletecommunity(int idx);	//만남의장 글 삭제
	public void updatecommu(CommunityVo vo);		//만남의장 글 수정
//	public void updateccomment(CommentVo vo); //만남의장 댓글수정
	public HitCountVo hitCountChk(HitCountVo vo);	//조회했는지 아닌지 확인
	public void hitcounted(HitCountVo vo);			//조회하여 hit테이블에 값이 들어감
	public void creportinsert(ReportVo vo);	//게시글 신고
	public void creportup(ReportVo vo);	//게시글 신고 카운트
	public void ccoreportinsert(ReportVo vo);	//만남의장 댓글 신고
	public void ccoreportup(ReportVo vo);	//댓글 신고 카운트

}

package www.service;

import java.util.List;

import www.dto.ScrapVo;
import www.dto.BlockVo;
import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.FollowVo;
import www.dto.MemberVo;
import www.dto.MsgVo;

public interface MyPageService {
	
	public void updateinfo(MemberVo vo);	//개인정보수정
	public void deleteinfo(String id);	//회원탈퇴
	public List<DiaryVo> mydiary(String id);//내가쓴글 보기(팔로우글보기)
	public List<CommunityVo> community(String id); // 내가쓴 만남의장 글 보기
	public List<FollowVo> following(String id);	//내가 팔로우한사람 보기
	public List<FollowVo> followers(String id);	//나를 팔로우한사람 보기
	public void addfollow(FollowVo vo);	//팔로우하기
	public void deletefollow(FollowVo vo);	//팔로우삭제하기
//	public List<CommunityVo> mycommunity(String id);//내가쓴 만남의장글 보기
	public List<DiaryVo> myScrap(String id); //스크랩글 보기(여행일지쓰기에서 스크랩배끼기눌렀을 경우사용)
//	public void deletemyscrap(ScrapVo vo);	//스크랩글 삭제
	public List<MsgVo> msg(String id);	//쪽지함 보기
	public void deletemsg(int idx);		//쪽지삭제
	public void sendmsg(MsgVo vo);		//쪽지 보내기

	public void blockMember(BlockVo vo);//차단하기
	public List<BlockVo> myblock(String id); ////쪽지함 이동시 차단 목록 안보이게 하기  ,내가 차단한 회원목록 보여주기
	public void unBlock(int idx);   //차단 해제하기
	public List<MsgVo> msgchk(String id);  //메세지함 1 or 0인지 체크해서 result값 보냄
	public void msgchkupdate(String id);  //메세지함 chk를 0으로 만듬
	
	
}

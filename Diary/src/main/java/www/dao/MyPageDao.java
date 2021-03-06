package www.dao;

import java.util.List;

import www.dto.BlockVo;
import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.FollowVo;
import www.dto.MemberVo;
import www.dto.MsgVo;
import www.dto.ScrapVo;

public interface MyPageDao {
	
	public void updateinfo(MemberVo vo);	//개인정보수정
	public void deleteinfo(String id);	//회원탈퇴
	public List<DiaryVo> mydiary(String id);//내가쓴글 보기(팔로우글보기)
	public List<CommunityVo> mycommu(String id);
	public void addfollow(FollowVo vo);	//팔로우하기
	public void deletefollow(int idx);	//팔로우삭제하기
	public List<FollowVo> following(String id);	//내가 팔로우한사람 보기
	public List<FollowVo> followers(String id);	//나를 팔로우한사람 보기
//	public List<CommunityVo> mycommunity(String id);//내가쓴 만남의장글 보기
//	public void updatemycommunity(CommunityVo vo);	//내가쓴 만남의장글 수정

	public List<DiaryVo> myScrap(String id);	//스크랩글 보기 리스트(여행일지쓰기에서 스크랩배끼기눌렀을 경우사용)
//	public void deletemyscrap(int idx);	//스크랩글 삭제
	public List<MsgVo> msg(String id);	//쪽지함 보기
//	public void msgReset();				//쪽지함의 글 chk 값을 0으로 리셋
	public void deletemsg(int idx);		//쪽지삭제
	public void sendmsg(MsgVo vo);		//쪽지 보내기
	public void blockMember(BlockVo vo);//차단하기
	public List<BlockVo> myblock(String id); //쪽지함 이동시 차단 목록 안보이게 하기
	public void unBlock(int idx); // 차단해제 하기
	public int getfollowidx(FollowVo vo);		//팔로우해제를 위한 인덱스 값받기
	public List<MsgVo> msgchk(String id);  ////메세지함 1 or 0인지 체크해서 result값 보냄
	public void msgchkupdate(String id);  //메세지함 에있는 chk 를 0으로만듬

	
}

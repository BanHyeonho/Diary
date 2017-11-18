package www.service;

import java.util.List;

import www.dto.CommentVo;
import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.MemberVo;
import www.dto.ReportVo;

public interface AdminService {

	public List<MemberVo> allmember(); // 모든회원보기

	public List<MemberVo> blacklist(); // 신고횟수기준 블랙리스트

//	public void deletemember(int idx); // 블랙멤버삭제
//
	public List<DiaryVo> reportdlist(); // 신고된여행일지글보기 30개
	
//	public void reportOk(MemberVo vo,int idx); // 신고확정으로 인한 글쓴이의 경고 누적과 함께 다이어리글도 삭제됨	글쓴이의 정보와 해당글의 인덱스를 매개변수로
//
//	public void reportcancel(int idx); // 신고된글 신고취소

	public void deletediary(int idx); // 신고된 글삭제
	
	public List<MemberVo> searchMember(String option,String keyword); // 회원검색(아이디,닉네임)
	
	public List<DiaryVo> alldiary(); //모든일지글보기
	
	public List<CommunityVo> allcommunity(); //모든일지글보기

	public List<DiaryVo> diarySearch(String option,String keyword); // 글검색(글제목,닉네임)

	public List<CommentVo> reportDcomment(); // 여행일지 신고된댓글보기
	
	public List<CommentVo> reportCcomment(); //만남의장 신고된 댓글보기

	public List<CommunityVo> reportclist(); // 신고된커뮤니티글보기	30개
	
//	public void reportCOk(MemberVo vo,int idx); // 신고확정으로 인한 글쓴이의 경고 누적과 함께 커뮤니티글도 삭제됨	글쓴이의 정보와 해당글의 인덱스를 매개변수로
//	
//	public void reportCcancel(int idx); // 신고된 커뮤니티글 신고취소
//
	public void deletecommunity(int idx); // 신고된 커뮤니티글삭제
	
//	public ReportVo reportReason(int idx); //여행일지글 신고사유 보기
//	
//	public ReportVo reportCReason(int idx); //커뮤니티글 신고사유 보기
	
	public List<CommunityVo> communitySearch(String option,String keyword); // 만남의장 검색(글제목,닉네임)

	public MemberVo oneMember(String id); //정보보기 버튼누를때

	public void updatedmember(MemberVo vo); //정보보기버튼에서 확인버튼누를때

	public void deleteAccount(String id); //정보보기버튼에서 계정삭제버튼 누를때 

	public void deleteDcomment(int idx); //아직?

	public DiaryVo viewDiary(int idx); //일지게시판 글보기 버튼

	public CommunityVo viewCommunity(int idx); //커뮤니티 글보기 버튼

	public List<ReportVo> dreportReason(int linkedidx); //일지게시판 신고사유보기

	

}

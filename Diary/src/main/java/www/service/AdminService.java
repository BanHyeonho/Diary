package www.service;

import java.util.List;

import www.dto.CommentVo;
import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.MemberVo;

public interface AdminService {

	public List<MemberVo> allmember(); // 모든회원보기

//	public List<MemberVo> blacklist(int report); // 신고횟수기준 블랙리스트
//
//	public void deletemember(int idx); // 블랙멤버삭제
//
//	public List<DiaryVo> reportlist(int report); // 신고된여행일지글보기	30개
//	
//	public void reportOk(MemberVo vo,int idx); // 신고확정으로 인한 글쓴이의 경고 누적과 함께 다이어리글도 삭제됨	글쓴이의 정보와 해당글의 인덱스를 매개변수로
//
//	public void reportcancel(int idx); // 신고된글 신고취소
//
//	public void deletereport(int idx); // 신고된 글삭제
//	
	public List<MemberVo> searchMember(String option,String keyword); // 회원검색(아이디,닉네임)
	
	public List<DiaryVo> alldiary(); //모든일지글보기
	
	public List<CommunityVo> allcommunity(); //모든일지글보기

	public List<DiaryVo> diarySearch(String option,String keyword); // 글검색(글제목,닉네임)

//	public List<CommentVo> reportcomment(); //신고된댓글보기

//	public List<CommunityVo> reportClist(int report); // 신고된커뮤니티글보기	30개
//	
//	public void reportCOk(MemberVo vo,int idx); // 신고확정으로 인한 글쓴이의 경고 누적과 함께 커뮤니티글도 삭제됨	글쓴이의 정보와 해당글의 인덱스를 매개변수로
//	
//	public void reportCcancel(int idx); // 신고된 커뮤니티글 신고취소
//
//	public void deleteCreport(int idx); // 신고된 커뮤니티글삭제
//	
//	public ReportVo reportReason(int idx); //여행일지글 신고사유 보기
//	
//	public ReportVo reportCReason(int idx); //커뮤니티글 신고사유 보기
//	
//	public List<DiaryVo> serchDiary(String keyword,int choose);	// 필터(닉네임,글제목) 과 키워드로 여행일지 검색
//	
//	public List<DiaryVo> serchCommunity(String keyword,int choose);	// 필터(닉네임,글제목) 과 키워드로 커뮤니티 검색
}

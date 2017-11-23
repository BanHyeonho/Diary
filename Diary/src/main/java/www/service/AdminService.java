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

	public List<DiaryVo> reportdlist(); // 신고된여행일지글보기 30개
	
	public void deletediary(int idx); // 신고된 글삭제
	
	public List<MemberVo> searchMember(String option,String keyword); // 회원검색(아이디,닉네임)
	
	public List<DiaryVo> alldiary(); //모든일지글보기
	
	public List<CommunityVo> allcommunity(); //모든일지글보기

	public List<DiaryVo> diarySearch(String option,String keyword); // 글검색(글제목,닉네임)

	public List<CommentVo> reportDcomment(); // 여행일지 신고된댓글보기
	
	public List<CommentVo> reportCcomment(); //만남의장 신고된 댓글보기

	public List<CommunityVo> reportclist(); // 신고된커뮤니티글보기	30개
	
	public void deletecommunity(int idx); // 신고된 커뮤니티글삭제
	
	public List<CommunityVo> communitySearch(String option,String keyword); // 만남의장 검색(글제목,닉네임)

	public MemberVo oneMember(String id); //정보보기 버튼누를때

	public void updatedmember(MemberVo vo); //정보보기버튼에서 확인버튼누를때

	public void deleteAccount(String id); //정보보기버튼에서 계정삭제버튼 누를때 

	public void deleteDcomment(int idx); //여행일지 댓글삭제
	
	public void deleteCcomment(int idx); //커뮤니티 댓글삭제

	public DiaryVo viewDiary(int idx); //일지게시판 글보기 버튼

	public CommunityVo viewCommunity(int idx); //커뮤니티 글보기 버튼

	public List<ReportVo> dreportReason(int linkedidx); //일지게시판 신고사유보기

	public List<ReportVo> creportReason(int linkedidx); //만남의장 신고사유보기

	public void Dacquit(int idx); //(여행일지)신고사유 무죄버튼
	
	public void Cacquit(int idx);//(커뮤니티)신고사유 무죄버튼

	public void dGuilt(int idx);// (여행일지)신고사유 유죄버튼

	public void cGuilt(int idx);//(커뮤니티)신고사유 유죄버튼

	public List<ReportVo> dcoreportReason(int idx); //일지게시판 댓글신고사유보기

	public List<ReportVo> ccoreportReason(int idx);  //커뮤니티 댓글신고사유보기

	public void doGuilt(int idx);// (여행일지댓글)신고사유 유죄버튼

	public void coGuilt(int idx);// (커뮤니티댓글)신고사유 유죄버튼

	public void Coacquit(int idx);//(커뮤니티댓글)신고사유 무죄버튼

	public void Doacquit(int idx); //(여행일지댓글)신고사유 무죄버튼

	public List<CommentVo> dcosearch(String option, String keyword);

	public List<CommentVo> ccosearch(String nick, String contents);


}

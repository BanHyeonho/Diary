package www.dao;

import java.util.List;

import www.dto.CommentVo;
import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.MemberVo;
import www.dto.ReportVo;

public interface AdminDao {

	public List<MemberVo> allmember(); // 모든회원보기 30명

	public List<MemberVo> blacklist(); // 신고횟수기준 블랙리스트 30명

//	public void deletemember(int idx); // 블랙멤버삭제
	
	public List<DiaryVo> alldiary(); //모든 여행일지 30개 보기

	public List<DiaryVo> reportdlist(); // 신고된여행일지글보기
	
//	public void reportOk(MemberVo vo); // 신고확정으로 인한 글쓴이의 경고 누적
//
//	public void reportcancel(int idx); // 신고된여행일지글 신고취소
//
	public void deletediary(int idx); // 신고된 여행일지글삭제

	public List<MemberVo> searchById(String id); // 회원검색(아이디)

	public List<MemberVo> searchByNick(String nick); // 회원검색(닉네임)
//	
	public List<CommunityVo> reportclist(); // 신고된커뮤니티글보기

//	public void reportCcancel(int idx); // 신고된커뮤니티글 신고취소
//
	public void deletecommunity(int idx); //  커뮤니티글삭제
	
//	public ReportVo reportReason(int idx); //여행일지글 신고사유 보기
//	
//	public ReportVo reportCReason(int idx); //커뮤니티글 신고사유 보기

	
	public List<CommunityVo> searchByCNick(String nick);	//닉네임 필터 키워드로 커뮤니티 검색
	
	public List<CommunityVo> searchByCTitle(String ctitle); 	//글제목 필터 키워드로 커뮤니티 검색

	public List<CommunityVo> allcommunity(); //커뮤니티 리스트 30개보기

	public List<DiaryVo> searchByDNick(String nick); //일지검색(닉네임)

	public List<DiaryVo> searchByDTitle(String dtitle);//일지검색(글제목)

	public MemberVo oneMember(String id); //정보보기 버튼누를때

	public void updatedmember(MemberVo vo); //정보보기버튼에서 확인버튼누를때

	public void deleteAccount(String id); //정보보기버튼에서 계정삭제버튼 누를때 
	
	public List<CommentVo> reportDcomment(); //여행일지 신고된댓글 리스트 30개보기

	public List<CommentVo> reportCcomment(); //만남의장 신고된 댓글 리스트 30개보기

	public void deleteDcomment(int idx); //신고된 댓글 삭제하기 

	public DiaryVo viewDiary(int idx); //일지게시판-글보기 버튼

	public CommunityVo viewCommunity(int idx); //커뮤니티-글보기 버튼

	public List<ReportVo> dreportReason(int linkedidx); //일지게시판-신고사유버튼
	
}

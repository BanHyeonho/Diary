package www.dao;

import java.util.List;

import www.dto.CommentVo;
import www.dto.DiaryVo;
import www.dto.FollowVo;
import www.dto.GoodVo;
import www.dto.HitCountVo;
import www.dto.ReportVo;
import www.dto.ScrapVo;

public interface DiaryDao {

	public DiaryVo onediary(int idx);	//글하나 보기(스크랩배끼기 리스트에서 하나 클릭시)
	public void diarywrite(DiaryVo vo);	//글추가
//	public void updatediary(DiaryVo vo);	//글 수정	my페이지에 있는글도 수정
	public void deletediary(int idx);	//글 삭제 	my페이지에 있는글도 삭제
	public void writedcomment(CommentVo vo);//여행일지에 댓글쓰기
//	public void deletedcomment(int idx);	//여행일지 댓글삭제
//	public void updatedcomment(CommentVo vo);//여행일지 댓글수정
	public void insertscrap(ScrapVo vo);	//스크랩하기	자신의id,글의 idx
	public void hitcount(DiaryVo vo);	//조회수 상승
	public HitCountVo hitCountChk(HitCountVo vo);	//조회했는지 아닌지 확인
	public GoodVo goodchk(HitCountVo vo);	//추천누른 아이디랑 글의 인덱스가 들어있는 Vo
	public void good(GoodVo vo);		//추천!
	public List<DiaryVo> searchByWriter(String nick);		//글쓴이(닉네임) 으로 검색
	public List<DiaryVo> searchByTitle(String title);		//제목 으로 검색
	public List<DiaryVo> searchByPlace(String place);		//여행지로 검색
	public List<CommentVo> comment(int idx);   // 댓글 리스트 가져오기  인덱스는 해당글의 idx
	public void hitcounted(HitCountVo vo);			//조회하여 hit테이블에 값이 들어감
	public ScrapVo scrapChk(HitCountVo vo);					//스크랩 했는지 체크
	public FollowVo followChk(HitCountVo vo);				//팔로우 했는지 체크
	public void gooded(GoodVo vo);						//추천을누르면 추천테이블에 내아이디와 글의 인덱스가 저장됨
	public void report(ReportVo vo);				//신고하기
}

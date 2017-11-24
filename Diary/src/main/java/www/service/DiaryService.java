package www.service;

import java.util.List;
import java.util.Map;

import www.dto.CommentVo;
import www.dto.DiaryVo;
import www.dto.GoodVo;
import www.dto.HitCountVo;
import www.dto.ReportVo;
import www.dto.ScrapVo;

public interface DiaryService {

	public Map<String,Object> onediary(HitCountVo vo);	//글하나 보기(스크랩배끼기 리스트에서 하나 클릭시)
	public void diarywrite(DiaryVo vo);	//글추가
	public void updatediary(DiaryVo vo);	//글 수정	my페이지에 있는글도 수정
	public void deletediary(int idx);	//글 삭제 	my페이지에 있는글도 삭제
	public Integer writedcomment(CommentVo vo);//여행일지에 댓글쓰기
	public void deletedcomment(int idx);	//여행일지 댓글삭제
	public void insertscrap(ScrapVo vo);	//스크랩하기	자신의id,글의 idx
	public void good(GoodVo vo);		//추천!
	public void report(ReportVo vo);	//신고하기
	public List<DiaryVo> search(String option,String keyword);
	public void dcoreport(ReportVo vo);	//일지댓글 신고하기
}

package www.dao;

import java.util.List;

import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.MemberVo;
import www.dto.TopVo;

public interface MainDao {
	
	public List<TopVo> Top();		//top10리스트출력
	public String picture(String id);		//top10리스트출력프로필사진
	public void memberjoin(MemberVo vo);	//회원가입
	public String idchk(String id);      //아이디중복확인
	public String nickchk(String nick);      //닉네임중복확인
	public MemberVo login(MemberVo vo);	//로그인
	public List<CommunityVo> community();	//커뮤니티이동
	public List<TopVo> diary(int page);		//여행일지로이동
	public String pwchk(MemberVo vo);	//비밀번호 리턴
	public Integer diarySize();
	
	
	
	
	
}

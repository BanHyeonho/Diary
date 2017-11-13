package www.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import www.dto.CommunityVo;
import www.dto.MemberVo;
import www.dto.TopVo;

public interface MainService {

	public List<TopVo> Top(); //top10리스트출력
	public void memberjoin(MemberVo vo); //회원가입
	public String idchk(String id); // 아이디중복확인

	public String nickchk(String nick); // 닉네임중복확인

	public ModelAndView login(MemberVo vo, HttpSession session); // 로그인
	public List<CommunityVo> community(); //커뮤니티이동 30개
	// public List<DiaryVo> diary(); //여행일지로이동 30개

	public String pwchk(MemberVo vo); // 비밀번호 리턴

}

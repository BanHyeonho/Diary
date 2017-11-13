package www.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import www.dao.MainDao;
import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.MemberVo;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainDao dao;

//	@Autowired
//	MyPageDao dao2;
	

	@Override
	public ModelAndView login(MemberVo vo,HttpSession session) {
		// TODO Auto-generated method stub
		ModelAndView mav = new ModelAndView();
		
		MemberVo user = dao.login(vo);
		
		if (user == null) { // 아이디가 없음

			mav.addObject("result", "아이디가 없습니다.");

		} else if (!user.getPassword().equals(vo.getPassword())) { // 비밀번호 다름

			mav.addObject("result", "비밀번호가 다릅니다.");
		} else {
			session.setAttribute("user", user);
		}
		
		mav.setViewName("redirect:/main.do");
		return mav;
	}

	@Override
	   public String idchk(String id) {
	      // TODO Auto-generated method stub
	      return dao.idchk(id);
	   }
	   
	   @Override
	   public String nickchk(String nick) {
	      // TODO Auto-generated method stub
	      return dao.nickchk(nick);
	   }
	   
	@Override
	public String pwchk(MemberVo vo) {
		// TODO Auto-generated method stub
		
		String pw =dao.pwchk(vo);
		if(pw==null){
			pw="입력 값이 잘못 됐습니다.";
			return pw;
		}
		pw="비밀번호는 '"+pw+"' 입니다.";
		return pw;
	}

	@Override
	   public void memberjoin(MemberVo vo) {
		
		if(vo.getPhone()==null){
			vo.setPhone("default");
		}
		if(vo.getAddr()==null){
			vo.setAddr("default");
		}
		if(vo.getPicture()==null){
			vo.setPicture("default");
		}
		
	       dao.memberjoin(vo);
	      
	   }

	@Override
	public List<CommunityVo> community() {
		// TODO Auto-generated method stub
		
		
		
		return dao.community();
	}

	@Override
	public List<DiaryVo> Top() {
		// TODO Auto-generated method stub
		return dao.Top();
	}

	@Override
	public MemberVo mypage(MemberVo vo) {
		
		
		
		return dao.login(vo);
	}

	
}

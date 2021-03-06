package www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dao.CommunityDao;
import www.dto.CommentVo;
import www.dto.CommunityVo;
import www.dto.HitCountVo;
import www.dto.ReportVo;

@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	CommunityDao dao;
	
	
	@Override
	public void communityinsert(CommunityVo vo) {
		// TODO Auto-generated method stub
		dao.communityinsert(vo);
	}


	@Override
	public CommunityVo oneCommunity(HitCountVo vo) {
		// TODO Auto-generated method stub
		//chitcount 테이블에서 아이디랑 글idx로 값이 있는지 확인 값이 있으면 이미 조회한 적 있음 없으면 조회한적 없음
		//조회한적 없으면 chitcount 테이블에 아이디랑 글의 인덱스를 같이 insert
		//글의 인덱스로 글정보를 갖고와서 조회수를 1 update 시킨다
		//결과를 리턴한다.
		CommunityVo community=dao.oneCommunity(vo.getLinkedidx());
		
		if (vo.getId()!=null&&!vo.getId().equals("") && dao.hitCountChk(vo) == null) {
			
			community.setChitcount(community.getChitcount() + 1);
		
			dao.chitcount(community);
			dao.hitcounted(vo);
		
		}
		
		
		return community;
	}
	
	
	
	@Override
	public void ccommentinsert(CommentVo vo) {
		// TODO Auto-generated method stub
		dao.ccommentinsert(vo);
	}


	@Override
	public List<CommentVo> ccomment(int idx) {
		// TODO Auto-generated method stub
		return dao.ccomment(idx);
	}


	@Override
	public void deleteccomment(int idx) {
		// TODO Auto-generated method stub
		dao.deleteccomment(idx);
	}


	@Override
	public void deletecommunity(int idx) {
		// TODO Auto-generated method stub
		dao.deletecommunity(idx);
	}


	@Override
	public void updatecommu(CommunityVo vo) {
		// TODO Auto-generated method stub
		dao.updatecommu(vo);
	}


	@Override
	public List<CommunityVo> csearch(CommunityVo vo) {
		System.out.println(vo.toString());
		return dao.csearch(vo);
	}


	@Override
	public void creportinsert(ReportVo vo) {
		// TODO Auto-generated method stub
		
		 dao.creportinsert(vo);
		 dao.creportup(vo);
	}


	@Override
	public void ccoreportinsert(ReportVo vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.toString());
		dao.ccoreportinsert(vo);
		dao.ccoreportup(vo);
	}



}

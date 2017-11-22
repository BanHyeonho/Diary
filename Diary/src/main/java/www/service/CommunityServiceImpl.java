package www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dao.CommunityDao;
import www.dto.CommentVo;
import www.dto.CommunityVo;

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
	public CommunityVo oneCommunity(int idx) {
		// TODO Auto-generated method stub
		//chitcount 테이블에서 아이디랑 글idx로 값이 있는지 확인 값이 있으면 이미 조회한 적 있음 없으면 조회한적 없음
		//조회한적 없으면 chitcount 테이블에 아이디랑 글의 인덱스를 같이 insert
		//글의 인덱스로 글정보를 갖고와서 조회수를 1 update 시킨다
		//결과를 리턴한다.
		
		
		
		return dao.oneCommunity(idx);
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
		// TODO Auto-generated method stub
		return dao.csearch(vo);
	}


	@Override
	public void chitcount(CommunityVo vo) {
		// TODO Auto-generated method stub
		
		dao.chitcount(vo);
	}
	
}

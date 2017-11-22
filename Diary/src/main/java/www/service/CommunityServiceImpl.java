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
	
}

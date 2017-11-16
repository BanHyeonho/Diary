package www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dao.CommunityDao;
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

	
	
	
}

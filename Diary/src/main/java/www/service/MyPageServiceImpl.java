package www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dao.MyPageDao;
import www.dto.BlockVo;
import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.FollowVo;
import www.dto.MemberVo;
import www.dto.MsgVo;
import www.dto.ScrapVo;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	MyPageDao dao;

	@Override
	public void updateinfo(MemberVo vo) {
		// TODO Auto-generated method stub//	
		dao.updateinfo(vo);
	}

	@Override
	public void deleteinfo(String id) {
		// TODO Auto-generated method stub
		dao.deleteinfo(id);
	}

	@Override
	public List<DiaryVo> mydiary(String id) {
	
		
		return dao.mydiary(id);
	}
	@Override
	public List<CommunityVo> community(String id) {
		// TODO Auto-generated method stub
		
		
		return dao.mycommu(id);
	}

	@Override
	public void addfollow(FollowVo vo) {
		// TODO Auto-generated method stub
		dao.addfollow(vo);
	}

	@Override
	public void deletefollow(int idx) {
		dao.deletefollow(idx);
		// TODO Auto-generated method stub
		
	}
//
//	@Override
//	public List<CommunityVo> mycommunity(String id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
	@Override
	public List<FollowVo> following(String id) {
		// TODO Auto-generated method stub
		
		return dao.following(id);
	}

	@Override
	public List<FollowVo> followers(String id) {
		// TODO Auto-generated method stub
		
		return dao.followers(id);
	}



	@Override
	public void deletemyscrap(ScrapVo vo) {
		// TODO Auto-generated method stub
		dao.deletemyscrap(vo);
	}

	@Override
	public List<MsgVo> msg(String id) {
		// TODO Auto-generated method stub
		
		return dao.msg(id);
	}
//
	@Override
	public void deletemsg(int idx) {
		// TODO Auto-generated method stub
		
		 dao.deletemsg(idx);
	}

	@Override
	public void sendmsg(MsgVo vo) {
		// TODO Auto-generated method stub
		dao.sendmsg(vo);
	}
//
//	@Override
//	public List<MsgVo> msgChk() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
	@Override
	public void blockMember(BlockVo vo) {
		// TODO Auto-generated method stub
		dao.blockMember(vo);
	}

	@Override
	public List<BlockVo> myblock(String id) {
		// TODO Auto-generated method stub
		
		return dao.myblock(id);
	}

	@Override
	public void unBlock(int idx) {
		// TODO Auto-generated method stub
		dao.unBlock(idx);
	}

	@Override
	public List<ScrapVo> myScrap(String id) {
		// TODO Auto-generated method stub
		return dao.myScrap(id);
	}



	
	

}

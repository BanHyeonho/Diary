package www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dao.MyPageDao;
import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.MemberVo;
import www.dto.MsgVo;

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
//
//	@Override
//	public void addfollow(FollowVo vo) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void deletefollow(int idx) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public List<CommunityVo> mycommunity(String id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<FollowVo> following(String id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<FollowVo> followers(String id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<DiaryVo> myScrap(String id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void deletemyscrap(int idx) {
//		// TODO Auto-generated method stub
//		
//	}
//
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
//	@Override
//	public void blockMember(BlockVo vo) {
//		// TODO Auto-generated method stub
//		
//	}

	

}

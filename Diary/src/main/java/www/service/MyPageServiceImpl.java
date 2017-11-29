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
public class MyPageServiceImpl implements MyPageService {

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
	public void deletefollow(FollowVo vo) {
		
		if(vo.getFollowers()!=null){
			vo.setIdx(dao.getfollowidx(vo));
		}
		
		dao.deletefollow(vo.getIdx());
		// TODO Auto-generated method stub
	}

	
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
		List<BlockVo> list =dao.myblock(vo.getReceiverid());
		
		for (BlockVo blockVo : list) {
			System.out.println("내가 차단한 사람 이름 : " + blockVo.getBlockNick() );
			System.out.println(vo.getSender());
			if(blockVo.getBlockNick().equals(vo.getSender())){
				vo.setChk("0");
			}
			
		}
		
		
		dao.sendmsg(vo);
	}


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
	public List<DiaryVo> myScrap(String id) {
		// TODO Auto-generated method stub
		return dao.myScrap(id);
	}

	@Override
	public List<MsgVo> msgchk(String id) {
		
		// TODO Auto-generated method stub
		return dao.msgchk(id);
	}

	@Override
	public void msgchkupdate(String id) {
		// TODO Auto-generated method stub
		dao.msgchkupdate(id);
	}

}

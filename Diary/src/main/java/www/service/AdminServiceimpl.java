package www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dao.AdminDao;
import www.dto.CommentVo;
import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.MemberVo;

@Service
public class AdminServiceimpl implements AdminService{

	@Autowired
	AdminDao dao;

	@Override
	public List<MemberVo> allmember() {
		// TODO Auto-generated method stub
		return dao.allmember();
	}

	@Override
	public List<MemberVo> blacklist() {
		// TODO Auto-generated method stub
		
			return dao.blacklist();
		
	}

//	@Override
//	public void deletemember(int idx) {
//		// TODO Auto-generated method stub
//		
//	}
//


//	@Override
//	public void reportOk(MemberVo vo, int idx) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void reportcancel(int idx) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void deletedreport(int idx) {
//		// TODO Auto-generated method stub
//			dao.reportdlist(idx);
//	}

	@Override
	public List<MemberVo> searchMember(String option,String keyword) {
		// TODO Auto-generated method stub
		if(option.equals("아이디")){
			return dao.searchById(keyword);
		}			
		return dao.searchByNick(keyword);
	}

	@Override
	public List<DiaryVo> alldiary() {
		// TODO Auto-generated method stub
		return dao.alldiary();
	}

	@Override
	public List<CommunityVo> allcommunity() {
		// TODO Auto-generated method stub
		return dao.allcommunity();
	}

	@Override
	public List<DiaryVo> diarySearch(String option, String keyword) {
		// TODO Auto-generated method stub
		if(option.equals("닉네임")){
			return dao.searchByDNick(keyword);
		}
		return dao.searchByDTitle(keyword);
	}

	@Override
	public List<DiaryVo> reportdlist() {
		// TODO Auto-generated method stub
		return dao.reportdlist();
	}

//	@Override
//	public List<CommentVo> reportcomment(int report) {
//		// TODO Auto-generated method stub
//		return dao.reportcomment();
//	}

//	@Override
//	public List<CommunityVo> reportClist(int report) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void reportCOk(MemberVo vo, int idx) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void reportCcancel(int idx) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void deleteCreport(int idx) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public ReportVo reportReason(int idx) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public ReportVo reportCReason(int idx) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<DiaryVo> serchDiary(String keyword, int choose) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<DiaryVo> serchCommunity(String keyword, int choose) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	

}

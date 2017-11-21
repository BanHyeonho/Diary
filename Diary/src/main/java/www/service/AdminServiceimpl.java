package www.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dao.AdminDao;
import www.dto.CommentVo;
import www.dto.CommunityVo;
import www.dto.DiaryVo;
import www.dto.MemberVo;
import www.dto.ReportVo;

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

	@Override
	public void deletediary(int idx) {
		// TODO Auto-generated method stub
			dao.deletediary(idx);
	}

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

	@Override
	public List<CommentVo> reportDcomment() {
		// TODO Auto-generated method stub
		return dao.reportDcomment();
	}
	
	@Override
	public List<CommentVo> reportCcomment() {
		// TODO Auto-generated method stub
		return dao.reportCcomment();
	}

	@Override
	public List<CommunityVo> reportclist() {
		// TODO Auto-generated method stub
		return dao.reportclist();
	}


	@Override
	public void deletecommunity(int idx) {
		// TODO Auto-generated method stub
		dao.deletecommunity(idx);
	}

	@Override
	public List<CommunityVo> communitySearch(String option, String keyword) {
		// TODO Auto-generated method stub
		if(option.equals("닉네임")){
			return dao.searchByCNick(keyword);
		}
		return dao.searchByCTitle(keyword);
	}

	@Override
	public MemberVo oneMember(String id) {
		// TODO Auto-generated method stub
		return dao.oneMember(id);
	}

	@Override
	public void updatedmember(MemberVo vo) {
		// TODO Auto-generated method stub
		dao.updatedmember(vo);
	}

	@Override
	public void deleteAccount(String id) {
		// TODO Auto-generated method stub
		dao.deleteAccount(id);
	}

	@Override
	public void deleteDcomment(int idx) {
		// TODO Auto-generated method stub
		dao.deleteDcomment(idx);
	}

	@Override
	public DiaryVo viewDiary(int idx) {
		// TODO Auto-generated method stub
		return dao.viewDiary(idx);
	}

	@Override
	public CommunityVo viewCommunity(int idx) {
		// TODO Auto-generated method stub
		return dao.viewCommunity(idx);
	}

	@Override
	public List<ReportVo> dreportReason(int linkedidx) {
		// TODO Auto-generated method stub
		return dao.dreportReason(linkedidx);
	}

	@Override
	public List<ReportVo> creportReason(int linkedidx) {
		// TODO Auto-generated method stub
		return dao.creportReason(linkedidx);
	}

	@Override
	public void Dacquit(int idx) {
		// TODO Auto-generated method stub
		dao.Dacquit(idx);
	}

	@Override
	public void Cacquit(int idx) {
		// TODO Auto-generated method stub
		dao.Cacquit(idx);
	}
	
	@Override
	public void dGuilt(int idx) {
	//유죄-1.작성자를 찾아 2.경고 누적 3.인덱스로 해당글 삭제
		MemberVo vo = dao.findDguilt(idx);
		vo.setReportcount(vo.getReportcount()+1);
		dao.warning(vo);
		dao.deletediary(idx);
		
	}

	@Override
	public void cGuilt(int idx) {
		// TODO Auto-generated method stub
		MemberVo vo = dao.findCguilt(idx);
		vo.setReportcount(vo.getReportcount()+1);
		dao.warning(vo);
		dao.deletecommunity(idx);
	}

	@Override
	public void deleteCcomment(int idx) {
		// TODO Auto-generated method stub
		dao.deleteCcomment(idx);
	}
	
	@Override
	public List<ReportVo> dcoreportReason(int idx) {
		// TODO Auto-generated method stub
		return dao.dcoreportReason(idx);
	}

	@Override
	public List<ReportVo> ccoreportReason(int idx) {
		// TODO Auto-generated method stub
		return dao.ccoreportReason(idx);
	}

	@Override
	public void doGuilt(int idx) {
		// TODO Auto-generated method stub
		MemberVo vo = dao.findDoguilt(idx);
		vo.setReportcount(vo.getReportcount()+1);
		dao.nwarning(vo);
		dao.deleteDcomment(idx);
	}

	@Override
	public void coGuilt(int idx) {
		// TODO Auto-generated method stub
		MemberVo vo = dao.findCoguilt(idx);
		vo.setReportcount(vo.getReportcount()+1);
		dao.nwarning(vo);
		dao.deleteCcomment(idx);
	}
	

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

//	}
	
	

}

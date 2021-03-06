package www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dao.DiaryDao;
import www.dao.MainDao;
import www.dto.CommentVo;
import www.dto.DiaryVo;
import www.dto.GoodVo;
import www.dto.HitCountVo;
import www.dto.ReportVo;
import www.dto.ScrapVo;
import www.dto.TopVo;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	DiaryDao dao;
	
	@Autowired
	MainDao md;
	
	@Override
	public void diarywrite(DiaryVo vo) {
		// TODO Auto-generated method stub
		System.out.println(vo.toString());
		dao.diarywrite(vo);
	}

	@Override
	public Map<String, Object> onediary(HitCountVo vo) {
		
		DiaryVo diary = dao.onediary(vo.getLinkedidx());
		
		if (vo.getId()!=null&&!vo.getId().equals("") && dao.hitCountChk(vo) == null) {
			diary.setDhitcount(diary.getDhitcount() + 1);
			dao.hitcount(diary);
			dao.hitcounted(vo);
		}

		Map<String, Object> map = new HashMap<String, Object>();
	
		if(vo.getId()!=null&&dao.scrapChk(vo)!=null){
		map.put("Scrap", "Scrap");
		}
		
		if(vo.getId()!=null&&dao.followChk(vo)!=null){
			map.put("Follow", "Follow");
		}
		if(vo.getId()!=null&&dao.goodchk(vo)!=null){
			map.put("Good", "Good");
		}
		map.put("Diary", diary);
		map.put("comment", dao.comment(vo.getLinkedidx()));
		return map;
	}

	@Override
	public Integer writedcomment(CommentVo vo) {

		
		dao.writedcomment(vo);
		
		return vo.getIdx();
	}

	@Override
	public void insertscrap(ScrapVo vo) {
		dao.insertscrap(vo);
		
	}

	@Override
	public void good(GoodVo vo) {
		// TODO Auto-generated method stub
		
		vo.setGood(dao.onediary(vo.getLinkedidx()).getGood()+1);
		dao.good(vo);
		dao.gooded(vo);
	}

	@Override
	public void report(ReportVo vo) {
		// TODO Auto-generated method stub
		dao.report(vo);
		dao.reportUp(vo);
	}

	@Override
	public List<TopVo> search(String option, String keyword) {
		// TODO Auto-generated method stub
		
		if(option.equals("글제목")){
			
			List<TopVo> top = dao.searchByTitle(keyword);
			List<TopVo> list = new ArrayList<TopVo>();
			for (TopVo topVo : top) {
				System.out.println(topVo.toString());
				topVo.setPicture(md.picture(topVo.getId()));
				list.add(topVo);
			}
			return list;
		
		}else if(option.equals("여행지")){
			List<TopVo> top = dao.searchByPlace(keyword);
			List<TopVo> list = new ArrayList<TopVo>();
			for (TopVo topVo : top) {
				System.out.println(topVo.toString());
				topVo.setPicture(md.picture(topVo.getId()));
				list.add(topVo);
			}
			return list;
		
		}
		
		List<TopVo> top = dao.searchByWriter(keyword);
		List<TopVo> list = new ArrayList<TopVo>();
		for (TopVo topVo : top) {
			System.out.println(topVo.toString());
			topVo.setPicture(md.picture(topVo.getId()));
			list.add(topVo);
		}
		return list;
		
		
	}

	@Override
	public void deletediary(int idx) {
		dao.deletediary(idx);
		
	}

	@Override
	public void updatediary(DiaryVo vo) {
		// TODO Auto-generated method stub
		dao.updatediary(vo);
	}

	@Override
	public void deletedcomment(int idx) {
		// TODO Auto-generated method stub
		dao.deletedcomment(idx);
	}

	@Override
	public void dcoreport(ReportVo vo) {
		// TODO Auto-generated method stub
		dao.dcoreport(vo);
		dao.dcoreportUp(vo);
	}


}

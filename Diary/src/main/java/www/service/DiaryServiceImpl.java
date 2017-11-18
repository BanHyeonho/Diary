package www.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dao.DiaryDao;
import www.dao.MyPageDao;
import www.dto.CommentVo;
import www.dto.DiaryVo;
import www.dto.HitCountVo;
import www.dto.ScrapVo;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	DiaryDao dao;

	
	@Override
	public void diarywrite(DiaryVo vo) {
		// TODO Auto-generated method stub
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
		map.put("Diary", diary);
		map.put("Comment", dao.comment(vo.getLinkedidx()));
		return map;
	}

	@Override
	public void writedcomment(CommentVo vo) {

		dao.writedcomment(vo);
		
	}

	@Override
	public void insertscrap(ScrapVo vo) {
		dao.insertscrap(vo);
		
	}

}

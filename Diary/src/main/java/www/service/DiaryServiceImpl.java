package www.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.dao.DiaryDao;
import www.dto.DiaryVo;

@Service
public class DiaryServiceImpl implements DiaryService{

	
	@Autowired
	DiaryDao dao;

	@Override
	public void diarywrite(DiaryVo vo) {
		// TODO Auto-generated method stub
		dao.diarywrite(vo);
	}


	
	
}

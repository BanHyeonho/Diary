package www.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import www.service.GPSService;

//@Controller
public class GPSController {

	@Autowired
	GPSService sv;
	
	private static final Logger logger = LoggerFactory.getLogger(GPSController.class);

//	public @ResponseBody Map<String, String> sendGPS(GPSVo vo) {
//		return null;
//	} // 위치정보 보내기
//
//	public @ResponseBody Map<String, GPSVo> getGPS(GPSVo vo) {
//		return null;
//	} // 위치정보 뿌리기
}

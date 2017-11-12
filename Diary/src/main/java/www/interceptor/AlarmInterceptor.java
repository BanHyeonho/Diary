package www.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import www.service.MyPageService;

public class AlarmInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	MyPageService sv;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
			
	//	sv.msgChk();	//where chk = 1  를 조회하여 null이 아니면 안본 쪽지가 있는것임.
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
	
}

package com.kh.respect.common.aop;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.HashMap;
import java.util.Map;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.respect.user.model.service.UserService;
import com.kh.respect.user.model.vo.User;

@SessionAttributes(value= {"userLoggedIn"})
@Component
@Aspect
public class UserRenew {
	
	@Autowired
	UserService service;
	
/*	@Before("execution(* com.kh.respect..*Controller.*(..))")
	public void before(JoinPoint joinPoint) {
			System.out.println("들어왔니???????????????");
	}*/
	
//	@AfterReturning(pointcut="execution(* com.kh.respect..*Controller.*(..))", returning="returnObj")
//	public void userRenew(Object returnObj, JoinPoint joinPoint) {
//		
//			
//		if(returnObj instanceof ModelAndView) {
//			ModelAndView mv = (ModelAndView)returnObj;
//			Map<String, Object> map = new HashMap();
//			map=mv.getModel();
//			System.out.println("리턴값?? "+returnObj);
//				
//			if(map.containsKey("userLoggedIn")) {
//				User u = (User) map.get("userLoggedIn");
//				System.out.println("바뀌기전 : " +  u );
//				User user = service.idSelectOne(u.getUserId());
//				System.out.println("바뀌기후 : " +  user );
//				System.out.println("-------------------------------------------------------------------");
//				mv.addObject("userLoggedIn",user);
//			}
//			
//		}
//	}
}

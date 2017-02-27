package a.b.c.aop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import a.b.c.controller.InBoardMember;
import a.b.c.service.MemberServiceInterface;

@Component
@Aspect
public class MyAdvice {

	@Autowired
	MemberServiceInterface memberService;
	InBoardMember inBoardMember;

	/*
	 * @Pointcut("execution(* createBoard(..)) or execution(* createList(..)) or execution(* createCard(..))"
	 * +
	 * " or execution(* deleteBoard(..)) or execution(* deleteList(..)) or execution(* deleteCard(..))"
	 * + " or execution(* moveList(..)) or execution(* moveCard(..))") public
	 * void advice(){};
	 */
	@Pointcut("execution(* a.b.c.controller.MainController.*(..))")
	public void advice() {
	}

	@Pointcut("execution(* a.b.c.controller.MainController.*(..))")
	public void advice2() {
	}
	/*
	 * @Around("advice()") public Object checkSession(ProceedingJoinPoint
	 * joinPoint) throws Throwable {
	 * 
	 * System.out.println("Around...");
	 * 
	 * // HttpServletRequest req = null; // Object[] ob = joinPoint.getArgs();
	 * // if (ob[0] instanceof HttpServletRequest) { // req =
	 * (HttpServletRequest) ob[0]; // }
	 * 
	 * ServletRequestAttributes sra = (ServletRequestAttributes)
	 * RequestContextHolder.currentRequestAttributes(); HttpServletRequest
	 * request = sra.getRequest();
	 * 
	 * HttpSession session = request.getSession(); String uri =
	 * request.getRequestURI(); System.out.println("SESSION ID IS " +
	 * session.getId()); return "error/error"; // return joinPoint.proceed(); }
	 */

	@Before("advice2()")
	public void before(JoinPoint joinPoint) {
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		HttpSession session = request.getSession(false);
		HttpServletResponse response = sra.getResponse();
		PrintWriter out = null;
		try {

			Map inUserIpMap = inBoardMember.getUserIpMap();

			String methodName = joinPoint.getSignature().getName();

			System.out.println("methodName : " + methodName);
			if (null == session || null == session.getAttribute("id")) {
				if ("list".equals(methodName) || "board".equals(methodName)) {
					out = response.getWriter();
					out.print("<script>");
					out.print("alert('로그아웃되었습니다.');");
					out.print("location.href='/';");
					out.print("</script>");
					out.flush();
					out.close();
				} else {
					out = response.getWriter();
					out.print("1");
					out.flush();
					out.close();
				}
			} else {
				if (!request.getRemoteHost().equals(inUserIpMap.get(session.getAttribute("id")))) {
					if ("list".equals(methodName) || "board".equals(methodName)) {
						out = response.getWriter();
						out.print("<script>");
						out.print("alert('로그아웃되었습니다.');");
						out.print("location.href='/';");
						out.print("</script>");
						out.flush();
						out.close();
						session.invalidate();
					} else {
						out = response.getWriter();
						out.print("1");
						out.flush();
						out.close();
						session.invalidate();
					}
				} else {
				}

			}
		} catch (Exception ex) {
			ex.printStackTrace();
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.print("1");
			out.flush();
			out.close();
			session.invalidate();
		}
	}

	@After("advice()")
	public void after(JoinPoint joinPoint) {
		// System.out.println("After...");
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		String userId = (String) request.getSession().getAttribute("id");
		// String userId = request.getParameter("id");
		String b_num = request.getParameter("b_num");
		String title = request.getParameter("title");
		String methodName = joinPoint.getSignature().getName();
		String msg = null;
		System.out.println(b_num);
		Map map = new HashMap();
		msg = userId + " ";
		/*
		 * if (methodName.equals("createBoard")){ msg +=
		 * "님이 "+title+"보드를 생성하였습니다."; map.put("b_num", b_num); map.put("id",
		 * userId); map.put("msg", msg); memberService.insertHistory(map); }
		 * else
		 */if (methodName.equals("createList")) {
			msg += "님이 " + title + "리스트를 생성하였습니다.";
			map.put("b_num", b_num);
			map.put("id", userId);
			map.put("msg", msg);
			memberService.insertHistory(map);
		} else if (methodName.equals("createCard")) {
			msg += "님이 " + title + "카드를 생성하였습니다.";
			map.put("b_num", b_num);
			map.put("id", userId);
			map.put("msg", msg);
			memberService.insertHistory(map);
		} else if (methodName.equals("deleteBoard")) {
			msg += "님이 보드를 삭제하였습니다.";
			map.put("b_num", b_num);
			map.put("id", userId);
			map.put("msg", msg);
			memberService.insertHistory(map);
		} else if (methodName.equals("deleteList")) {
			msg += "님이 리스트를 삭제하였습니다.";
			map.put("b_num", b_num);
			map.put("id", userId);
			map.put("msg", msg);
			memberService.insertHistory(map);
		} else if (methodName.equals("deleteCard")) {
			msg += "님이 카드를 삭제하였습니다.";
			map.put("b_num", b_num);
			map.put("id", userId);
			map.put("msg", msg);
			memberService.insertHistory(map);
		} else if (methodName.equals("moveList")) {
			msg += "님이 리스트를 이동하였습니다.";
			map.put("b_num", b_num);
			map.put("id", userId);
			map.put("msg", msg);
			memberService.insertHistory(map);
		} else if (methodName.equals("moveCard")) {
			msg += "님이 카드를 이동하였습니다.";
			map.put("b_num", b_num);
			map.put("id", userId);
			map.put("msg", msg);
			memberService.insertHistory(map);
		}

	}
}

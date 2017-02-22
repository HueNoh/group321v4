package a.b.c.controller;

import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import a.b.c.service.MemberServiceInterface;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	MemberServiceInterface memberService;
	InBoardMember inBoardMember;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session, HttpServletRequest request) {
		return "home";
	}

	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public String login(Model model, @RequestParam Map map, HttpSession session, HttpServletRequest request) {
		// String page = null;

		String loginChk = null;

		System.out.println(request.getParameter("errChk"));
		String errChk = request.getParameter("errChk");
		Set inBoardMemberSet = inBoardMember.getInstanceSet();
		Map inUserIpMap = inBoardMember.getUserIpMap();

		if (null != session.getAttribute("id")) {

			loginChk = "redirect:/main/board";

		} else {

			boolean userOk = false;

			if (inBoardMemberSet.contains(map.get("id"))) {
				Iterator it = inUserIpMap.keySet().iterator();
				while (it.hasNext()) {
					String id = (String) it.next();
					if (!inUserIpMap.get(id).equals(request.getRemoteHost()) && id.equals(map.get("id"))) {
						userOk = true;
						break;
					} else {
						userOk = false;
					}
				}

				if (userOk) {

					model.addAttribute("err", "001");
					model.addAttribute("id", map.get("id"));
					model.addAttribute("pw", map.get("pw"));
					loginChk = "home";

				} else {
					System.out.println(userOk);

					loginChk = loginOper(session, request, map, model);
				}
			} else {
				loginChk = loginOper(session, request, map, model);
			}

		}
		System.out.println("loginChk" + loginChk);
		return loginChk;
	}

	private String loginOper(HttpSession session, HttpServletRequest request, Map map, Model model) {

		int result = memberService.loginChk(map);
		model.addAttribute("loginChk", result);

		if (result == 0) {

			Set inBoardMemberSet = inBoardMember.getInstanceSet();
			Map inUserIpMap = inBoardMember.getUserIpMap();

			session = request.getSession();
			session.setAttribute("id", map.get("id"));
			session.setAttribute("b_num", 0);
			session.setAttribute("ip", request.getRemoteAddr());

			inBoardMemberSet.add(map.get("id"));
			inUserIpMap.remove(map.get("id"));
			inUserIpMap.put(map.get("id"), request.getRemoteHost());

			System.out.println("inUserIpMap" + inUserIpMap);
			return "redirect:/main/board";
		} else {
			model.addAttribute("err", "002");
			return "home";
		}

	}

	@RequestMapping(value = "/chkIdDup", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public int chkId(Locale locale, Model model, @RequestParam Map map) {
		logger.info("Welcome dupCheck! The client locale is {}.", locale);

		int result = memberService.chkIdDup(map);

		return result;

	}

	@RequestMapping(value = "/insertForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String register(Locale locale, Model model, @RequestParam Map map) {
		logger.info("Welcome insert! The client locale is {}.", locale);

		return "insertForm";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(Locale locale, Model model, @RequestParam Map map) {
		logger.info("Welcome insert! The client locale is {}.", locale);

		int result = 0;
		try {
			result = memberService.insertMember(map);
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("personService.insertPerson(map)" + String.valueOf(result));
		}
		return "success";
	}

	@RequestMapping(value = "/logDup", method = { RequestMethod.POST, RequestMethod.GET })
	public String logDup(Model model, @RequestParam Map map, HttpSession session, HttpServletRequest request) {



		System.out.println("logDup");
		String err = "001";
		Map inUserIpMap = inBoardMember.getUserIpMap();
		String ip = (String) inUserIpMap.get(map.get("id"));
		return loginOper(session, request, map, model) + "?err=" + err + "&dupLogIp=" + ip;

	}

}

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
		String route = null;
		if (null != session) {
			route = "redirect:/main/board";
		} else {
			route = "/";
		}

		return route;
	}

	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public String login(Model model, @RequestParam Map map, HttpSession session, HttpServletRequest request) {
		// String page = null;

		String loginChk = null;

		Set inBoardMemberSet = inBoardMember.getInstanceSet();
		Map inUserIpMap = inBoardMember.getUserIpMap();

		if (null != session.getAttribute("id")) {

			loginChk = "redirect:/main/board";

		} else {
			boolean userOk = false;

			if (inBoardMemberSet.contains(map.get("id"))) {
				Iterator it = inUserIpMap.keySet().iterator();
				while (it.hasNext()) {
					String ip = (String) it.next();
					if (inUserIpMap.get(ip).equals(map.get("id")) && !ip.equals(request.getRemoteHost())) {
						userOk = true;
						break;
					} else {
						userOk = false;
					}
				}

				if (userOk) {
					model.addAttribute("err", "001");
					loginChk = "home";

				} else {
					int result = memberService.loginChk(map);
					model.addAttribute("loginChk", result);

					if (result == 0) {

						session = request.getSession();
						System.out.println(session.getCreationTime());

						session.setAttribute("id", map.get("id"));
						session.setAttribute("b_num", 0);
						session.setAttribute("ip", request.getRemoteAddr());
						
						inBoardMemberSet.add(map.get("id"));
						inUserIpMap.remove(request.getRemoteHost());
						inUserIpMap.put(request.getRemoteHost(), map.get("id"));

						loginChk = "redirect:/main/board";
					} else {
						model.addAttribute("err", "002");
						loginChk = "home";
					}
				}
			} else {
				int result = memberService.loginChk(map);
				model.addAttribute("loginChk", result);

				if (result == 0) {

					session = request.getSession();
					session.setAttribute("id", map.get("id"));
					session.setAttribute("b_num", 0);
					inBoardMemberSet.add(map.get("id"));
					inUserIpMap.remove(request.getRemoteHost());
					inUserIpMap.put(request.getRemoteHost(), map.get("id"));

					loginChk = "redirect:/main/board";
				} else {
					loginChk = "home";
					model.addAttribute("err", "002");
				}
			}

		}
		return loginChk;
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

}

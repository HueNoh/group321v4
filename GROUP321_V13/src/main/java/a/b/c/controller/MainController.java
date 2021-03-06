package a.b.c.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import a.b.c.service.MemberServiceInterface;

@RequestMapping(value = "/main")
@Controller
public class MainController {

	@Autowired
	MemberServiceInterface memberService;
	InBoardMember inBoardMember;

	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String home(Model model, @RequestParam Map map, HttpServletRequest request, HttpSession session) {

		return "board";
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String board(Model model, @RequestParam Map map, HttpServletRequest request, HttpSession session) {
		return "board";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String list(Model model, @RequestParam Map map, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) {
		Map inBoardMemberMap = inBoardMember.getInstanceMap();
		Set inBoardMemberSet = inBoardMember.getInstanceSet();
		String userId = (String) session.getAttribute("id");
		int b_num = Integer.valueOf((String) map.get("b_num"));

		session.setAttribute("b_num", b_num);
		model.addAttribute("b_num", b_num);

		model.addAttribute("title", memberService.selectBoardOne(map).get("title"));

		map.put("id", userId);
		map.put("b_num", b_num);

		List list = memberService.selectBoardMember(map);
		System.out.println("map : " + map);
		System.out.println("list : " + list);
		System.out.println("listsize : " + list.size());

		if (0 != list.size()) {
			System.out.println("11");

			if (null != session.getAttribute("id")) {
				if (inBoardMemberSet.contains(userId)) {
					inBoardMemberMap.remove(userId);
					inBoardMemberSet.add(userId);
					inBoardMemberMap.put(userId, b_num);
				} else {
					inBoardMemberSet.add(userId);
					inBoardMemberMap.put(userId, b_num);
				}
			}

			List list2 = new ArrayList<>();
			Iterator it = inBoardMemberMap.keySet().iterator();
			while (it.hasNext()) {
				String id = (String) it.next();
				// if (b_num == (int) inBoardMemberMap.get(id)) {
				// list2.add(id);
				// }
				if (b_num == (int) inBoardMemberMap.get(id) && !userId.equals(id)) {
					list2.add(id);
				}
			}
			model.addAttribute("users", new Gson().toJson(list2));

			return "list";
		} else {
			try {
				PrintWriter out = response.getWriter();
				out.print("<script>");
				out.print("alert('권한이 없습니다.');");
				out.print("location.href='/main/board';");
				out.print("</script>");
				out.flush();
				out.close();
			} catch (IOException e) {
			}
			return "board";
		}

	}

	@RequestMapping(value = "/deleteCard", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteCard(@RequestParam Map map) {
		System.out.println("select : " + new Gson().toJson(memberService.deleteCard(map)));
		return new Gson().toJson(memberService.deleteCard(map));
	}

	@RequestMapping(value = "/deleteList", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteList(@RequestParam Map map) {
		int result = memberService.deleteList(map);
		List list = memberService.searchList(map);

		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/deleteBoard", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public int deleteBoard(@RequestParam Map map) {
		int result = memberService.deleteBoard(map);
		return result;
	}

	@RequestMapping(value = "/searchBoard", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchBoard(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		map.put("id", session.getAttribute("id"));
		List list = memberService.searchBoard(map);
		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/searchList", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchList(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		List list = memberService.searchList(map);
		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/searchCard", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchCard(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {

		List list = memberService.searchCard(map);

		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/createBoard", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String createBoard(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {

		List list = memberService.insertBoard(map);
		Map lastList = (Map) list.get(list.size() - 1);
		return new Gson().toJson(lastList);
	}

	@RequestMapping(value = "/createList", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String createList(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		List list = memberService.insertList(map);
		Map lastBoard = (Map) list.get(list.size() - 1);
		return new Gson().toJson(lastBoard);
	}

	@RequestMapping(value = "/createCard", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String createCard(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		List list = memberService.insertCard(map);
		Map lastBoard = (Map) list.get(list.size() - 1);
		return new Gson().toJson(lastBoard);
	}

	@RequestMapping(value = "/selectCardDetail", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectCardDetail(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {

		session.setAttribute("l_num", map.get("l_num"));
		session.setAttribute("c_num", map.get("c_num"));

		List list = memberService.selectCardDetail(map);

		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/selectLink", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectLink(@RequestParam Map map) {

		List list = memberService.selectLink(map);

		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/insertLink", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertLink(@RequestParam Map map) {
		int result = memberService.insertLink(map);
		List list = memberService.selectLink(map);

		return new Gson().toJson(list.get(0));
	}

	@RequestMapping(value = "/moveList", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String moveList(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		map.put("listArr", map.get("data"));
		List list = memberService.moveList(map);
		return new Gson().toJson(map);
	}

	@RequestMapping(value = "/moveCard", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String moveCard(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		System.out.println("movemove");
		map.put("cardArr", map.get("msg"));
		List list = memberService.moveCard(map);
		return new Gson().toJson("aa");
	}

	@RequestMapping(value = "/addCardReply", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String addCardReply(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {

		int result = memberService.addCardReply(map);
		
		long time = System.currentTimeMillis(); 
		SimpleDateFormat dayTime = new SimpleDateFormat("MMM d, yyyy hh:mm:ss a", Locale.US);
		String regdate = dayTime.format(new Date(time));
		
		System.out.println(new Date(time).toString());
		JsonObject obj = new JsonObject();

		obj.addProperty("m_id", (String) map.get("m_id"));
		obj.addProperty("content", (String) map.get("content"));
		obj.addProperty("seq", (int) map.get("seq"));
		obj.addProperty("regdate",dayTime.format(new Date(time)));
		
		
		
		return new Gson().toJson(obj);
	}

	@RequestMapping(value = "/updateCardReply", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateCardReply(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {

		List list = memberService.updateCardReply(map);

		List cardReplyInfo = memberService.selectCardReply(map);

		return new Gson().toJson(cardReplyInfo);
	}

	@RequestMapping(value = "/deleteCardReply", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String deleteCardReply(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		List list = null;
		List cardReplyInfo = memberService.selectCardReply(map);
		Map getCardReplyMap = (Map) cardReplyInfo.get(0);
		if (map.get("m_id").equals(getCardReplyMap.get("m_id"))) {
			list = memberService.deleteCardReply(map);
			cardReplyInfo = memberService.selectCardReply(map);
		}

		return new Gson().toJson(cardReplyInfo);
	}

	@RequestMapping(value = "/updateContent", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateContent(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {

		String content = (String) map.get("content");
		content = content.replace("\n", "<br>");
		map.put("content", content);
		List list = memberService.updateContent(map);

		return "";
	}

	@RequestMapping(value = "/selectLabel", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectLabel(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		String str = memberService.selectLabel(map);
		if (str == null) {
			str = "0,0,0,0,0,0,0";
		}

		JsonObject obj = new JsonObject();
		obj.addProperty("label", str);

		return new Gson().toJson(obj);
	}

	@RequestMapping(value = "/selectLabelName", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectLabelName(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		String str = memberService.selectLabelName(map);
		
		System.out.println("labelName: "+str);
		
		if (str == null) {
			str = ",,,,,,";
		}
		
		return str;
	}

	@RequestMapping(value = "/updateLabel", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateLabel(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		List list = memberService.updateLabel(map);
		JsonObject obj = new JsonObject();
		obj.addProperty("label", (String) map.get("label"));
		//
		return new Gson().toJson(obj);
	}

	@RequestMapping(value = "/updateLabelName", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateLabelName(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		List list = memberService.updateLabelName(map);
		JsonObject obj = new JsonObject();

		obj.addProperty("labelName", (String) map.get("labelName"));
		//
		return new Gson().toJson(obj);
	}

	@RequestMapping(value = "/searchFilter", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchFilter(Model model, @RequestParam Map map) {

		List list = memberService.searchFilter(map);
		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/searchLabel", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchLabel(Model model, @RequestParam Map map) {
		List list = memberService.searchLabel(map);
		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/logOut")
	public String logOut(@RequestParam Map map, HttpServletRequest request, HttpSession session, String route) {
		session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}

		return "home";
	}

	@RequestMapping(value = "/selectHistory", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String selectHistory(Model model, @RequestParam Map map) {

		List list = memberService.selectHistory(map);
		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/dupLog", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String dupLog(Model model, @RequestParam Map map, HttpSession session, HttpServletRequest request) {

		return new Gson().toJson("다른 아이피로 접속되었습니다.");
	}

	@RequestMapping(value = "/inUsers", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String inUsers(Model model, @RequestParam Map map) {

		List list = memberService.selectBoardMembers(map);

		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/myBoard", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String myBoard(Model model, @RequestParam Map map) {

		List list = memberService.myBoard(map);
		System.out.println(list);
		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/searchUser", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchUser(Model model, @RequestParam Map map) {

		List list = memberService.searchMembers(map);
		return new Gson().toJson(list);
	}

	@RequestMapping(value = "/inviteUser", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String inviteUser(Model model, @RequestParam Map map) {

		int result = memberService.addMembers(map);
		return new Gson().toJson(result);
	}

	@RequestMapping(value = "/boardOut", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String boardOut(Model model, @RequestParam Map map) {

		int result = memberService.removeMembers(map);
		return new Gson().toJson(result);
	}

	@RequestMapping(value = "/sessionChk", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String sessionChk(Model model, @RequestParam Map map) {

		return "";
	}

	@RequestMapping(value = "/profile", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	public String profile(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		String m_id = request.getParameter("profileId");

		map.put("m_id", m_id);
		List list = memberService.profile(map);
		map = (Map) list.get(0);

		model.addAttribute("name", map.get("m_name"));
		model.addAttribute("regdate", map.get("regdate"));
		model.addAttribute("id", map.get("m_id"));

		return "profile";

	}

	@RequestMapping(value = "/dueDate", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String dueDate(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		List result = memberService.dueDate(map);
		return new Gson().toJson(map.get("day"));
	}

	@RequestMapping(value = "/listTitleUpdate", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String listTitleUpdate(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		int result = memberService.updateList(map);

		if (0 == result) {
			return new Gson().toJson("success");
		} else {
			return new Gson().toJson("fail");

		}
	}

	@RequestMapping(value = "/boardTitleUpdate", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String boardTitleUpdate(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		int result = memberService.updateBoard(map);

		if (0 == result) {
			return new Gson().toJson("success");
		} else {
			return new Gson().toJson("fail");

		}
	}

	@RequestMapping(value = "/cardTitleUpdate", method = { RequestMethod.POST,
			RequestMethod.GET }, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String cardTitleUpdate(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {
		System.out.println("cardUPdate:" + map);
		int result = memberService.updateCard(map);
		System.out.println("cardUPdate:" + result);

		return new Gson().toJson("success");
		/*
		 * if (0 == result) { } else { return new Gson().toJson("fail");
		 * 
		 * }
		 */
	}
}

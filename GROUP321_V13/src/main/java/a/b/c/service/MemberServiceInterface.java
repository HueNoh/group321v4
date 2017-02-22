package a.b.c.service;

import java.util.List;
import java.util.Map;

public interface MemberServiceInterface {

	public int loginChk(Map map);

	public List searchBoard(Map map);

	public List searchList(Map map);

	public List searchCard(Map map);

	public List selectCardDetail(Map map);

	public List selectBoardMember(Map map);

	public int msgInsert(Map map) throws Exception;

	public List msgSelect(Map map) throws Exception;

	public List insertBoard(Map map);

	public List insertList(Map map);

	public int updateList(Map map);

	public List insertCard(Map map);

	public int addCardReply(Map map);

	public List moveList(Map map);

	public List moveCard(Map map);

	public void insertHistory(Map map);

	public List selectHistory(Map map);

	public List updateContent(Map map);

	public List memberConnection(Map map);

	int insertMember(Map map) throws Exception;

	public int chkIdDup(Map map);

	public List updateLabel(Map map);

	public String selectLabel(Map map);

	public List selectBoardMembers(Map map);

	public List searchMembers(Map map);

	public int addMembers(Map map);

	public int removeMembers(Map map);

	public List selectLink(Map map);

	public List profile(Map map);

	public int insertLink(Map map);

	public int deleteLink(Map map);

	public Map selectBoardOne(Map map);

	public int deleteBoard(Map map);

	public String selectLabelName(Map map);

	public List updateLabelName(Map map);

	public List searchFilter(Map map);

	public int deleteList(Map map);

	public int deleteCard(Map map);

	public List searchLabel(Map map);

	public List dueDate(Map map);
}

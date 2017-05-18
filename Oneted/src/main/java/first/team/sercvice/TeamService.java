package first.team.sercvice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TeamService {

	Map<String, Object> selectTeamInfo(Map<String, Object> map);

	List<Map<String, Object>> selectTeamMember(Map<String, Object> map);

	Map<String, Object> selectMemberInfo(Map<String, Object> map);

	Map<String, Object> selectTeamContact(Map<String, Object> map);

//	List<Map<String, Object>> selectBoardList(Map<String, Object> map);
	Map<String, Object> selectBoardList(Map<String, Object> map);

	void insertBoard(Map<String, Object> map, HttpServletRequest request);

	void updateBoard(Map<String, Object> map, HttpServletRequest request);
	
	void deleteBoard(Map<String, Object> map);

	void teamApply(Map<String, Object> map, HttpServletRequest request);

	void teamLeave(Map<String, Object> map, HttpServletRequest request);
}
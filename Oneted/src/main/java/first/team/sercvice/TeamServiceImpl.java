package first.team.sercvice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.util.FileUtils;
import first.team.dao.TeamDAO;

@Service("teamService")
public class TeamServiceImpl implements TeamService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="teamDAO")
	private TeamDAO teamDAO;

	@Override
	public Map<String, Object> selectTeamInfo(Map<String, Object> map) {
		Map<String, Object> returnMap = new HashMap<String,Object>();
		
		returnMap.put("TEAMINFO", teamDAO.selectTeamInfo(map));
		returnMap.put("CHECKSTATUS", teamDAO.checkStatus(map));
		returnMap.put("RECENTBOARD", teamDAO.selectBoard(map));
		returnMap.put("RECENTUSER", teamDAO.selectUSER(map));
		
		returnMap.put("TOTALUSER", teamDAO.totalUser(map));
		returnMap.put("INGUSER", teamDAO.ingUser(map));		
		return returnMap;
	}

	@Override
	public List<Map<String, Object>> selectTeamMember(Map<String, Object> map) {
		return teamDAO.selectTeamMember(map);
	}

	@Override
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) {
		return teamDAO.selectMemberInfo(map);
	}

	@Override
	public Map<String, Object> selectTeamContact(Map<String, Object> map) {
		return teamDAO.selectTeamContact(map);
	}

//	@Override
//	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
//		return teamDAO.selectBoardList(map);
//	}
	@Override
	public Map<String, Object> selectBoardList(Map<String, Object> map) {
		return teamDAO.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) {
		teamDAO.inserBoard(map);
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) {
		teamDAO.updateBoard(map);
	}
	
	@Override
	public void deleteBoard(Map<String, Object> map) {
		teamDAO.deleteBoard(map);
	}

	@Override
	public void teamApply(Map<String, Object> map, HttpServletRequest request) {
		teamDAO.teamApply(map);
	}

	@Override
	public void teamLeave(Map<String, Object> map, HttpServletRequest request) {
		teamDAO.teamLeave(map);
	}
}
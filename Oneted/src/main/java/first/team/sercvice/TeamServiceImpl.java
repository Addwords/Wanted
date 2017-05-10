package first.team.sercvice;

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
		return teamDAO.selectTeamInfo(map);
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
}
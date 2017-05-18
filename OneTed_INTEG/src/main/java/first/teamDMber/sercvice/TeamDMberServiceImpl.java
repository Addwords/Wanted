package first.teamDMber.sercvice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.util.FileUtils;
import first.teamDMber.dao.TeamDMberDAO;

@Service("teamDMberService")
public class TeamDMberServiceImpl implements TeamDMberService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="teamDMberDAO")
	private TeamDMberDAO teamDMberDAO;

	@Override
	public Map<String, Object> selectTeamInfo(Map<String, Object> map) {
		Map<String, Object> returnMap = new HashMap<String,Object>();
		
		returnMap.put("TEAMINFO", teamDMberDAO.selectTeamInfo(map));
		returnMap.put("CHECKSTATUS", teamDMberDAO.checkStatus(map));
		returnMap.put("RECENTBOARD", teamDMberDAO.selectBoard(map));
		returnMap.put("RECENTUSER", teamDMberDAO.selectUSER(map));
		
		returnMap.put("TOTALUSER", teamDMberDAO.totalUser(map));
		returnMap.put("INGUSER", teamDMberDAO.ingUser(map));	
		return returnMap;
	}

	@Override
	public List<Map<String, Object>> selectTeamMember(Map<String, Object> map) {
		return teamDMberDAO.selectTeamMember(map);
	}

	@Override
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) {
		return teamDMberDAO.selectMemberInfo(map);
	}

	@Override
	public Map<String, Object> selectTeamContact(Map<String, Object> map) {
		return teamDMberDAO.selectTeamContact(map);
	}

//	@Override
//	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
//		return teamDAO.selectBoardList(map);
//	}
	@Override
	public Map<String, Object> selectBoardList(Map<String, Object> map) {
		return teamDMberDAO.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) {
		teamDMberDAO.inserBoard(map);
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) {
		teamDMberDAO.updateBoard(map);
	}
	
	@Override
	public void deleteBoard(Map<String, Object> map) {
		teamDMberDAO.deleteBoard(map);
	}

	@Override
	public void teamApply(Map<String, Object> map, HttpServletRequest request) {
		teamDMberDAO.teamApply(map);
	}

	@Override
	public void teamLeave(Map<String, Object> map, HttpServletRequest request) {
		teamDMberDAO.teamLeave(map);
	}
	
	@Override
	public void accept(Map<String, Object> map) {
		// TODO Auto-generated method stub
		teamDMberDAO.accept(map);
	}

}
package first.teamMber.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.teamMber.dao.TeamMberDAO;

@Service("teamMberService")
public class TeamMberServiceImpl implements TeamMberService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "teamMberDAO")
	private TeamMberDAO teamMberDAO;

	@Override
	public void leader(Map<String, Object> map) throws Exception {
		teamMberDAO.leader(map);
		
	}

	@Override
	public void apply(Map<String, Object> map) throws Exception {
		teamMberDAO.apply(map);
		
	}

	@Override
	public void invite(Map<String, Object> map) throws Exception {
		teamMberDAO.invite(map);
		
	}
	@Override
	public Map<String, Object> inviteValidate(Map<String, Object> map) throws Exception {
		return teamMberDAO.inviteValidate(map);
	}

	@Override
	public void accept(Map<String, Object> map) throws Exception {
		teamMberDAO.accept(map);
		
	}

	@Override
	public void leave(Map<String, Object> map) throws Exception {
		teamMberDAO.leave(map);
		
	}
	
	@Override
	public void decline(Map<String, Object> map) throws Exception {
		teamMberDAO.decline(map);
		
	}

	@Override
	public void disband(Map<String, Object> map) throws Exception {
		teamMberDAO.disband(map);
		
	}

	@Override
	public List<Map<String, Object>> selApplicant(Map<String, Object> map) throws Exception {
		return teamMberDAO.selApplicant(map);
	}

	@Override
	public List<Map<String, Object>> selInvitation(Map<String, Object> map) throws Exception {
		return teamMberDAO.selInvitation(map);
	}

	@Override
	public List<Map<String, Object>> selTeamMember(Map<String, Object> map) throws Exception {
		return teamMberDAO.selTeamMember(map);
	}

	@Override
	public Map<String, Object> selTeamLeader(Map<String, Object> map) throws Exception {
		return teamMberDAO.selTeamLeader(map);
	}

	@Override
	public List<Map<String, Object>> selLeaderTeam(Map<String, Object> map) throws Exception {
		return teamMberDAO.selLeaderTeam(map);
	}

	@Override
	public List<Map<String, Object>> selMyTeam(Map<String, Object> map) throws Exception {
		return teamMberDAO.selMyTeam(map);
	}
	

}

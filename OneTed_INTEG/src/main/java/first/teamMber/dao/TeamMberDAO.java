package first.teamMber.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("teamMberDAO")
public class TeamMberDAO extends AbstractDAO{

	public void leader(Map<String, Object> map) throws Exception{
		insert("teamMber.leader", map);
	}
	public void apply(Map<String, Object> map) throws Exception{
		insert("teamMber.apply", map);
	}
	public void invite(Map<String, Object> map) throws Exception{
		insert("teamMber.invite", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> inviteValidate(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("teamMber.inviteValidate", map);
	}
	public void accept(Map<String, Object> map) throws Exception{
		update("teamMber.accept", map);
	}
	public void leave(Map<String, Object> map) throws Exception{
		update("teamMber.leave", map);
	}
	public void decline(Map<String, Object> map) throws Exception{
		update("teamMber.decline", map);
	}
	public void disband(Map<String, Object> map) throws Exception{
		update("teamMber.disband", map);
	}

	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>>  selApplicant(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("teamMber.selApplicant", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selInvitation(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("teamMber.selInvitation", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selTeamMember(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("teamMber.selTeamMember", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selTeamLeader(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("teamMber.selTeamLeader", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selLeaderTeam(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("teamMber.selLeaderTeam", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selMyTeam(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("teamMber.selMyTeam", map);
	}
}

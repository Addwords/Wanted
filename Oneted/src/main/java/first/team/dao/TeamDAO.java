package first.team.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("teamDAO")
public class TeamDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchTeamList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("team.searchTeamList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchProjectList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("team.searchProjectList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("team.selectTeamList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("team.selectProjectList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeam(Map<String, Object> map) throws Exception{
		System.out.println("durl");
		return (List<Map<String, Object>>)selectPagingList("team.selectTeamOne", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProject(Map<String, Object> map) throws Exception{
		System.out.println("durl");
		return (List<Map<String, Object>>)selectPagingList("team.selectProjectOne", map);
	}

}

package first.team.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("teamDAO")
public class TeamDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTeamInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("team.selectTeamInfo", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeamMember(Map<String, Object> map) {
		return selectList("team.selectTeamMember", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("team.selectMemberInfo", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTeamContact(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("team.selectTeamContact", map);
	}

	// @SuppressWarnings("unchecked")
	// public List<Map<String, Object>> selectBoardList(Map<String, Object> map)
	// {
	// return selectList("team.selectBoardList",map);
	// }
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardList(Map<String, Object> map) {
		return selectPagingList("team.selectBoardList", map);
	}

	public void inserBoard(Map<String, Object> map) {
		insert("team.insertBoard", map);
	}

	public void updateBoard(Map<String, Object> map) {
		update("team.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) {
		update("team.deleteBoard", map);
	}

	@SuppressWarnings("unchecked")
	public  Map<String, Object>  checkStatus(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("team.checkStatus",map);
	}

	public void teamApply(Map<String, Object> map) {
		insert("team.teamApply", map);
	}

	public void teamLeave(Map<String, Object> map) {
		insert("team.teamLeave", map);
	}

	public Object selectBoard(Map<String, Object> map) {
		return selectList("team.selectBoard", map);
	}

	public Object selectUSER(Map<String, Object> map) {
		return selectList("team.selectUser", map);
	}

	public Object totalUser(Map<String, Object> map) {
		return selectOne("team.totalUser", map);
	}

	public Object ingUser(Map<String, Object> map) {
		return selectOne("team.ingUser", map);
	}
}
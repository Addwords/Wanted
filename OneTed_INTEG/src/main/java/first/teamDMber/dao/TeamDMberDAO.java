package first.teamDMber.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("teamDMberDAO")
public class TeamDMberDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTeamInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("teamDMber.selectTeamInfo", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeamMember(Map<String, Object> map) {
		return selectList("teamDMber.selectTeamMember", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInfo(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("teamDMber.selectMemberInfo", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTeamContact(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("teamDMber.selectTeamContact", map);
	}

	// @SuppressWarnings("unchecked")
	// public List<Map<String, Object>> selectBoardList(Map<String, Object> map)
	// {
	// return selectList("team.selectBoardList",map);
	// }
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardList(Map<String, Object> map) {
		return selectPagingList2("teamDMber.selectBoardList", map);
	}

	public void inserBoard(Map<String, Object> map) {
		insert("teamDMber.insertBoard", map);
	}

	public void updateBoard(Map<String, Object> map) {
		update("teamDMber.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) {
		update("teamDMber.deleteBoard", map);
	}

	@SuppressWarnings("unchecked")
	public  Map<String, Object>  checkStatus(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("teamDMber.checkStatus",map);
	}

	public void teamApply(Map<String, Object> map) {
		insert("teamDMber.teamApply", map);
	}

	public void teamLeave(Map<String, Object> map) {
		insert("teamDMber.teamLeave", map);
	}

	public Object selectBoard(Map<String, Object> map) {
		return selectList("teamDMber.selectBoard", map);
	}
	public void accept(Map<String, Object> map) {
		update("teamDMber.accept", map);
	}

	public Object selectUSER(Map<String, Object> map) {
		return selectList("teamDMber.selectUser", map);
	}

	public Object totalUser(Map<String, Object> map) {
		return selectOne("teamDMber.totalUser", map);
	}

	public Object ingUser(Map<String, Object> map) {
		return selectOne("teamDMber.ingUser", map);
	}
}

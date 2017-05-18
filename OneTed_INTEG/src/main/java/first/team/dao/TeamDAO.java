package first.team.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("teamDAO")
public class TeamDAO extends AbstractDAO {

	// 팀 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchTeamList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("team.searchTeamList", map);
	}

	// 프로젝트 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchProjectList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("team.searchProjectList", map);
	}

	// 팀 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("team.selectTeamList", map);
	}

	// 프로젝트 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("team.selectProjectList", map);
	}

	// 팀 디테일
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTeam(Map<String, Object> map) throws Exception {
		System.out.println("durl");
		return (Map<String, Object>) selectOne("team.selectTeamOne", map);
	}

	// 프로젝트 디테일
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProject(Map<String, Object> map) throws Exception {
		System.out.println("durl");
		return (List<Map<String, Object>>) selectPagingList("team.selectProjectOne", map);
	}

	// 내 팀 보기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myTeam(Map<String, Object> map) throws Exception {
		System.out.println("durl");
		return (List<Map<String, Object>>) selectPagingList("teamMber.selMyTeam", map);
	}

	// 내 프로젝트 보기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myProject(Map<String, Object> map) throws Exception {
		System.out.println("durl");
		return (List<Map<String, Object>>) selectPagingList("team.myProject", map);
	}

	// 프로젝트 멤버
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectProjectMember(Map<String, Object> map) {
		return selectList("team.selectProjectMember", map);
	}

	// 팀만들기
	public void createTeam(Map<String, Object> map) {
		insert("team.createTeam", map);
	}

}

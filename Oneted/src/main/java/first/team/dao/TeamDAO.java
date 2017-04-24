package first.team.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("teamDAO")
public class TeamDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("team.selectTeamList", map);
	}
}
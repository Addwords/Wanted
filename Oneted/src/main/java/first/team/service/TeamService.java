package first.team.service;

import java.util.List;
import java.util.Map;


public interface TeamService {

	List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectProjectList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectTeam(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectProject(Map<String, Object> map) throws Exception;

}

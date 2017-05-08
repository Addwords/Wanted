package first.team.service;

import java.util.List;
import java.util.Map;


public interface TeamService {

	List<Map<String, Object>> searchTeamList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> searchProjectList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectProjectList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectTeam(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectProject(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> myTeam(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> myProject(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectTeamInfo(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectProjectInfo(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectTeamMember(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectProjectMember(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception;

}

package first.teamMber.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TeamMberService {	

	void leader(Map<String, Object> map) throws Exception;
	
	void apply(Map<String, Object> map) throws Exception;
	
	void invite(Map<String, Object> map) throws Exception;
	
	Map<String, Object> inviteValidate(Map<String, Object> map) throws Exception;
	
	void accept(Map<String, Object> map) throws Exception;
	
	void leave(Map<String, Object> map) throws Exception;
	
	void decline(Map<String, Object> map) throws Exception;
	
	void disband(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selApplicant(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selInvitation(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selTeamMember(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selTeamLeader(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selLeaderTeam(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selMyTeam(Map<String, Object> map) throws Exception;


	

}

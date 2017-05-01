package first.team.sercvice;

import java.util.List;
import java.util.Map;

public interface TeamService {

	Map<String, Object> selectTeamInfo(Map<String, Object> map);

	List<Map<String, Object>> selectTeamMember(Map<String, Object> map);

	Map<String, Object> selectMemberInfo(Map<String, Object> map);
	
}
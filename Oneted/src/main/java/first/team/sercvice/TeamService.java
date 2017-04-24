package first.team.sercvice;

import java.util.List;
import java.util.Map;

public interface TeamService {
	List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception;
}
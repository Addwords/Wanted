package first.team.sercvice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.util.FileUtils;
import first.team.dao.TeamDAO;

@Service("teamService")
public class TeamServiceImpl implements TeamService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="teamDAO")
	private TeamDAO teamDAO;
	
	@Override
	public List<Map<String, Object>> selectTeamList(Map<String, Object> map) throws Exception {
		return teamDAO.selectTeamList(map);
	}

}

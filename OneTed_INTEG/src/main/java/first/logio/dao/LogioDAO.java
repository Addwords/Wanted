package first.logio.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("logioDAO")
public class LogioDAO extends AbstractDAO{


	@SuppressWarnings("unchecked")
	public Map<String, Object> login(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("logio.login", map);
	}


}

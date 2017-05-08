package first.mberlog.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("mLogDAO")
public class MLogDAO extends AbstractDAO{

	public void createLog(Map<String, Object> map) throws Exception{
		insert("mberLog.createLog", map);
	}	

	public void inLog(Map<String, Object> map) throws Exception{
		update("mberLog.inLog", map);
	}
	
	public void outLog(Map<String, Object> map) throws Exception{
		update("mberLog.outLog", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> searchLog(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mberLog.searchLog", map);
	}

}

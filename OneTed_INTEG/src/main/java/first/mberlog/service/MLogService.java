package first.mberlog.service;

import java.util.Map;

public interface MLogService {	

	void createLog(Map<String, Object> map) throws Exception;
	
	void inLog(Map<String, Object> map) throws Exception;
	
	void outLog(Map<String, Object> map) throws Exception;
	
	Map<String, Object> searchLog(Map<String, Object> map) throws Exception;

}

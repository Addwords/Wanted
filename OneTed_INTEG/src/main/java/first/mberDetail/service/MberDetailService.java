package first.mberDetail.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MberDetailService {

	Map<String, Object> selectMberDetail(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMberList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMberSkill(Map<String, Object> map)  throws Exception;

	void insertMberSkill(Map<String, Object> map, HttpServletRequest request);

	void insertMberInfo(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectMberWrite(Map<String, Object> map) throws Exception;

	
}

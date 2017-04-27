package first.message.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MsgService {

	List<Map<String, Object>> listMsg(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> searchSenderMsg(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> searchSubjectMsg(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> searchContentsMsg(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> searchWritedayMsg(Map<String, Object> map) throws Exception;

	void sendMsg(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> detailMsg(Map<String, Object> map) throws Exception;

	void delMsg(Map<String, Object> map) throws Exception;
	


}

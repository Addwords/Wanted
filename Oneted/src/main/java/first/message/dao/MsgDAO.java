package first.message.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("msgDAO")
public class MsgDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> listMsg(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("message.listMsg", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchSenderMsg(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("message.searchSenderMsg", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchSubjectMsg(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("message.searchSubjectMsg", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchContentsMsg(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("message.searchContentsMsg", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchWritedayMsg(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("message.searchWritedayMsg", map);
	}

	public void sendMsg(Map<String, Object> map) throws Exception{
		insert("message.sendMsg", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> detailMsg(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("message.detailMsg", map);
	}

	
	public void delMsg(Map<String, Object> map) throws Exception{
		update("message.delMsg", map);
	}

}

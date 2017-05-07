package first.mber.pool.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("mberDAO")
public class MberDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMberList(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectPagingList("mber.selectMberList", map, 12);
	}

	public void insertChoice(Map<String, Object> map) throws Exception {
		insert("mber.insetChoice", map);
	}

	public void initGenie(Map<String, Object> map) throws Exception {
		update("mber.initGenie", map);
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Map<String, Object>> selectGenieList(Map<String, Object> map) throws Exception {
		return (ArrayList<Map<String, Object>>) selectList("mber.smartSearch", map);
	}

}

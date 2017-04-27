package first.mber.pool.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("mberDAO")
public class MberDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMberList(Map<String, Object> map) {
		return (Map<String, Object>)selectPagingList("mber.selectMberList", map, 12);
	}

}

package first.oneted.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectlogin(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("login.selectlogin", map);
	}


}

package first.register.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;

@Repository("regDAO")
public class RegDAO extends AbstractDAO{

	public void register(Map<String, Object> map) throws Exception{
		insert("register.register", map);
	}
	
	public void delUser(Map<String, Object> map) throws Exception{
		update("register.delUser", map);
	}

	public void updateUser(Map<String, Object> map) throws Exception{
		update("register.updateUser", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> regValidateEmail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("register.regValidateEmail", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> regValidateName(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("register.regValidateName", map);
	}


}

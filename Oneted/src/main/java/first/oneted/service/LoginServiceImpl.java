package first.oneted.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.oneted.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	Logger log = Logger.getLogger(this.getClass());
	

	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;
	
	@Override
	public List<Map<String, Object>> selectlogin(Map<String, Object> map) throws Exception {
		
		return loginDAO.selectlogin(map);
	}



}

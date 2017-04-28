package first.register.service;


import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.util.FileUtils;
import first.register.dao.RegDAO;

@Service("regService")
public class RegServiceImpl implements RegService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "regDAO")
	private RegDAO regDAO;

	@Override
	public void register(Map<String, Object> map) throws Exception {
		regDAO.register(map);
	}

	@Override
	public void delUser(Map<String, Object> map) throws Exception {
		regDAO.delUser(map);
	}

	@Override
	public void updateUser(Map<String, Object> map) throws Exception {
		regDAO.updateUser(map);
	}

	@Override
	public Map<String, Object> regValidate(Map<String, Object> map) throws Exception {		
		return regDAO.regValidate(map);
	}



}

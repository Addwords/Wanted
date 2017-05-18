package first.logio.service;


import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import first.common.util.FileUtils;
import first.logio.dao.LogioDAO;


@Service("logioService")
public class LogioServiceImpl implements LogioService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Resource(name = "logioDAO")
	private LogioDAO logioDAO;


	@Override
	public Map<String, Object> login(Map<String, Object> map) throws Exception {		
		return logioDAO.login(map);
	}

}
